import 'package:chat_app_cool/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../components/wall_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   // user
    final currentUser = FirebaseAuth.instance.currentUser!;

    // text controller
    final textController = TextEditingController();

  // sign user out
  void signOut () {
  FirebaseAuth.instance.signOut();
  }

   // post message
    void postMessage () {
      // only post if there is something in the textfield
      if (textController.text.isNotEmpty) {
         // store in firebase
        FirebaseFirestore.instance.
        collection("User Posts").add({
          'UserEmail' : currentUser.email,
          'Message' : textController.text,
          'TimeStamp' : Timestamp.now(),
      });
      }
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300 ],
      appBar: 
      AppBar(title: const Text('The Wall'),
     backgroundColor: Colors.grey[900],
      actions: [
        // sign out button
        IconButton(onPressed: signOut, 
        icon: const Icon(Icons.logout)
        )
      ],
      ),
      body:  Center(
        child: Column(
          children: [
             // the wall
             Expanded(
              child: StreamBuilder(
                 stream: FirebaseFirestore.instance.collection("User Posts")
                 .orderBy("TimeStamp",descending: false).snapshots(),
                builder: (context, snapshot) {
                   if (snapshot.hasData) { 
                return 
                ListView.builder(
                  itemCount: snapshot.data!.docs.length,
               itemBuilder: (context, index) {
                  //get the message 
                  final post = snapshot.data!.docs[index];
                  return 
                  WallPost(
                    message: post['Message'],
                    user: post['UserEmail'], 
                    //time: time
                    );
                  }
                );
               } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
               }
               return const Center(
                child: CircularProgressIndicator(),);
              },
            )
          ),
      
             //post message
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  //textfield
                  Expanded(
                    child: MyTextField(
                      controller: textController, 
                      hintText: 'Write something on the wall',
                      obscureText: false
                       )
                      ),
            
                      // post button
                    IconButton(
                      onPressed: postMessage,
                    icon: const Icon(
                      Icons.arrow_circle_up)
                    ),
                ],
              ),
            ),
      
             // logged in as
             Text("Logged in as ${currentUser.email!}",
             style: const TextStyle(color: Colors.grey),
             ),
              const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
} 