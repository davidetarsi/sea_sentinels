import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/view/login_screen.dart';
import 'package:sea_sentinels/view/register_screen_deprecated.dart';
import 'package:sea_sentinels/viewmodel/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: kLightDarkBlue,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: kDarkBlue,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() async {
  try{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  } catch (e) {
    print('Error: $e');
  } 

  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isConncted = ref.read(connectivityProvider);
    return MaterialApp(
        routes: {
          '/register': (context) => const RegisterScreen(),
          '/login': (context) => const LoginScreen(),
        },
        // ...
        theme: theme,
        home: const LoginScreen()
        //home: CollectionScreen(fishList),
        );
  }
}
