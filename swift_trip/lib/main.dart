import 'package:flutter/material.dart';
import 'package:swift_trip/screen/login_screen.dart';

void main() {
  runApp(
     MaterialApp(
      title: 'Tourist App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFDFF2FE),
          ),
      home:  LoginScreen(),
      ),
  );
}
