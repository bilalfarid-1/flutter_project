import 'package:flutter/material.dart';

class CustomTour extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Custom Tour Creation")),
      ),
      body:  SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Destination"),
            Text("Agency"),
            Text("Planning"),
            Text("Summary"),
            Text("Payment")
          ],
        ),
      ),
    );
  }
}