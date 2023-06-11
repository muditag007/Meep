// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:meep/pages/agenda_page.dart';
import 'package:meep/pages/home_page.dart';
import 'package:meep/pages/meet_timer_page.dart';
import 'package:meep/pages/meet_wait_page.dart';
import 'package:meep/pages/meeting_details.dart';
import 'package:meep/pages/mom_notifications.dart';
import 'package:meep/pages/previous_meet_page.dart';
import 'package:meep/pages/profile_page.dart';
import 'package:meep/pages/signin_page.dart';
import 'package:meep/pages/temp.dart';
import 'package:meep/pages/waiting_page.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/login_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final controller = Get.put(LoginController());

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
        primarySwatch: Colors.grey,
      ),
      // initialRoute: HomePage.id,
      initialRoute: SignInPage.id,
      // initialRoute: Temp.id,
      routes: {
        MeetTimerPage.id: (context) => MeetTimerPage(),
        SignInPage.id: (context) => SignInPage(),
        Temp.id: (context) => Temp(),
        ProfilePage.id: (context) => ProfilePage(),
        MomNotifications.id: (context) => MomNotifications(),
        HomePage.id: (context) => HomePage(),
        PreviousMeetPage.id: (context) => PreviousMeetPage(),
      },
    );
  }
}

//360x800

