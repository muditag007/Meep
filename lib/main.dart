// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meep/pages/home_page.dart';
import 'package:meep/pages/meeting_details.dart';
import 'package:meep/pages/mom_notifications.dart';
import 'package:meep/pages/previous_meet_page.dart';
import 'package:meep/pages/profile_page.dart';

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
        // fontFamily: GoogleFonts.,
        // primaryTextTheme: ,
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.id,
      routes: {
        ProfilePage.id:(context) => ProfilePage(),
        MomNotifications.id:(context) => MomNotifications(),
        HomePage.id:(context) => HomePage(),
        MeetingDetails.id:(context) => MeetingDetails(),
        PreviousMeetPage.id: (context) => PreviousMeetPage(),
      },
    );
  }
}

//360x800