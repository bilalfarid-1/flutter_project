import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  @override
  State<PaymentScreen> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 4;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Appbar(selectedIndex: selectedIndex),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  Text(
                    "Payment & Confirmation",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Complete your booking",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
