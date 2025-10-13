import 'package:flutter/material.dart';

class DayViseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Day 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("Meals: Breakfast", style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 12),
              Text("Activities", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              activityTile("Shangrila Lake Visit", "3 hrs", "Rs. 5,000"),
              activityTile("Mountain Hiking", "5 hrs", "Rs. 5,000"),
              activityTile("Photography Tour", "4 hrs", "Rs. 6,000"),
              SizedBox(height: 12),
              Text("Add Activity", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              activityTile("Cultural Village Visit", "2 hrs", "Rs. 3,000"),
              SizedBox(height: 12),
              Text("Accommodation", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              accommodationTile("Mountain View Resort", "Rs. 15,000/night", 4.6, false),
              accommodationTile("Comfort Inn", "Rs. 20,000/night", 4.9, false),
              accommodationTile("Luxury Palace", "Rs. 25,000/night", 4.8, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget activityTile(String title, String duration, String cost) {
    return ListTile(
      leading: Icon(Icons.check_circle_outline),
      title: Text(title),
      subtitle: Text(duration),
      trailing: Text(cost),
    );
  }

  Widget accommodationTile(String name, String cost, double rating, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : null,
        border: Border.all(color: isSelected ? Colors.blue : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.hotel),
        title: Text(name),
        subtitle: Text("⭐ $rating"),
        trailing: Text(cost),
      ),
    );
  }
}