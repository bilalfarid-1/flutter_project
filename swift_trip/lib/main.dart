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
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 156, 207, 231),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Image.asset('assets/images/logo1.png'),
              Text('Plan Smarter. Travel Better'),
                Form(
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter you Email',
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter you Password',
                        ),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text('Login')),
                      TextButton(onPressed: (){}, child: Text('Forgot Password')),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

