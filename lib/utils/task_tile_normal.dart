// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class TaskTileNormal extends StatelessWidget {
  final String title;
  final String taskTitle;
  final String personal;
  final String deadline;
  final bool complete;
  final String agendaNum;
  final String taskNum;
  final String prevDeadline;
  final bool discuss;

  TaskTileNormal({
    super.key,
    required this.title,
    required this.taskTitle,
    required this.personal,
    required this.deadline,
    required this.complete,
    required this.agendaNum,
    required this.taskNum,
    required this.prevDeadline,
    required this.discuss,
  });

  bool markDoneVisible = false;
  // bool complete = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 318 / 360 * MediaQuery.of(context).size.width,
        height: 210 / 800 * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            kShadow,
          ],
          color: Colors.white,
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
                        "${agendaNum}.${taskNum}",
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
                      "\"${taskTitle}\"",
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
                        "${agendaNum}",
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
                      "\"${title}\"",
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
                      "${personal}",
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
                    child: prevDeadline == ''
                        ? Text(
                            "${deadline}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: complete
                                  ? Color.fromRGBO(26, 132, 0, 1)
                                  : Color.fromRGBO(255, 0, 0, 1),
                            ),
                            maxLines: 2,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            // textDirection: TextDirection.ltr,
                          )
                        : Row(
                            children: [
                              Text(
                                "${prevDeadline.substring(0, 16)}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 0, 0, 1),
                                ),
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                // textDirection: TextDirection.ltr,
                              ),
                              Text(
                                "  ${deadline.substring(0, 16)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 0, 0, 1),
                                ),
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                // textDirection: TextDirection.ltr,
                              )
                            ],
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
              if (discuss)
                Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "To be discussed further",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(203, 0, 0, 1),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
