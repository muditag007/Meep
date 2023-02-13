// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool markDoneVisible = false;
  bool complete = false;

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
        child: AnimatedContainer(
          width: 318 / 360 * MediaQuery.of(context).size.width,
          height: (markDoneVisible ? 253 : 210) /
              800 *
              MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              kShadow,
            ],
            color: Colors.white,
          ),
          duration: Duration(
            milliseconds: 300,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 17 / 800 * MediaQuery.of(context).size.height,
              horizontal: 16 / 360 * MediaQuery.of(context).size.width,
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
                      child: Text(
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
                      ),
                    ),
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
                if (markDoneVisible)
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          complete = !complete;
                        });
                      },
                      child: Container(
                        height: 28 / 800 * MediaQuery.of(context).size.height,
                        width: 125 / 360 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kPurple,
                        ),
                        child: Center(
                          child: Text(
                            !complete ? "Mark as done" : "Mark as undone",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
