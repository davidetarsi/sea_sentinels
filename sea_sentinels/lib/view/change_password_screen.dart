import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sea_sentinels/view/login_screen.dart';
import 'package:sea_sentinels/view/widget/login_textfield.dart';
import 'package:sea_sentinels/view/widget/my_scaffold.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      backButton: false,
      title: 'Change Password',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            LoginTextField(
              controller: _oldPasswordController,
              text: 'Actual password',
              icon: Icons.lock_open_outlined,
              isPassword: true,
            ),
            SizedBox(height: 20),
            LoginTextField(
              controller: _newPasswordController,
              text: 'New password',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            SizedBox(height: 20),
            LoginTextField(
              controller: _confirmPasswordController,
              text: 'Confirm new password',
              icon: Icons.lock_reset_outlined,
              isPassword: true,
            ),
            SizedBox(height: 20),
            UserButton(
              onTap: () {
                _isLoading ? null : _changePassword();
              },
              text: 'Cambia password',
            ),
          ],
        ),
      ),
    );
  }

  void _changePassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Re-autenticazione per sicurezza
          AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!,
            password: _oldPasswordController.text,
          );

          await user.reauthenticateWithCredential(credential);

          // Aggiornamento della password
          await user.updatePassword(_newPasswordController.text);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password updated!')),
          );

          Navigator.pop(context); // Torna alla pagina del profilo
        }
      } on FirebaseAuthException catch (e) {
        String message = 'Errore sconosciuto';
        if (e.code == 'wrong-password') {
          message = 'Actual password is wrong.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
