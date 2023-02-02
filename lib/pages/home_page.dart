// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:meep/pages/meeting_details.dart';
import 'package:meep/utils/count_tile.dart';
import 'package:meep/utils/meet_tile.dart';
import 'package:meep/utils/upcoming_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "homepage";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(),
          child: Column(
            children: [
              SizedBox(
                height: 42 / 800 * MediaQuery.of(context).size.height,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 291 / 360 * MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello, Yuvraj!",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        height: 67 / 360 * MediaQuery.of(context).size.width,
                        width: 67 / 360 * MediaQuery.of(context).size.width,
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 36 / 800 * MediaQuery.of(context).size.height,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 318 / 360 * MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CountTile(name: "Meetings", count: "3"),
                      CountTile(name: "Updates", count: "12"),
                      CountTile(name: "Tasks", count: "13"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40 / 800 * MediaQuery.of(context).size.height,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21 / 360 * MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 14 / 800 * MediaQuery.of(context).size.height,
                      ),
                      Container(
                        height: 5,
                        width: 66 / 360 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(154, 154, 154, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20 / 800 * MediaQuery.of(context).size.height,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Meetings for the day",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(77, 77, 77, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 11 / 800 * MediaQuery.of(context).size.height,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MeetingDetails.id);
                          },
                          child: Container(
                            height: 133 /
                                800 *
                                MediaQuery.of(context).size.height,
                            width:
                                319 / 360 * MediaQuery.of(context).size.width,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(69, 68, 68, 0.3),
                                  blurRadius: 25,
                                  spreadRadius: 4,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(
                                  height: 20 /
                                      800 *
                                      MediaQuery.of(context).size.height,
                                ),
                                Text(
                                  "Looks like You have no meetings for today!",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(69, 68, 68, 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // UpcomingTile(),
                      SizedBox(
                        height: 30 / 800 * MediaQuery.of(context).size.height,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Previous Meetings",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(69, 68, 68, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 / 800 * MediaQuery.of(context).size.height,
                      ),
                      MeetTile(
                        name: "Timeline Discussion",
                        date: "22nd Oct'22",
                        time: "20:00",
                        team: "E-Cell",
                      ),
                      MeetTile(
                        name: "Timeline Discussion",
                        date: "22nd Oct'22",
                        time: "20:00",
                        team: "E-Cell",
                      ),
                      MeetTile(
                        name: "Timeline Discussion",
                        date: "22nd Oct'22",
                        time: "20:00",
                        team: "E-Cell",
                      ),
                      MeetTile(
                        name: "Timeline Discussion",
                        date: "22nd Oct'22",
                        time: "20:00",
                        team: "E-Cell",
                      ),
                      MeetTile(
                        name: "Timeline Discussion",
                        date: "22nd Oct'22",
                        time: "20:00",
                        team: "E-Cell",
                      ),
                      Container(
                        height: 58 / 800 * MediaQuery.of(context).size.height,
                        width: 318 / 360 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25,
                              spreadRadius: 4,
                              offset: Offset(0, 8),
                              color: Color.fromRGBO(69, 68, 68, 0.32),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "View All Previous Meetings",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(69, 68, 68, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25 / 800 * MediaQuery.of(context).size.height,
                      ),
                    ],
                  ),
                ),
                // color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
