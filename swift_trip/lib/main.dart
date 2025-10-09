import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp()
  ,);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD Project',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.white
            ])
          ),
          child: Column(
            children: [
              Image.asset('name'),
              Text('Plan Smarter. Travel Better'),
              Container(
                child: Column(
                  children: [
                    TextField(),
                    TextField(),
                    TextButton(onPressed: (){}, child: Text('Login')),
                    ElevatedButton(onPressed: (){}, child: Text('Forgot Password')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

