import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   // user
   final currentuser = FirebaseAuth.instance.currentUser!;
   //edit field
   Future<void> editField(String field) async {

   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
        children: [
           const SizedBox(
            height: 50,
            ),
         // PROFILE PIC
        const Icon(
          Icons.person,
           size: 72,
         ),

        const SizedBox(height: 10,),

         // USER EMAIL
         Text(
          currentuser.email!,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[700]),
         ),
        const SizedBox(height: 50,),
        //User Details
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'My Details',
            style: TextStyle(color: Colors.grey[600]),
          ),
          ),
         // USERNAME
           MyTextBox(
            text: 'WayneTipsy', 
            sectionName: 'Etoniru',
            onPressed: () => editField('username')
            ),

         // BIO
         MyTextBox(
            text: 'empty bio', 
            sectionName: 'bio',
            onPressed: () => editField('bio')
            ),

             const SizedBox(height: 50,),

         // USER POSTS
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'My Posts',
            style: TextStyle(color: Colors.grey[600]),
          ),
          ),

        ],
      ),
    );
  }
}