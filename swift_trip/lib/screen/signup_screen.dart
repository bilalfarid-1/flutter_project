import 'package:flutter/material.dart';
import 'package:swift_trip/screen/login_screen.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo1.png',
                    width: 96,
                    height: 96,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Plan Smarter. Travel Better',
                    style:
                        Theme.of(context).textTheme.titleLarge ??
                        const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                const SizedBox(height: 18),
                Column(
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
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Create Account'),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text('Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ], // end inner Column children
                ), // end inner Column
              ], // end outer Column children
            ), // end outer Column
          ), // end Padding
        ), // end SingleChildScrollView
      ), // end SafeArea
    );
  }
}
