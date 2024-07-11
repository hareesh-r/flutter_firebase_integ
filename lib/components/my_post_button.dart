import 'package:flutter/material.dart';

class CustomPostButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomPostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(left: 16),
        child: Center(
          child: Icon(Icons.done, color: Theme.of(context).colorScheme.inversePrimary,),
        ),
      ),
    );
  }
}
