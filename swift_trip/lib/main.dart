import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:swift_trip/screen/destination.dart';
import 'package:swift_trip/widgets/SearchDropdown.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyAbOuPoknoeCX0tor56aWcI0-p0_uIoDwI',
          authDomain: 'madproject-6891b.firebaseapp.com',
          projectId: 'madproject-6891b',
          storageBucket: 'madproject-6891b.firebasestorage.app',
          messagingSenderId: '736157463174',
          appId: '1:736157463174:android:66c8f463f5edd74d69d707',
        ),
      );
    } else {
      await Firebase.initializeApp();
    }

    print('firebase is running');
  } catch (e, stack) {
    print('Firebase initialization failed: $e');
    print(stack);
  }

  runApp(
    MaterialApp(
      title: 'Tourist App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFDFF2FE)),
      home: Scaffold(body: Center(child: CityDropdown(cities: ["Lahore", "Karachi", "Islamabad"], value: "", hintText: "Select City", onChanged: (value) {}))),
    ),
  );
}
