import 'package:flutter/material.dart';
import 'package:swift_trip/screen/AppBar.dart';
import 'package:swift_trip/screen/destination.dart';

class Agency extends StatefulWidget {
  const Agency({super.key});
  @override
  _Agency createState() => _Agency();
}

class _Agency extends State<Agency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 156, 207, 231), Colors.white],
          ),
        ),
        child: Column(
          children: [
            Appbar(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Choose Your Travel Partner",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 15),
              child: Text(
                "Select from our trusted travel agencies",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.account_circle, size: 50),
                          Text("Mountain \nAdventures"),
                          Text("Rs\n5000"),
                        ],
                      ),
                    ),
<<<<<<< HEAD
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CustomTour()),
                    );
                  },
                  child: Text("Back"),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Select")),
              ],
            ),
=======
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => destination()));
                        },
                        child: Text("Back"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Select"),
                      ),
                    ],
                  )
>>>>>>> e280f3fc1b716e7b6c026e21f57e0976481e7452
          ],
        ),
      ),
    );
  }
}
