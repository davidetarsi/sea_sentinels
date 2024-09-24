import 'package:http/http.dart' as http;
import '../services/auth_service.dart';

class ApiClient extends http.BaseClient {
  final http.Client _inner = http.Client();
  final AuthService _authService = AuthService();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String? token = await _authService.getToken();
    if (token != null) {
      if (_authService.isTokenExpired(token)) {
        try {
          token = await _authService.refreshToken();
        } catch (e) {
          // Se il refresh fallisce, reindirizza l'utente al login
          // Nota: questo richiede un contesto, quindi potrebbe essere necessario
          // gestire questo scenario in modo diverso
          throw Exception('Session expired. Please log in again.');
        }
      }
      request.headers['Authorization'] = 'Bearer $token';
    }
    return _inner.send(request);
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    String? token = await _authService.getToken();
    headers ??= {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return _inner.get(url, headers: headers);
  }

  // Implementa altri metodi HTTP (post, put, delete, etc.) in modo simile
}
