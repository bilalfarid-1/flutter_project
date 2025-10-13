import 'package:flutter/material.dart';
import 'package:swift_trip/screen/agency.dart';
import 'package:swift_trip/screen/destination.dart';
import 'package:swift_trip/screen/planning_screen.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text("Custom Tour Creation", style: TextStyle(fontSize: 22)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CustomTour()),
                    );
                  },
                  child: Text("Destination", style: TextStyle(fontSize: 16)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Agency()),
                    );
                  },
                  child: Text("Agency", style: TextStyle(fontSize: 16)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PlanningScreen()),
                    );
                  },
                  child: Text("Planning", style: TextStyle(fontSize: 16)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CustomTour()),
                    );
                  },
                  child: Text("Summary", style: TextStyle(fontSize: 16)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Payment", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
