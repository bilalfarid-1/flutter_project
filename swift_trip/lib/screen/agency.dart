import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/screen/destination.dart';

class Agency extends StatefulWidget {
  const Agency({super.key});
  @override
  _Agency createState() => _Agency();
}

class _Agency extends State<Agency> {
  int selectedIndex =1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: Appbar(
        selectedIndex: selectedIndex,
      )),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 156, 207, 231), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Choose Your Travel Partner",
                  style: TextStyle(fontSize: 18),
                ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 15),
                        child: Text(
                          "Select from our trusted travel agencies",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.add_a_photo, size: 50),
                                        Text("Mountain \nAdventures"),
                                        Text("Rs\n5000"),
                                      ],
                                    ),
                                    Text("⭐ 4.8 (200 reviews)"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 300,
                                        child: GridView(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 5,
                                        ),
                                          shrinkWrap: true,
                                        children: [
                                            Card(child: Center(child: Text("Mountain Tours"))),
                                            Card(child: Center(child: Text("Adventure Travels"))),
                                            Card(child: Center(child: Text("Photography"))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.location_on_outlined, size: 50),
                                        Text("City \nExplorers"),
                                        Text("Rs\n4000"),
                                      ],
                                    ),
                                    Text("⭐ 4.6 (150 reviews)"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 300,
                                        child: GridView(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 5,
                                        ),
                                          shrinkWrap: true,
                                        children: [
                                            Card(child: Center(child: Text("City Tours"))),
                                            Card(child: Center(child: Text("Cultural Experiences"))),
                                            Card(child: Center(child: Text("Food & Dining"))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => destination()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                              child: Text("Back", style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                              child: Text("Select", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
