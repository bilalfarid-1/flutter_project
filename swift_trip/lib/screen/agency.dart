import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/screen/destination.dart';
import 'package:swift_trip/screen/planning_screen.dart';

class Agency extends StatefulWidget {
  const Agency({super.key});
  @override
  _Agency createState() => _Agency();
}

class _Agency extends State<Agency> {
  int selectedIndex = 1;
  int selectedAgency = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Appbar(selectedIndex: selectedIndex),
      ),
      body: SizedBox(
        height: double.infinity,
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedAgency = 0;
                          });
                        },
                        child: Card(
                          color: selectedAgency == 0
                              ? Colors.blue.shade100
                              : Colors.white,
                          elevation: selectedAgency == 0 ? 6 : 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: selectedAgency == 0
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: Colors.brown,
                                    ),
                                    Text("Mountain \nAdventures"),
                                    Text("Rs\n5000"),
                                  ],
                                ),
                                Text("⭐ 4.8 (200 reviews)"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: GridView(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 5,
                                      ),
                                      shrinkWrap: true,
                                      children: [
                                        Card(
                                          child: Center(
                                              child: Text("Mountain Tours")),
                                        ),
                                        Card(
                                          child: Center(
                                              child:
                                                  Text("Adventure Travels")),
                                        ),
                                        Card(
                                          child: Center(
                                              child: Text("Photography")),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedAgency = 1;
                          });
                        },
                        child: Card(
                          color: selectedAgency == 1
                              ? Colors.blue.shade100
                              : Colors.white,
                          elevation: selectedAgency == 1 ? 6 : 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: selectedAgency == 1
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 50,
                                      color: Colors.green,
                                    ),
                                    Text("City \nExplorers"),
                                    Text("Rs\n4000"),
                                  ],
                                ),
                                Text("⭐ 4.6 (150 reviews)"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: GridView(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 5,
                                      ),
                                      shrinkWrap: true,
                                      children: [
                                        Card(
                                          child: Center(child: Text("City Tours")),
                                        ),
                                        Card(
                                          child: Center(
                                              child:
                                                  Text("Cultural Experiences")),
                                        ),
                                        Card(
                                          child: Center(
                                              child: Text("Food & Dining")),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => destination(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, color: Colors.black),
                            Text("Back", style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PlanningScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Row(
                          children: [
                            Text("Continue", style: TextStyle(color: Colors.white)),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
