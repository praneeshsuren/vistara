import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              //Logo
              Icon(
                Icons.lock_open_rounded, 
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 50),

              //Welcome Back Msg
              Text(
                "Welcome back, you've been missed!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 50),


              //Email Textfield


              //Password Textfield


              //Login Button


              //Not a member? Register Now!


            ]
          ),
        ),
      )
    );
  }
}
