import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/view/change_password_screen.dart';
import 'package:sea_sentinels/view/home_tab_screen.dart';
import 'package:sea_sentinels/view/login_screen.dart';
import 'package:sea_sentinels/view/widget/logo.dart';
import 'package:sea_sentinels/view/widget/my_scaffold.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final diveListAsync = ref.watch(getAllDivesProvider);
    final firebaseInstance = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    String? userName;

    Future<void> logoutUser() async {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      print("Utente disconnesso");
      Navigator.pushReplacementNamed(context, '/login');
    }

    Future<void> changePassword() async {
      Navigator.of(context).push(ModalBottomSheetRoute(
        isScrollControlled: true,
        builder: (ctx) {
          return LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) =>
                  SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: ChangePasswordScreen()));
        },
      ));
    }

    Future<void> fetchUserName() async {
      try {
        if (user != null) {
          String userId = user.uid;
          DocumentSnapshot userRef =
              await firebaseInstance.collection('users').doc(userId).get();
          if (userRef.exists && userRef.data() != null) {
            setState(() {
              userName = userRef.get('name');
              print('!!!!Daje nome cambiato!!!!');
            });
          }
        }
      } catch (e) {
        print("Errore durante il fetch del nome utente: $e");
      }
    }

    @override
    void initState() {
      super.initState();
      fetchUserName();
    }

    return MyScaffold(
      backButton: false,
      padding: false,
      title: "Profile",
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: kDarkBlue,
        ),
        child: diveListAsync.when(
          data: (diveList) {
            int divesNumber = diveList.length;
            return Center(
              child: Column(
                children: [
                  const LogoWidget(size: 300),
                  const SizedBox(height: 30),
                  const Text(
                    //'Welcome $userName!',
                    'Welcome!',
                    style: TextStyle(
                      color: kYellow,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 5),
                    child: UserButton(
                        text: 'Change password', onTap: changePassword),
                  ),
                  //const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: UserButton(text: 'Logout', onTap: logoutUser),
                  ),
                  /* TextBorder(
                    title: 'Immersions made: ',
                    text: '$divesNumber',
                  ),
                  TextBorder(
                    title: 'Fish species seen: ',
                    text: diveList
                        .expand((dive) => dive.fishList)
                        .toSet()
                        .length
                        .toString(),
                  ), */
                ],
              ),
            );
          },
          error: (err, stack) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
