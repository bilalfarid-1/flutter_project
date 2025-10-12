import 'package:flutter/material.dart';

class appBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 100,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  "Custom Tour Creation",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Destination", style: TextStyle(fontSize: 16)),
                  Text("Agency", style: TextStyle(fontSize: 16)),
                  Text("Planning", style: TextStyle(fontSize: 16)),
                  Text("Summary", style: TextStyle(fontSize: 16)),
                  Text("Payment", style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
    );
  }
}