import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Widget nextScreen;
  final bool disabledContinueButton;
  final Future<void> Function()? confirmPayment;

  const Buttons({
    super.key,
    required this.nextScreen,
    required this.disabledContinueButton,
    this.confirmPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Text("Back", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: disabledContinueButton
                ? (null)
                : () async {
                    if (confirmPayment != null) {
                      await confirmPayment!();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => nextScreen),
                    );
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Row(
                children: [
                  Text("Continue", style: TextStyle(color: Colors.white)),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
