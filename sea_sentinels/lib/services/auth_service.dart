import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://your_server_ip:3000/api/user';

  Future<String> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      await _saveToken(token);
      return token;
    } else {
      throw Exception(response.body);
    }
  }

  Future<String> refreshToken() async {
    final currentToken = await getToken();
    if (currentToken == null) {
      throw Exception('No token to refresh');
    }

    final response = await http.post(
      Uri.parse('$baseUrl/refresh-token'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $currentToken',
      },
    );

    if (response.statusCode == 200) {
      final newToken = jsonDecode(response.body)['token'];
      await _saveToken(newToken);
      return newToken;
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  bool isTokenExpired(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return true;
    }

    final payload = json.decode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))
    );
    final exp = payload['exp'];
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    return now >= exp;
  }

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      await _saveToken(token);
      return token;
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}