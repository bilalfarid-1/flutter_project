import 'dart:io';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});

  @override
  State<SignupScreen> createState() {
    return SignupScreenState();
  }
}

class SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Image.asset('assets/images/logo1.png'),
        Text('Plan Smarter. Travel Better'),
        Form(
          child: Column(
            spacing: 20,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Full Name',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter you Password',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Re-Enter you Password',
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Create Account')),
              Text("Already have Account? Login"),
            ],
          ),
        ),
      ],
    );
  }
}
