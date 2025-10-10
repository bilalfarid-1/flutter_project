import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(context) {
    return Text("Welcome to main screen");
  }
}
