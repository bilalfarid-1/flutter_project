import 'package:flutter/material.dart';
import 'package:swift_trip/screen/Appbar.dart';
import 'package:swift_trip/screen/agency.dart';

class CustomTour extends StatefulWidget {
  const CustomTour({super.key});
  @override
  State<CustomTour>createState() => _CustomTourState();
}

class _CustomTourState extends State<CustomTour> {
   int selectedIndex =0;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: Appbar(
      selectedIndex: selectedIndex,
    ),
  ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 156, 207, 231), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Select Your Journey",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 15),
                      child: Text(
                        "Choose your departure and arrival cities",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "From",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Departure City",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "To",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Arrival City",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Agency()));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                            left: 50,
                            right: 50,
                          ),
                          child: Text("Continue", style: TextStyle()),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
