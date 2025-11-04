import 'package:flutter/material.dart';
import 'package:swift_trip/screen/Appbar.dart';
import 'package:swift_trip/screen/agency.dart';

class destination extends StatefulWidget {
  const destination({super.key});
  @override
  State<destination> createState() => _destinationState();
}

class _destinationState extends State<destination> {
  String fromCity = "";
  String toCity = "";
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> cities = ["Islamabad", "Lahore", "Karachi", "Peshawar"];
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
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffF9FAFB),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                  ),
                                  hintText: "Departure City",
                                ),
                                items: cities.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    fromCity = value.toString();
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.place, color: Colors.green),
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffF9FAFB),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                  ),
                                  hintText: "Arrival City",
                                ),
                                items: cities.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    toCity = value.toString();
                                  });
                                },
                              ),
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
                          MaterialPageRoute(builder: (context) => Agency()),
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
