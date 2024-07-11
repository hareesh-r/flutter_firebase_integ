import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication/components/my_back_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: (context, snapshot) {
            // Loading...
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Error
            else if (snapshot.error != null) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }

            // Data recieved
            else if (snapshot.hasData) {
              Map<String, dynamic>? user = snapshot.data!.data();
              if (user != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50,left: 25),
                        child: Row(
                          children: [
                            CustomBackButton()
                          ],
                        ),
                      ),

                      const SizedBox(height: 25,),


                      // profile pic 
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(25),
                        child: const Icon(Icons.person, size: 64,),

                      ),

                      const SizedBox(height: 25,),

                      // username
                      Text(user['username'].toString().toUpperCase(), style: const TextStyle( fontSize: 24, fontWeight: FontWeight.bold,)),

                      const SizedBox(height: 10),

                      // email
                      Text(user['email'], style: TextStyle( color: Theme.of(context).colorScheme.secondary)),
                    ],
                  ),
                );
              }
              return const Center(
                child: Text("No data found"),
              );
            } else {
              return const Center(
                child: Text("No data found"),
              );
            }
          }),
    );
  }
}
