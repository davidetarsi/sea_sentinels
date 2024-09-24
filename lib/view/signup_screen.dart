import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/view/home_tab_screen.dart';
import 'package:sea_sentinels/view/login_screen.dart';
import 'package:sea_sentinels/view/widget/login_textfield.dart';
import 'package:sea_sentinels/view/widget/logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _secondPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _errorMessage;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        String uid = userCredential.user!.uid;
        await _firebase.collection('users').doc(uid).set({
        'name': _nameController.text, // Aggiungi il nome
        'email': _emailController.text, // Puoi salvare anche l'email se vuoi
      });
        // Registrazione riuscita, naviga alla schermata successiva
        print("User correctly registered: ${userCredential.user!.uid}");
        Navigator.pushReplacementNamed(context, '/login');
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: kDarkBlue,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.15, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const LogoWidget(size: 180),
                    const SizedBox(height: 20),
                    LoginTextField(
                        text: 'Enter your name',
                        icon: Icons.person_3_outlined,
                        isPassword: false,
                        controller: _nameController),
                    const SizedBox(height: 20),
                    LoginTextField(
                        text: 'Enter your email',
                        icon: Icons.person_outline,
                        isPassword: false,
                        controller: _emailController),
                    const SizedBox(height: 20),
                    LoginTextField(
                        text: 'Enter your password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: _passwordController),
                    const SizedBox(height: 20),
                    LoginTextField(
                        text: 'Repeat your password',
                        icon: Icons.lock_outline,
                        isPassword: true,
                        controller: _secondPasswordController,
                        checkPassword: true,
                        checker: _passwordController),
                    const SizedBox(height: 30),
                    UserButton(
                      text: 'Sign up',
                      onTap: registerUser,
                    ),
                    const SizedBox(height: 20),
                    AuthOptionsText(
                        text: 'Already have an account? ',
                        buttonText: 'Login',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeTabScreen()));
                          /*  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen())); */
                        }),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
