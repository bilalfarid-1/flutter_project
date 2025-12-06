import 'package:flutter/material.dart';
import 'package:swift_trip/screen/Appbar.dart';
import 'package:swift_trip/screen/Package.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_trip/widgets/SearchDropdown.dart';

class destination extends StatefulWidget {
  const destination({super.key});
  @override
  State<destination> createState() => _destinationState();
}

class _destinationState extends State<destination> {
  String fromCity = "";
  String toCity = "";
  int selectedIndex = 0;

  List<String> cities = [];

  Future<void> fetchCities() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('packages')
          .get();

      final packages = snapshot.docs.map((doc) => doc.data()).toList();

      cities = packages.map((p) => p['fromCity'].toString()).toList()
        ..addAll(packages.map((p) => p['toCity'].toString()));

      cities = cities.toSet().toList();
      setState(() {});
    } catch (e) {
      print("Error fetching cities: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Appbar(selectedIndex: selectedIndex),
      ),
      body: SizedBox(
        height: double.infinity,
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.place, color: Colors.blue),
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CityDropdown(
                              cities: cities,
                              value: fromCity,
                              hintText: "Departure City",
                              onChanged: (value) {
                                setState(() => fromCity = value ?? "");
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.place, color: Colors.red),
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CityDropdown(
                              cities: cities,
                              value: toCity,
                              hintText: "Arrival City",
                              onChanged: (value) {
                                setState(() => toCity = value ?? "");
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                width: 500,
                                height: 105,
                                child: Card(
                                  color: Color(0xffEFF6FF),
                                  elevation: 1,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 5,
                                                      ),
                                                  child: Icon(
                                                    Icons.explore,
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                                Text(
                                                  "Route Preview",
                                                  style: TextStyle(
                                                    color: Color(0xff1C398E),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 0,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              fromCity,
                                              style: TextStyle(
                                                color: Color(0xff1447E6),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Color(0xff1447E6),
                                            ),
                                            Text(
                                              toCity,
                                              style: TextStyle(
                                                color: Color(0xff1447E6),
                                              ),
                                            ),
                                          ],
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PackageScreen(
                              fromLocation: fromCity,
                              toLocation: toCity,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Continue", style: TextStyle()),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
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
