// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class TaskTileComplex extends StatefulWidget {
  const TaskTileComplex({super.key});

  @override
  State<TaskTileComplex> createState() => _TaskTileComplexState();
}

class _TaskTileComplexState extends State<TaskTileComplex> {
  bool complete = false;
  bool markDoneVisible = false;
  bool extend = false;
  bool later = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            markDoneVisible = !markDoneVisible;
          });
        },
        child: Container(
          width: 318 / 360 * MediaQuery.of(context).size.width,
          height: (markDoneVisible ? 341 : (later ? 242 : 210)) /
              800 *
              MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              kShadow,
            ],
            color: Colors.white,
          ),
          // duration: Duration(
          //   milliseconds: 300,
          // ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 17 / 800 * MediaQuery.of(context).size.height,
              horizontal: 12 / 360 * MediaQuery.of(context).size.width,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: kOrange2.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          "1.1",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: kOrange,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12 / 360 * MediaQuery.of(context).size.width,
                    ),
                    Flexible(
                      child: Text(
                        "\"Updation of all names in the spreadsheet\"",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: kGrey,
                        ),
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        // textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 14 / 800 * MediaQuery.of(context).size.height,
                // ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: kPurple2.withOpacity(0.56),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: kPurple,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12 / 360 * MediaQuery.of(context).size.width,
                    ),
                    Flexible(
                      child: Text(
                        "\"Sponsorships for Upcoming Events\"",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: kGrey,
                        ),
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        // textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 7 / 800 * MediaQuery.of(context).size.height,
                // ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      IconlyBold.user_2,
                      size: 20,
                      color: kOrange,
                    ),
                    SizedBox(
                      width: 12 / 360 * MediaQuery.of(context).size.width,
                    ),
                    Flexible(
                      child: Text(
                        "@Rahul, @Khwaab",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: kGrey,
                        ),
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        // textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 10 / 800 * MediaQuery.of(context).size.height,
                // ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      IconlyBold.calendar,
                      size: 20,
                      color: kOrange,
                    ),
                    SizedBox(
                      width: 12 / 360 * MediaQuery.of(context).size.width,
                    ),
                    Flexible(
                        child: !extend
                            ? Text(
                                "28th Dec'22",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: !complete
                                      ? Color.fromRGBO(255, 0, 0, 1)
                                      : Color.fromRGBO(26, 132, 0, 1),
                                ),
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                // textDirection: TextDirection.ltr,
                              )
                            : Row(
                                children: [
                                  Text(
                                    "17th Dec'22",
                                    style: TextStyle(
                                      decoration: extend
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: !complete
                                          ? Color.fromRGBO(255, 0, 0, 1)
                                          : Color.fromRGBO(26, 132, 0, 1),
                                    ),
                                    maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    // textDirection: TextDirection.ltr,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "27th Dec'22",
                                    style: TextStyle(
                                      // decoration: extend
                                      //     ? TextDecoration.lineThrough
                                      //     : TextDecoration.none,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: !complete
                                          ? Color.fromRGBO(255, 0, 0, 1)
                                          : Color.fromRGBO(26, 132, 0, 1),
                                    ),
                                    maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    // textDirection: TextDirection.ltr,
                                  ),
                                ],
                              )),
                  ],
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      IconlyBold.arrow_right_2,
                      size: 20,
                      color: Color.fromRGBO(25, 0, 135, 1),
                    ),
                    SizedBox(
                      width: 12 / 360 * MediaQuery.of(context).size.width,
                    ),
                    Container(
                      height: 20 / 800 * MediaQuery.of(context).size.height,
                      width: 91 / 360 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: !complete
                            ? Color.fromRGBO(255, 0, 0, 0.5)
                            : Color.fromRGBO(116, 254, 68, 0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          complete ? "Complete" : "Incomplete",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: !complete
                                ? Color.fromRGBO(203, 0, 0, 1)
                                : Color.fromRGBO(26, 132, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (later)
                  Column(
                    children: [
                      SizedBox(
                        height: 16 / 800 * MediaQuery.of(context).size.height,
                      ),
                      Text(
                        "To be discussed further",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(203, 0, 0, 1),
                        ),
                      ),
                    ],
                  ),
                if (markDoneVisible)
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Extend Deadline",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: kGrey,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 28 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                    width: 151 /
                                        360 *
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Color.fromRGBO(222, 222, 222, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15 /
                                        360 *
                                        MediaQuery.of(context).size.width,
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          extend = true;
                                          markDoneVisible = false;
                                        });
                                      },
                                      child: Container(
                                        height: 28 /
                                            800 *
                                            MediaQuery.of(context).size.height,
                                        width: 90 /
                                            360 *
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: kPurple2.withOpacity(0.56),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Confirm",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40 /
                                    800 *
                                    MediaQuery.of(context).size.height,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              complete = true;
                              markDoneVisible = false;
                            });
                          },
                          child: Container(
                            height:
                                28 / 800 * MediaQuery.of(context).size.height,
                            width:
                                145 / 360 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: kPurple,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Mark as done",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: kPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              later = true;
                              markDoneVisible = false;
                            });
                          },
                          child: Container(
                            height:
                                28 / 800 * MediaQuery.of(context).size.height,
                            width:
                                145 / 360 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: kPurple,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Discuss Later",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: kPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
