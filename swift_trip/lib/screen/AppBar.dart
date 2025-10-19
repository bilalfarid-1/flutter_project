import 'package:flutter/material.dart';
import 'package:swift_trip/screen/agency.dart';
import 'package:swift_trip/screen/destination.dart';
import 'package:swift_trip/screen/login_screen.dart';
import 'package:swift_trip/screen/planning_screen.dart';

class Appbar extends StatelessWidget {
  final int selectedIndex;
  const Appbar({super.key, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: IconButton(
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Center(
                    child: Text(
                      "Custom Tour Creation",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonBuild(context, 0, "Destination"),
                buttonBuild(context, 1, "Agency"),
                buttonBuild(context, 2, "Planning"),
                buttonBuild(context, 3, "Summary"),
                buttonBuild(context, 4, "Payment"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonBuild(BuildContext context, int index, String title) {
    bool match = selectedIndex == index;
    return TextButton(
      onPressed: () {
        if (index == 0) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => destination()),);
        }
        if (index == 1)Navigator.push(context, MaterialPageRoute(builder: (_) => Agency()));
          if (index == 2) {
            Navigator.push(context,MaterialPageRoute(builder: (_) => PlanningScreen()),);
          }
      },
      child: Text(
        title,
        style: TextStyle(
          color: match ? Colors.blueAccent : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
