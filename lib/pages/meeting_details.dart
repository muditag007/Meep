// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/meet_wait_page.dart';
import 'package:meep/utils/agenda_tile.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/invitee.dart';
import 'package:meep/utils/task_tile.dart';

class MeetingDetails extends StatefulWidget {
  const MeetingDetails({super.key});
  static String id = "meetingdetails";
  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
  bool detailpage = true;
  bool actionreport = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * (1 - 95 / 800),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 76 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Monthly Review",
                            style: TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              // ignore: prefer_const_literals_to_create_immutables
                              shadows: [
                                Shadow(
                                  blurRadius: 15,
                                  offset: Offset(0, 4),
                                  color: Color.fromRGBO(69, 68, 68, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Kshitij Takiar",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              // ignore: prefer_const_literals_to_create_immutables
                              shadows: [
                                Shadow(
                                  blurRadius: 15,
                                  offset: Offset(0, 4),
                                  color: Color.fromRGBO(69, 68, 68, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 47 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Expanded(
                          child: Container(
                            // height: double.infinity,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 17 /
                                    800 *
                                    MediaQuery.of(context).size.height,
                              ),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   height: 12 / 800 * MediaQuery.of(context).size.height,
                                  // ),
                                  Container(
                                    height: 5,
                                    width: 66 /
                                        360 *
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(154, 154, 154, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 11 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 22 /
                                          360 *
                                          MediaQuery.of(context).size.width,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              if (!detailpage) {
                                                setState(() {
                                                  detailpage = true;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 45 /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              width: 138 /
                                                  360 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              decoration: BoxDecoration(
                                                color: detailpage
                                                    ? Color.fromRGBO(
                                                        107, 0, 215, 1)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Details",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: detailpage
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              if (detailpage) {
                                                setState(() {
                                                  detailpage = false;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 45 /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              width: 138 /
                                                  360 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              decoration: BoxDecoration(
                                                color: !detailpage
                                                    ? Color.fromRGBO(
                                                        107, 0, 215, 1)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Agenda",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: !detailpage
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  detailpage
                                      ? Container(
                                          width: 318 /
                                              360 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 25,
                                                spreadRadius: 4,
                                                offset: Offset(0, 8),
                                                color: Color.fromRGBO(
                                                    69, 68, 68, 0.32),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 22 /
                                                  360 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              vertical: 21 /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                            child: Column(
                                              children: [
                                                // SizedBox(
                                                //   height:
                                                //       21 / 800 * MediaQuery.of(context).size.height,
                                                // ),
                                                Text(
                                                  "Today, 17:30",
                                                  style: TextStyle(
                                                    // fontStyle: FontStyle.normal,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromRGBO(
                                                        69, 68, 68, 1),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Icon(
                                                      IconlyBold.location,
                                                      size: 20,
                                                      color: Color.fromRGBO(
                                                          107, 0, 215, 1),
                                                    ),
                                                    SizedBox(
                                                      width: 1,
                                                    ),
                                                    Text(
                                                      "E-Cell Office",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromRGBO(
                                                            69, 68, 68, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 17 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "In continuation to",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kGrey,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 9 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Container(
                                                  width: 269 /
                                                      360 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                  height: 37 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      kShadow,
                                                    ],
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        Text(
                                                          "Monthly Review",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: kPurple,
                                                          ),
                                                        ),
                                                        Text(
                                                          "23rd Oct'22",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: kGrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Invitees",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kGrey,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Invitee(name: "name"),
                                                SizedBox(
                                                  height: 16 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Invitee(name: "name"),
                                                SizedBox(
                                                  height: 16 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Invitee(name: "name"),
                                                SizedBox(
                                                  height: 16 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Invitee(name: "name"),
                                                SizedBox(
                                                  height: 16 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Invitee(name: "name"),
                                                SizedBox(
                                                  height: 16 /
                                                      800 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                ),
                                                Invitee(name: "name"),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Column(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Container(
                                              width: 318 /
                                                  360 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              // height: 59 / 800 * MediaQuery.of(context).size.height,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  kShadow,
                                                ],
                                                color: Colors.transparent,
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    // constraints: BoxConstraints.expand(),
                                                    width: 52 /
                                                        360 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 59 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    // height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                      ),
                                                      color: kOrange
                                                          .withOpacity(0.43),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        IconlyBold.edit,
                                                        size: 25,
                                                        color: Color.fromRGBO(
                                                            19, 15, 38, 1),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 266 /
                                                        360 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    // height: 59 / 800 * MediaQuery.of(context).size.height,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 5 /
                                                            800 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        horizontal: 16 /
                                                            360 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          // SizedBox(
                                                          //   width: 16 /
                                                          //       360 *
                                                          //       MediaQuery.of(context)
                                                          //           .size
                                                          //           .width,
                                                          // ),
                                                          Flexible(
                                                            child: Text(
                                                              "Action Taken Report",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: kGrey,
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                actionreport =
                                                                    !actionreport;
                                                              });
                                                            },
                                                            icon: Icon(
                                                              !actionreport
                                                                  ? IconlyBold
                                                                      .arrow_down_2
                                                                  : IconlyBold
                                                                      .arrow_up_2,
                                                              color: kGrey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 18 /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                            if (actionreport) TaskTile(),
                                            if (actionreport)
                                              SizedBox(
                                                height: 18 /
                                                    800 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                              ),
                                            if (actionreport) TaskTile(),
                                            if (actionreport)
                                              SizedBox(
                                                height: 18 /
                                                    800 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                              ),
                                            AgendaTile(
                                              title:
                                                  "Revenue Generation Methods",
                                            ),
                                            SizedBox(
                                              height: 18 /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                            AgendaTile(
                                              title:
                                                  "Commision of New Research",
                                            ),
                                            SizedBox(
                                              height: 18 /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                            AgendaTile(
                                              title: "Collaborative Efforts",
                                            ),
                                            SizedBox(
                                              height: 18 /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                            AgendaTile(
                                              title:
                                                  "Planning for Upcoming Recruitments",
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    hasScrollBody: false,
                  ),
                ],
              ),
            ),
            Container(
              height: 95 / 800 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    spreadRadius: 4,
                    offset: Offset(0, -4),
                    color: Color.fromRGBO(69, 68, 68, 0.32),
                  )
                ],
              ),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(context, MeetWaitPage.id);
                    },
                    child: Container(
                      height: 49 / 800 * MediaQuery.of(context).size.height,
                      width: 317 / 360 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kPurple,
                        borderRadius: BorderRadius.circular(15),
                        // ignore: prefer_const_literals_to_create_immutables
                      ),
                      child: Center(
                        child: Text(
                          "Join This Meeting",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
