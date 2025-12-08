import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/screen/destination.dart';
import 'package:swift_trip/widgets/buttons.dart';
import 'package:swift_trip/services/booking_service.dart';

class PaymentScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? selectedPackages;
  final int groupSize;
  final int totalPrice;
  const PaymentScreen({
    super.key,
    this.selectedPackages,
    required this.groupSize,
    required this.totalPrice,
  });
  @override
  State<PaymentScreen> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 4;
  String selectedPaymentMethod = "Cash";

  @override
  Widget build(context) {
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
                Text(
                  "Payment and Confirmation",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text("Selected Package:", style: TextStyle(fontSize: 15)),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(
                      widget.selectedPackages![0]['package']['title']
                          .toString(),
                    ),
                    subtitle: Text("Quantity: ${widget.groupSize}"),
                    trailing: Text(
                      "Rs ${widget.totalPrice}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Payment Method",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        RadioListTile(
                          title: Text("Cash"),
                          value: "Cash",
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value.toString();
                            });
                          },
                        ),

                        RadioListTile(
                          title: Text("EasyPaisa"),
                          value: "EasyPaisa",
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value.toString();
                            });
                          },
                        ),

                        RadioListTile(
                          title: Text("JazzCash"),
                          value: "JazzCash",
                          groupValue: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Continue Button
                Buttons(
                  nextScreen: destination(),
                  disabledContinueButton:
                      widget.selectedPackages == null ||
                      widget.selectedPackages!.isEmpty,
                      confirmPayment: () async {
                    final pkg = widget.selectedPackages![0]['package']
                        as Map<String, dynamic>;

                    // You must ensure you have the package doc ID available:
                    final String packageId = pkg['id']; // e.g. from Firestore doc.id
                    final String userId =
                        'CURRENT_USER_ID'; // get from FirebaseAuth.currentUser!.uid
                    final int seats = widget.groupSize;
                    final double pricePerPerson =
                        (pkg['price'] as num).toDouble();

                    try {
                      await BookingService().bookPackage(
                        packageId,
                        userId,
                        seats,
                        pricePerPerson,
                      );

                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking saved successfully'),
                        ),
                      );
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Booking failed: $e'),
                        ),
                      );
                      // Re-throw if you want to stop navigation
                      throw e;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
