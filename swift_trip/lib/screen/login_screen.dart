import 'dart:io';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
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
                  hintText: 'Enter you Email',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter you Password',
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Login')),
              TextButton(onPressed: () {}, child: Text('Forgot Password')),
              Text("Don't have Account? Sign up"),
            ],
          ),
        ),
      ],
    );
  }
}
