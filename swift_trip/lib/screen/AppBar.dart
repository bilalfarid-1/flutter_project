import 'package:flutter/material.dart';
import 'package:swift_trip/screen/Package.dart';
import 'package:swift_trip/screen/destination.dart';
import 'package:swift_trip/screen/login_screen.dart';
import 'package:swift_trip/screen/payment_screen.dart';

class Appbar extends StatelessWidget {
  final int selectedIndex; 
  const Appbar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final double progress = (selectedIndex + 1) / 3; 

    return Container(
      height: 120,
      width: double.infinity,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 25),
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

          // your step buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buttonBuild(context, 0, "Destination"),
              buttonBuild(context, 1, "Package"),
              buttonBuild(context, 2, "Payment"),
            ],
          ),

          // progress line bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,   
                minHeight: 3,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
              ),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => destination()));
        } else if (index == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PackageScreen()));
        } else if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => PaymentScreen()));
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
