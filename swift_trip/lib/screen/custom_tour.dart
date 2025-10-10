import 'package:flutter/material.dart';

class CustomTour extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Tour Creation"),
      ),
      body:  Container(
        height: 100,
        child: Container(
          height: 100,
          width: 100,
          child: Text("data"))
        ),
    );
  }
}