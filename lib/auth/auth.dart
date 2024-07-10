import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/login_or_oauth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          // User Logged in
          if(snapshot.hasData) {
            return const HomePage();
          } 
          // User not loggedin
          else{
            return const LoginOrRegister();
          }
        }
      ),
    );
  }
}