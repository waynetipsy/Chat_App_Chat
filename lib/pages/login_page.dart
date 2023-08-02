import 'package:chat_app_cool/components/text_field.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

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
                  Text("Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Colors.grey[700]
                  ),
                  ),
                   const  SizedBox(height: 25),
          
                // email textfield
                MyTextField(
                  controller: emailTextController,
                  hintText: 'email',
                  obscureText: false
                  ),

                  SizedBox(height: 10,),
                
                // password textfield

                 MyTextField(
                  controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true
                  ),

                  SizedBox(height: 20,),
          
                // sign in button

                MyButton(
                  onTap: () {},
                  text: 'Sign In'
                  ),
               SizedBox(height: 10,),
                // go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),
                    ),
                   GestureDetector(
                    onTap: () {
                      
                    },
                     child: const Text("Register now",
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