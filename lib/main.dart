// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meep/pages/home_page.dart';
import 'package:meep/pages/meeting_details.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Proxima Nova',
        
        // primaryTextTheme: ,
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id:(context) => HomePage(),
        MeetingDetails.id:(context) => MeetingDetails(),
      },
    );
  }
}

//360x800