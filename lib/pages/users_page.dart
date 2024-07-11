import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication/components/my_back_button.dart';
import 'package:firebase_authentication/components/my_custom_tile.dart';
import 'package:firebase_authentication/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            // any errors
            if (snapshot.hasError) {
              displayMessageToUser(snapshot.error.toString(), context);
            }

            // show loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return const Text("No Data found for users..");
            }

            // get all users
            final users = snapshot.data!.docs;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 25),
                  child: Row(
                    children: [CustomBackButton()],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // list of users in the app
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      // get individual user
                      final user = users[index];

                      String email = user['email'];
                      String username = user['username'];

                      return CustomListTile(title: email,subTitle: username);
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
