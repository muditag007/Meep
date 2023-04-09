// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, prefer_final_fields, unused_field, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/moving_on.dart';

class AgendaForm extends StatefulWidget {
  final String agenda;
  final String desc;
  final String agendaNum;
  final String agendaId;
  final String meetId;
  const AgendaForm({
    super.key,
    required this.agenda,
    required this.desc,
    required this.agendaNum,
    required this.agendaId,
    required this.meetId,
  });

  @override
  State<AgendaForm> createState() => _AgendaFormState();
}

class _AgendaFormState extends State<AgendaForm> {
  LoginController controller = Get.put(LoginController());
  List<String> tagging = [];
  List<String> emailPersons = [];

  Future<void> _handleAppoint() async {
    try {
      // Map<String, Map> json1 = {
      //   'task': {
      //     "title": _task.text,
      //     "personnel": _personnel.text,
      //     "deadline": _deadline.text,
      //   }
      // };

      Map<String, Map> json1 = {
        "task": {
          "title": "Task API",
          "personnel": ["fake@gmail.com"],
          "deadline": "2023-04-02 14:16:16.205"
        }
      };

      print(json.encode(json1));

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/add/task/${widget.agendaId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      print(
        json.decode(response.body),
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

  Future<void> _handleSummary() async {
    try {
      Map<String, Map> json1 = {
        'task': {
          "summary": _summary.text,
        }
      };

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/set/summary/${widget.agendaId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      // print(
      //   json.decode(response.body),
      // );
      // print(json.decode(response.body));
      // meetName = json.decode(response.body)['title'];
      // preId = json.decode(response.body)['previous_meeting'];
      // _handleTasks();
      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  Future<void> _handleMovingOn() async {
    try {
      // Map<String, Map> json1 = {
      //   'task': {
      //     "summary": _summary.text,
      //   }
      // };

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/set/movingon/${widget.meetId}'),
        // body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      print(json.decode(response.body));
      // meetName = json.decode(response.body)['title'];
      // preId = json.decode(response.body)['previous_meeting'];
      // _handleTasks();
      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  Future<void> _handlePersonnel() async {
    try {
      // print(_personnel.text.split('@'));
      tagging = [];
      Map<String, String> json1 = {
        'prompt':
            _personnel.text.split('@')[_personnel.text.split('@').length - 1],
      };

      final response = await http.post(
        Uri.parse('https://meep-nine.vercel.app/profile/find'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      List personnels = json.decode(response.body);
      List names = [];
      List emails = [];
      for (int i = 0; i < personnels.length; i++) {
        tagging.add(personnels[i]['name']);
        names.add(personnels[i]['name']);
        emails.add(personnels[i]['email']);
      }

      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  bool appoint = true;
  TextEditingController _task = new TextEditingController();
  TextEditingController _personnel = new TextEditingController();
  TextEditingController _deadline = new TextEditingController();
  TextEditingController _summary = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget movingOn = MovingOn(
      meetId: widget.meetId,
    );
    return Container(
      width: 318,
      // / 360 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: kPurple,
        ),
        borderRadius: BorderRadius.circular(15),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 12.5,
            spreadRadius: 2,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      widget.agendaNum,
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
            SizedBox(
              height: 14,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  IconlyBold.document,
                  color: kPurple2,
                  size: 20,
                ),
                SizedBox(
                  width: 12 / 360 * MediaQuery.of(context).size.width,
                ),
                Flexible(
                  child: Text(
                    "\"${widget.desc}\"",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kGrey,
                    ),
                    maxLines: 40,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    // textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                SizedBox(
                  width: 27,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        appoint = true;
                        // _control.text = '';
                      });
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 23,
                      width: 68,
                      decoration: BoxDecoration(
                        color: appoint ? kPurple : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Appoint",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: appoint ? Colors.white : kGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        appoint = false;
                        // _control.text = '';
                      });
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 23,
                      width: 87,
                      decoration: BoxDecoration(
                        color: !appoint ? kPurple : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Summarise",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: !appoint ? Colors.white : kGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 11,
            ),
            appoint
                ? Column(
                    children: [
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
                                "${widget.agendaNum}.1",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: kOrange,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Task",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 32,
                            width: 248,
                            child: TextField(
                              controller: _task,
                              cursorColor: kGrey,
                              decoration: kTextField.copyWith(
                                hintText: "Describe the task",
                              ),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconlyBold.user_2,
                            size: 20,
                            color: kOrange,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Personnel",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 32,
                            width: 248,
                            child: TextField(
                              controller: _personnel,
                              cursorColor: kGrey,
                              decoration:
                                  kTextField.copyWith(hintText: "@name"),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                              onChanged: (value) {
                                if (value.contains('@')) {
                                  _handlePersonnel();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      // tagging.isNotEmpty
                      //     ? DropdownButton(
                      //         items: tagging.map<DropdownMenuItem<String>>(
                      //             (String value) {
                      //           return DropdownMenuItem<String>(
                      //             value: value,
                      //             child: Text(value),
                      //           );
                      //         }).toList(),
                      //         onChanged: (value) {

                      //         },
                      //       )
                      //     : Container(),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconlyBold.calendar,
                            size: 20,
                            color: kOrange,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Deadline",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 32,
                            width: 248,
                            child: TextField(
                              controller: _deadline,
                              cursorColor: kGrey,
                              decoration: kTextField.copyWith(
                                hintText: "DD/MM/YY",
                                suffixIcon: Icon(
                                  IconlyLight.calendar,
                                  color: kWhite,
                                  size: 24,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (_task.text != '' &&
                              _personnel.text != '' &&
                              _deadline.text != '') {
                            _handleAppoint();
                            setState(() {
                              appoint = false;
                            });
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: kPurple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Appoint",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconlyBold.editSquare,
                            size: 20,
                            color: kPurple2,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Agenda Summary",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 156,
                            width: 248,
                            child: TextField(
                              controller: _summary,
                              maxLines: null,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              expands: true,
                              cursorColor: kGrey,
                              keyboardType: TextInputType.multiline,
                              decoration: kTextField.copyWith(
                                hintText: "Summarise the Agenda",
                              ),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_summary.text != '') {
                            await _handleMovingOn();
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return movingOn;
                              },
                            );
                            print("hogya kaam tamam");
                            _handleSummary();
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: kPurple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Moving on",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
