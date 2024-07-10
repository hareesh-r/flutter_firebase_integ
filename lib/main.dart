import 'package:firebase_authentication/auth/auth.dart';
import 'package:firebase_authentication/auth/login_or_oauth.dart';
import 'package:firebase_authentication/firebase_options.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/pages/profile_page.dart';
import 'package:firebase_authentication/pages/users_page.dart';
import 'package:firebase_authentication/theme/dark_mode.dart';
import 'package:firebase_authentication/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => const UserPage(),
      },
    );
  }
}
