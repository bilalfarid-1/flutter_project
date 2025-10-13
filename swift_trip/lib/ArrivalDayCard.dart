import 'package:flutter/material.dart';

class ArrivalDayCard extends StatelessWidget {
  const ArrivalDayCard({super.key});
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
              Text(
                "Arrival Day",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("From: Lahore"),
              Text("Travel Time: 10 hrs"),
              Text("Arrival Time: Around 6 PM"),
              SizedBox(height: 8),
              Text(
                "Meals: Dinner",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Text(
                "Accommodation",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              accommodationTile(
                "Mountain View Resort",
                "Rs. 15,000/night",
                4.6,
                false,
              ),
              accommodationTile("Comfort Inn", "Rs. 8,000/night", 4.2, false),
              accommodationTile(
                "Luxury Palace",
                "Rs. 25,000/night",
                4.9,
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accommodationTile(
    String name,
    String cost,
    double rating,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : null,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
        ),
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
