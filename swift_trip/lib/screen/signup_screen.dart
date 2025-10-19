import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
   const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() {
    return SignupScreenState();
  }
}

class SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Image.asset('assets/images/logo1.png'),
            Text('Plan Smarter. Travel Better'),
            SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Name",
                      hintText: 'Name',
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
        ),
      ),
    );
  }
}
