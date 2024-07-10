import 'package:flutter/material.dart';

void displayMessageToUser(String message,BuildContext context) {
  showDialog(context: context, builder: (context)=>AlertDialog(title: Text(message, style: TextStyle(color: Theme.of(context).colorScheme.secondary),)));
}