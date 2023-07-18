import 'package:chat_app_cool/components/text_field.dart';
import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
            const SizedBox(height: 50),
              // Logo
              const  Icon(
                  Icons.lock,
                  size: 100,
                  ),
                   const  SizedBox(height: 50),
               // welcome back message
                const  Text("Welcome back, you've been missed!",
                  ),
                   const  SizedBox(height: 25),
          
                // email textfield
                MyTextField(
                  controller: emailTextController,
                  hintText: 'email',
                  obscureText: false
                  )
                
                // password textfield
          
                // sign in button
          
                // go to register page
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}