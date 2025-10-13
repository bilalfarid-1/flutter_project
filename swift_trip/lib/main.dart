import 'package:flutter/material.dart';
import 'package:swift_trip/screen/login_screen.dart';

void main() {
  runApp(
     MaterialApp(
      title: 'MAD Project',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 156, 207, 231),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
          child: LoginScreen(),
        ),
      ),
    )
  );
}
