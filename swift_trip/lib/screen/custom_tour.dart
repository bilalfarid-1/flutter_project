import 'package:flutter/material.dart';

class CustomTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Custom Tour Creation"))),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Destination"),
                  Text("Agency"),
                  Text("Planning"),
                  Text("Summary"),
                  Text("Payment"),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 156, 207, 231),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Select Your Journey", style: TextStyle(fontSize: 18),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Choose your departure and arrival cities", style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
