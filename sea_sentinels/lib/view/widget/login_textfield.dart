import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';

class LoginTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final bool checkPassword;
  final TextEditingController? checker;

  const LoginTextField({
    super.key,
    required this.text,
    required this.icon,
    required this.isPassword,
    required this.controller,
    this.checkPassword = false,
    this.checker,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      cursorColor: kBlueGrey,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Insert a valid value';
        }
        if (isPassword && checkPassword && value != checker!.text) {
          return 'The second password does not match';
        }
        if (isPassword && value.length <6) {
          return 'Password must contain at least 6 characters';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      /* keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.datetime, */
      // Cambia il colore del cursore qui
      decoration: InputDecoration(
        labelText: text,
        filled: true,
        fillColor: kBlueGrey.withOpacity(0.3), // Cambia il colore di sfondo qui
        prefixIcon: Icon(
          icon,
          color: kBlueGrey, // Cambia il colore dell'icona qui
        ),
        labelStyle: const TextStyle(
          color: kBlueGrey, // Cambia il colore del testo qui
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: kBlueGrey,
            width: 2, // Cambia il colore del bordo qui
          ),
        ),
        /* enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kBlueGrey, // Cambia il colore del bordo qui
          ),
        ), */
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kBlueGrey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
