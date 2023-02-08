// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/meeting_details.dart';
import 'package:meep/pages/mom_notifications.dart';
import 'package:meep/pages/previous_meet_page.dart';
import 'package:meep/pages/profile_page.dart';
import 'package:meep/utils/constants.dart';
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
        backgroundColor: Colors.transparent,
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover),
          ),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
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
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(context, ProfilePage.id);
                                },
                                child: Container(
                                  height: 67 /
                                      360 *
                                      MediaQuery.of(context).size.width,
                                  width: 67 /
                                      360 *
                                      MediaQuery.of(context).size.width,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red,
                                  ),
                                ),
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
                            CountTile(
                              name: "Meetings",
                              count: "3",
                              onpressed: () {},
                            ),
                            CountTile(
                              name: "Updates",
                              count: "12",
                              onpressed: () {
                                Navigator.pushNamed(
                                    context, MomNotifications.id);
                              },
                            ),
                            CountTile(
                              name: "Tasks",
                              count: "13",
                              onpressed: () {},
                            ),
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
                          horizontal:
                              21 / 360 * MediaQuery.of(context).size.width,
                        ),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              height:
                                  14 / 800 * MediaQuery.of(context).size.height,
                            ),
                            Container(
                              height: 5,
                              width:
                                  66 / 360 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(154, 154, 154, 1),
                              ),
                            ),
                            SizedBox(
                              height:
                                  20 / 800 * MediaQuery.of(context).size.height,
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
                              height:
                                  11 / 800 * MediaQuery.of(context).size.height,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MeetingDetails.id);
                                },
                                child: Container(
                                  width: 317 /
                                      360 *
                                      MediaQuery.of(context).size.width,
                                  height: 113 /
                                      800 *
                                      MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromRGBO(107, 0, 215, 1),
                                    boxShadow: [
                                      kShadow,
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20 /
                                          800 *
                                          MediaQuery.of(context).size.height,
                                      horizontal: 20 /
                                          360 *
                                          MediaQuery.of(context).size.width,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  "Monthly Review",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "Kshitij, Vice Chairperson",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 21,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 3,
                                                        width: 3,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 3,
                                                        width: 3,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 3,
                                                        width: 3,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Text(
                                              "17:30",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Main Conferernce Room",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "E-Cell",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height:
                                  11 / 800 * MediaQuery.of(context).size.height,
                              width:
                                  295 / 360 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  kShadow,
                                ],
                              ),
                            ),
                            Container(
                              height:
                                  11 / 800 * MediaQuery.of(context).size.height,
                              width:
                                  269 / 360 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  kShadow,
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  30 / 800 * MediaQuery.of(context).size.height,
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
                              height:
                                  10 / 800 * MediaQuery.of(context).size.height,
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
                            Material(
                              child: InkWell(
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PreviousMeetPage.id);
                                },
                                child: Container(
                                  height: 58 /
                                      800 *
                                      MediaQuery.of(context).size.height,
                                  width: 318 /
                                      360 *
                                      MediaQuery.of(context).size.width,
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
                              ),
                            ),
                            SizedBox(
                              height:
                                  25 / 800 * MediaQuery.of(context).size.height,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                hasScrollBody: false,
              )
            ],
          ),
        ));
  }
}
