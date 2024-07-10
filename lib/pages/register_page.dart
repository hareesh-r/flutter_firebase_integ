import 'package:firebase_authentication/components/my_button.dart';
import 'package:firebase_authentication/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key, required this.onTap});

  void register() {
    // show the loading circle 

    // make sure to match both the passwords

    // try creating the user

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),
              // app name

              const Text("H A R E E S H", style: TextStyle(fontSize: 20)),

              const SizedBox(height: 50),

              // username text field
              CustomTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: userNameController),

              const SizedBox(height: 10),
              // email text field
              CustomTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController),

              const SizedBox(height: 10),

              // passowrd textfield
              CustomTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController),

              const SizedBox(height: 10),

              // confirm passowrd textfield
              CustomTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmPasswordController),

              const SizedBox(height: 10),
              // forot passowrd
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  )
                ],
              ),

              const SizedBox(height: 25),

              // sign in button
              CustomButton(text: "Login", onTap: register),

              const SizedBox(height: 25),

              // don't have an account ? register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      " Login Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
