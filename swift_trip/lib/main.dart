import 'package:flutter/material.dart';
import 'package:swift_trip/screen/login_screen.dart';

void main() {
  runApp(
     MaterialApp(
      title: 'MAD Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFDFF2FE),
          ),
      home:  LoginScreen(),
      ),
  );
}
