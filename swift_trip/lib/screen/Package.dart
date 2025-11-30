import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/widgets/buttons.dart';
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
  List<int> selectedPackage = [];
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SizedBox(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Choose Your Package",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 15),
                        child: Text(
                          packages.isNotEmpty
                              ? "Select a package from the options below:"
                              : "No packages found for the selected route.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      buildPackageCard(),
                      Buttons(nextScreen: PaymentScreen()),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildPackageCard() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: packages.length,
      itemBuilder: (context, index) {
        final package = packages[index];
        return InkWell(
          onTap: () {
            setState(() {
              if (selectedPackage.contains(index)) {
                selectedPackage.remove(index);
              } else {
                selectedPackage = [index];
              }
            });
          },
          child: Card(
            color: selectedPackage.isNotEmpty && selectedPackage.contains(index)
                ? Colors.blue.shade100
                : Colors.white,
            elevation: selectedPackage.contains(index) ? 6 : 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: selectedPackage.contains(index)
                    ? Colors.blue
                    : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.network(
                    package['imageUrl'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "${package['title']}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
