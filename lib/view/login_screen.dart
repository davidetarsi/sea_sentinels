import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/view/home_tab_screen.dart';
import 'package:sea_sentinels/view/signup_screen.dart';
import 'package:sea_sentinels/view/widget/login_textfield.dart';
import 'package:sea_sentinels/view/widget/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthOptionsText extends StatelessWidget {
  const AuthOptionsText(
      {super.key,
      required this.text,
      required this.buttonText,
      required this.onTap});
  final String text;
  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          //'Don\'t have an account? ',
          text,
          style: const TextStyle(color: kBlueGrey),
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            buttonText,
            style: const TextStyle(
              color: kYellow,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: kYellow,
            ),
          ),
        ),
      ],
    );
  }
}

class UserButton extends StatelessWidget {
  const UserButton({super.key, required this.text, required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          // Cambia il colore del bottone qui
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return kYellow;
              }
              return kYellow;
            }),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: kDarkBlue, // Cambia il colore del testo qui
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("Login correct: ${userCredential.user!.uid}");
      // Login riuscito, naviga alla schermata successiva
      //Navigator.pushReplacementNamed(context, '/home');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeTabScreen()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
        /* ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message!))); */
      });
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // Step 1: Avvia il processo di login con Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // L'utente ha annullato il login
        //return null;

        // Step 2: Ottenere i dettagli di autenticazione dalla richiesta
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Step 3: Creare una credenziale di Firebase con il token di Google
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Step 4: Usare la credenziale per fare il login su Firebase
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Step 5: Ottenere l'utente autenticato
        final User? user = userCredential.user;

        if (user != null) {
          print("Login con Google riuscito: ${user.uid}");
          // Login riuscito, naviga alla schermata successiva
          //Navigator.pushReplacementNamed(context, '/home');
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomeTabScreen()));

          // Ritorna l'utente autenticato
          //return user;
        }
      }
    } catch (e) {
      print("Errore durante il login con Google: $e");
      //return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: kDarkBlue,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.15, 20, 0),
              child: Column(
                children: [
                  const LogoWidget(size: 180),
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
                  const SizedBox(height: 30),
                  UserButton(
                      text: 'Login',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeTabScreen()));
                      } //loginUser,
                      ),
                  const SizedBox(height: 20),
                  AuthOptionsText(
                    text: 'Or sign in with your ',
                    buttonText: 'Google Account',
                    onTap: signInWithGoogle,
                  ),
                  const SizedBox(height: 10),
                  AuthOptionsText(
                      text: 'Don\'t have an account? ',
                      buttonText: 'Sign up with email',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      }),
                  if (errorMessage != null)
                    Text(errorMessage!,
                        style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
