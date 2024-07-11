import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication/components/my_custom_tile.dart';
import 'package:firebase_authentication/components/my_drawer.dart';
import 'package:firebase_authentication/components/my_post_button.dart';
import 'package:firebase_authentication/components/my_textfield.dart';
import 'package:firebase_authentication/database/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Text controller
    final TextEditingController newPostController = TextEditingController();

    // firestore instance
    final FirestoreDatabase database = FirestoreDatabase();

    // Handle posting message logic
    void postMessage() {
      // only post if the message isn't empty
      if (newPostController.text.isNotEmpty) {
        String message = newPostController.text;
        database.addPost(message);
      }

      // clear the controller
      newPostController.clear();
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("W A L L"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          // Textfield box for user to type
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      hintText: "Say Something...",
                      obscureText: false,
                      controller: newPostController),
                ),
                // post button
                CustomPostButton(
                  onTap: postMessage,
                )
              ],
            ),
          ),

          // posts
          StreamBuilder(
              stream: database.getPosts(),
              builder: (context, snapshot) {
                // Show loading circle
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // get all posts
                final posts = snapshot.data!.docs;

                // no data
                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text("No posts yet...."),
                    ),
                  );
                }

                // return as list
                return Expanded(
                    child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];
                    return CustomListTile(title: message, subTitle: userEmail);
                  },
                ));
              })
        ],
      ),
    );
  }
}
