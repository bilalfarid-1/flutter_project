import 'package:flutter/material.dart';
import 'package:swift_trip/screen/Appbar.dart';
import 'package:swift_trip/ArrivalDayCard.dart';
import 'package:swift_trip/DayViseCard.dart';
import 'package:swift_trip/BottomButtons.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: Appbar(
        selectedIndex: selectedIndex,
      )),
      body: SizedBox(
        height: double.infinity,
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Plan Your Journey",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Create your day-by-day itinerary",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              ArrivalDayCard(),

              DayViseCard(),

              BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }
}