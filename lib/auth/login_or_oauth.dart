import 'package:firebase_authentication/pages/login_page.dart';
import 'package:firebase_authentication/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => __LoginOrRegisterStateState();
}

class __LoginOrRegisterStateState extends State<LoginOrRegister> {

  bool showLoginPage = true;

  void togglePages(){
    setState((){
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages);
    }else{
      return RegisterPage(onTap: togglePages);
    }
  }
}