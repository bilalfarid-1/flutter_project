import 'package:flutter/material.dart';
import 'package:swift_trip/screen/Appbar.dart';
import 'package:swift_trip/screen/planning_screen.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Appbar(selectedIndex: 3),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("Tour Summary", style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Text(
                  "Review your customized tour package",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.all(30),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Itenary", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(left: BorderSide(color: Colors.grey)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text : TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Arrival Day",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "\n\t\tMountain view resort",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tEvening dinner",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                          
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(left: BorderSide(color: Colors.grey)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Day 1",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "\n\t\tBreakfast at resort",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tHiking and sightseeing",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tLunch at local restaurant",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tEvening bonfire",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(left: BorderSide(color: Colors.grey)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Day 2",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "\n\t\tBreakfast at resort",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tVisit local market",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tLunch at cafe",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tRelax at resort",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(left: BorderSide(color: Colors.grey)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Departure Day",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "\n\t\tBreakfast at resort",
                                  ),
                                  TextSpan(
                                    text: "\n\t\tCheck-out and transfer to airport",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Card(
                  margin: EdgeInsets.all(30),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Cost", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Accommodation: Rs 10,000"),
                        Text("Activities: Rs 5,000"),
                        Text("Meals: Rs 3,000"),
                        Divider(height: 20, color: Colors.black),
                        Text("Grand Total: Rs 18,000", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => PlanningScreen()));
                  },
                    style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                   child: Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                     child: Row(
                       children: [
                          Icon( Icons.arrow_back, color: Colors.black,),
                         Text("Back", style: TextStyle(color: Colors.black)),
                       ],
                     ),
                   )),
                  ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Row(
                      children: [
                        Text("Proceed to Payment",style: TextStyle(color: Colors.white),),
                        Icon(Icons.arrow_forward, color: Colors.white,),
                      ],
                    ),
                  )),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
