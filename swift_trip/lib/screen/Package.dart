import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/screen/buttons.dart';
import 'package:swift_trip/screen/payment_screen.dart';

class PackageScreen extends StatefulWidget {
  final String fromLocation;
  final String toLocation;
  const PackageScreen({super.key, required this.fromLocation, required this.toLocation});
  @override
  _PackageScreen createState() => _PackageScreen();
}

class _PackageScreen extends State<PackageScreen> {
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
                Text("Choose Your Package", style: TextStyle(fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 15),
                  child: Text(
                    "Select a package from the options below:",
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
                                            child: Text("Mountain Tours"),
                                          ),
                                        ),
                                        Card(
                                          child: Center(
                                            child: Text("Adventure Travels"),
                                          ),
                                        ),
                                        Card(
                                          child: Center(
                                            child: Text("Photography"),
                                          ),
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
                                          child: Center(
                                            child: Text("City Tours"),
                                          ),
                                        ),
                                        Card(
                                          child: Center(
                                            child: Text("Cultural Experiences"),
                                          ),
                                        ),
                                        Card(
                                          child: Center(
                                            child: Text("Food & Dining"),
                                          ),
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

                Buttons(nextScreen: PaymentScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
