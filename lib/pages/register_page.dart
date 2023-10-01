import 'package:flutter/material.dart';
import '../components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
     // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
   
   // sign user up
 void signUp() async {
  // show loading circle
   showDialog(context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
     ),
    );  
       // make sure passwords match
       if (passwordTextController.text != confirmPasswordTextController.text) {
      // pop loading circle
        Navigator.pop(context);
          // show error to user
          
          return;
       }
        //try creating the user
        try {
          await FirebaseAuth.instance.
          createUserWithEmailAndPassword(
            email: emailTextController.text,
            password: passwordTextController.text
            );
            // pop loading circle
         if (context.mounted) Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
           // pop loading circle
           Navigator.pop(context);
           // show error to user
           displayMessage(e.code);
        }
    }

        // display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: 
            const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            //const SizedBox(height: 50),
              // Logo
              const  Icon(
                  Icons.lock,
                  size: 100,
                  ),
                   const  SizedBox(height: 50),
               // welcome back message
                  Text("Lets create an account for you",
                  style: TextStyle(
                    color: Colors.grey[700]
                  ),
                  ),
                   const  SizedBox(height: 25),
          
                // email textfield
                MyTextField(
                  controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false
                  ),

                const  SizedBox(height: 10,),
                
                // password textfield

                 MyTextField(
                  controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true
                  ),

                  const  SizedBox(height: 10,),
                
                // password textfield

                 MyTextField(
                  controller: confirmPasswordTextController,
                  hintText: 'Confirm Password',
                  obscureText: true
                  ),

               const SizedBox(height: 20,),
          
                // sign in button

                MyButton(
                  onTap: signUp,
                  text: 'Sign Up'
                  ),
             const  SizedBox(height: 10,),
                // go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),
                    ), 
                   const SizedBox(width: 5),
                   GestureDetector(
                    onTap: widget.onTap,
                     child: const Text("Login now",
                      style: TextStyle(
                       fontWeight: FontWeight.bold,
                        color: Colors.blue
                       ),
                      ),
                   ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}