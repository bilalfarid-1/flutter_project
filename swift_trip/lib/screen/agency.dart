import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';

class agency extends StatefulWidget {
  @override
  _agency createState() => _agency();
}

class _agency extends State<agency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: appBar()
      ),
    );
  }
}
