// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, depend_on_referenced_packages, unused_local_variable, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/login_controller.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class TaskTileComplex extends StatefulWidget {
  final String agenda;
  final String task;
  final String deadline;
  final String personnel;
  final String id;
  final String agendaNum;
  final String taskNum;
  const TaskTileComplex({
    super.key,
    required this.agenda,
    required this.task,
    required this.deadline,
    required this.personnel,
    required this.id, required this.agendaNum, required this.taskNum,
  });

  @override
  State<TaskTileComplex> createState() => _TaskTileComplexState();
}

class _TaskTileComplexState extends State<TaskTileComplex> {
  LoginController controller = Get.put(LoginController());
  Future<void> _handleMarkDone() async {
    try {
      Map<String, Map> json1 = {
        'token': {
          'displayName': controller.googleAccount.value?.displayName,
          'photoUrl': controller.googleAccount.value?.photoUrl,
          'id': controller.googleAccount.value?.id,
          'email': controller.googleAccount.value?.email,
          'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
        }
      };
      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/set/markasdone/${widget.id}'),
        // body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  Future<void> _handleExtend() async {
    try {
      // Map<String, Map> json1 = {
      //   'token': {
      //     'displayName': controller.googleAccount.value?.displayName,
      //     'photoUrl': controller.googleAccount.value?.photoUrl,
      //     'id': controller.googleAccount.value?.id,
      //     'email': controller.googleAccount.value?.email,
      //     'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
      //   }
      // };
      Map<String, String> json1 = {
        'deadline':
            "Tue Feb 08 2023 18:30:00 GMT+0000 (Coordinated Universal Time)",
      };

      final response = await http.post(
        Uri.parse('https://meep-nine.vercel.app/live/set/extend/${widget.id}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

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
                          "${widget.agendaNum}.${widget.taskNum}",
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
                        "\"${widget.task}\"",
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
                          "${widget.agendaNum}",
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
                        "\"${widget.agenda}\"",
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
                        "${widget.personnel}",
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
                              "${widget.deadline}",
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
                                      onTap: () async {
                                        await _handleExtend();
                                        // setState(() {
                                        //   extend = true;
                                        //   markDoneVisible = false;
                                        // });
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
                          onTap: () async {
                            await _handleMarkDone();
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
  }
}
