import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.secondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
