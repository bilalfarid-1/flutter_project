import 'package:flutter/material.dart';

class CustomTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Custom Tour Creation"))),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 156, 207, 231),
              Colors.white
            ])
          ),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Destination"),
                    Text("Agency"),
                    Text("Planning"),
                    Text("Summary"),
                    Text("Payment"),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 156, 207, 231),
              Colors.white
            ])
          ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("Select Your Journey", style: TextStyle(fontSize: 18),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 15),
                    child: Text("Choose your departure and arrival cities", style: TextStyle(fontSize: 15),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("From",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Departure City"
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("To",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Arrival City"
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent
                    ), child: 
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15,left: 50,right: 50),
                        child: Text("Continue", style: TextStyle(),),
                      )
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
