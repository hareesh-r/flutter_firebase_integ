import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(title),
          subtitle: Text(
            subTitle,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
