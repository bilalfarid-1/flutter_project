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
                  TextButton(onPressed: () {
                    
                  }, child: Text("Destination", style: TextStyle(fontSize: 16))),
                  TextButton(onPressed: () {
                    
                  }, child: Text("Agency", style: TextStyle(fontSize: 16))),
                  TextButton(onPressed: () {
                    
                  }, child: Text("Planning", style: TextStyle(fontSize: 16))),
                  TextButton(onPressed: () {
                    
                  }, child: Text("Summary", style: TextStyle(fontSize: 16))),
                  TextButton(onPressed: () {
                    
                  }, child: Text("Payment", style: TextStyle(fontSize: 16))),
                ],
              ),
            ],
          ),
    );
  }
}