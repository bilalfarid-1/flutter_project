import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/widgets/buttons.dart';
import 'package:swift_trip/screen/payment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_trip/widgets/quantity.dart';

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
  int selectedPackageIndex = -1;
  List<Map<String, dynamic>> packages = [];
  Map<String, dynamic>? selectedPackage;

  bool _isLoading = true;
  int groupSize = 0;
  int totalPrice = 0;

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
        packages = snapshot.docs.map((doc) {
          final data = doc.data();
          return {'id': doc.id, ...data};
        }).toList();
        _isLoading = false;
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
                      Buttons(
                        nextScreen: PaymentScreen(
                          selectedPackage: selectedPackage,
                          groupSize: groupSize,
                          totalPrice: totalPrice,
                          fromCity: widget.fromLocation,
                          toCity: widget.toLocation,
                        ),
                        disabledContinueButton:
                            selectedPackageIndex == -1 || groupSize == 0,
                      ),
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
              if (selectedPackageIndex == index) {
                selectedPackageIndex = -1;
                groupSize = 0;
                totalPrice = 0;
                selectedPackage = null;
              } else {
                selectedPackageIndex = index;
                selectedPackage = package;
              }
            });
          },
          child: Card(
            color: selectedPackageIndex == index
                ? Colors.blue.shade100
                : Colors.white,
            elevation: selectedPackageIndex == index ? 6 : 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: selectedPackageIndex == index
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${package['title']}",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "Description: ${package['description']}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        "Total Seats: ${package['totalSeats']}",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "Price: ${package['price']}",
                        style: TextStyle(fontSize: 14),
                      ),
                      selectedPackage == index
                          ? Text("Total Price: $totalPrice")
                          : SizedBox.shrink(),
                      selectedPackageIndex == index
                          ? QuantityInput(
                              maxQty: package['totalSeats'] ?? 0,
                              onChanged: (value) {
                                setState(() {
                                  groupSize = value;
                                  final seatPrice = (package['price'] ?? 0);
                                  final priceAsDouble = seatPrice is int
                                      ? seatPrice.toDouble()
                                      : seatPrice as double;
                                  totalPrice = (value * priceAsDouble).toInt();
                                });
                              },
                            )
                          : SizedBox.shrink(),
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
