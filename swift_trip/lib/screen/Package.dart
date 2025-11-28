import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/screen/buttons.dart';
import 'package:swift_trip/screen/payment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PackageScreen extends StatefulWidget {
  final String fromLocation;
  final String toLocation;
  const PackageScreen({
    super.key,
    required this.fromLocation,
    required this.toLocation,
  });
  @override
  _PackageScreen createState() => _PackageScreen();
}

class _PackageScreen extends State<PackageScreen> {
  int selectedIndex = 1;
  int selectedAgency = 0;
  List<Map<String, dynamic>> packages = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('packages')
          .where('fromCity', isEqualTo: widget.fromLocation)
          .where('toCity', isEqualTo: widget.toLocation)
          .get();

      setState(() {
        packages = snapshot.docs.map((doc) => doc.data()).toList();
      });
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching packages: $e");
      setState(() {
        packages = [];
      });
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Appbar(selectedIndex: selectedIndex),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Choose Your Package", style: TextStyle(fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 15),
                  child: Text(
                    _isLoading
                            ? "Loading packages..."
                            : "Select a package from the options below: ${packages[0]["title"]}, ${packages.length} packages available.",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Buttons(nextScreen: PaymentScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
