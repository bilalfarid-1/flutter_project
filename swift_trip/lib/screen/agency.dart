import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';

class agency extends StatefulWidget {
  @override
  _agency createState() => _agency();
}

class _agency extends State<agency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 156, 207, 231), Colors.white],
          ),
        ),
        child: Column(
          children: [
            appBar(),
            Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Choose Your Travel Partner",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    child: Text(
                      "Select from our trusted travel agencies",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.account_circle, size: 50),
                              Text("Mountain \nAdventures"),
                              Text("Rs\n5000"),
                          
                            ],
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
