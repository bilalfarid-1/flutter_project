import 'package:flutter/material.dart';
import 'package:swift_trip/screen/Appbar.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Appbar(selectedIndex: 3),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("Tour Summary", style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Text(
                  "Review your customized tour package",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Itenary"),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey)),
                        ),
                        child: Text(
                          "Arrival Day \nMountain view resort \nDinner at resort",
                        ),
                      ),
          
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey)),
                        ),
                        child: Text(
                          "Day 1 \nBreakfast at resort \nHiking and sightseeing \nLunch at local restaurant \nEvening bonfire",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey)),
                        ),
                        child: Text(
                          "Day 2 \nBreakfast at resort \nVisit local market \nLunch at cafe \nRelax at resort",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey)),
                        ),
                        child: Text(
                          "Departure Day \nBreakfast at resort \nCheck-out and transfer to airport",
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
    );
  }
}
