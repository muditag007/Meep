// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/agenda_tile.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/invitee.dart';

class MeetingDetails extends StatefulWidget {
  const MeetingDetails({super.key});
  static String id = "meetingdetails";
  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
  bool detailpage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (1 - 95 / 800),
            child: SingleChildScrollView(
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
                  Container(
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
                        vertical: 17 / 800 * MediaQuery.of(context).size.height,
                      ),
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: 12 / 800 * MediaQuery.of(context).size.height,
                          // ),
                          Container(
                            height: 5,
                            width: 66 / 360 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(154, 154, 154, 1),
                            ),
                          ),
                          SizedBox(
                            height:
                                11 / 800 * MediaQuery.of(context).size.height,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  22 / 360 * MediaQuery.of(context).size.width,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          MediaQuery.of(context).size.height,
                                      width: 138 /
                                          360 *
                                          MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: detailpage
                                            ? Color.fromRGBO(107, 0, 215, 1)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
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
                                          MediaQuery.of(context).size.height,
                                      width: 138 /
                                          360 *
                                          MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: !detailpage
                                            ? Color.fromRGBO(107, 0, 215, 1)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
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
                            height:
                                20 / 800 * MediaQuery.of(context).size.height,
                          ),
                          detailpage
                              ? Container(
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
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 22 /
                                          360 *
                                          MediaQuery.of(context).size.width,
                                      vertical: 21 /
                                          800 *
                                          MediaQuery.of(context).size.height,
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
                                            color:
                                                Color.fromRGBO(69, 68, 68, 1),
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
                                                fontWeight: FontWeight.w400,
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
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "In continuation to",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: kColor1,
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
                                              MediaQuery.of(context).size.width,
                                          height: 37 /
                                              800 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              kShadow,
                                            ],
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
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
                                                    fontWeight: FontWeight.w700,
                                                    color: kColor2,
                                                  ),
                                                ),
                                                Text(
                                                  "23rd Oct'22",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: kColor1,
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
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Invitees",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: kColor1,
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
                                        // ListView.builder(
                                        //   itemCount: 5,
                                        //   itemBuilder: (BuildContext context, int index) {
                                        //     return Invitee(name: "Roshni");
                                        //   },
                                        // ),
                                      ],
                                    ),
                                  ),
                                )
                              : AgendaTile(title: "Revenue Generation Methods"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 95 / 800 * MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Center(
              child: Container(
                height: 49 / 800 * MediaQuery.of(context).size.height,
                width: 317 / 360 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kColor2,
                  borderRadius: BorderRadius.circular(15),
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
        ],
      ),
    );
  }
}
