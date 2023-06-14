// ignore_for_file: unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/attendance.dart';
import 'package:meep/utils/constants.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/task_tile.dart';
import 'package:meep/utils/task_tile_complex.dart';

class AttendeeWaiting extends StatefulWidget {
  final String meetId;
  const AttendeeWaiting({super.key, required this.meetId});

  @override
  State<AttendeeWaiting> createState() => _AttendeeWaitingState();
}

class _AttendeeWaitingState extends State<AttendeeWaiting> {
  LoginController controller = Get.put(LoginController());
  String meetName = '';
  List<dynamic> preAgendas = [];
  List<Widget> completed = [];
  List<Widget> incomplete = [];
  List<dynamic> preTasks = [];

  Future<void> _handleMeetName() async {
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
            'https://meep-nine.vercel.app/meetings/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
      // print(json.decode(response.body));
      meetName = json.decode(response.body)['title'];
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

  Future<void> _handleTasks() async {
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

      final tempResponse = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/meetings/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/tasks/previous/${json.decode(tempResponse.body)['previous_meeting']}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
      // print(json.decode(response.body));
      preTasks = json.decode(response.body);
      print(preTasks);
      incomplete = [];
      completed = [];

      for (int i = 0; i < preTasks.length; i++) {
        String per = '';
        for (int k = 0; k < preTasks[i]['task_personnel'].length; k++) {
          if (k == 0) {
            per = per +
                "@" +
                preTasks[i]['task_personnel'][k]['name']
                    .toString()
                    .split(' ')[0];
          } else {
            per = per +
                ", @" +
                preTasks[i]['task_personnel'][k]['name']
                    .toString()
                    .split(' ')[0];
          }
        }
        if (preTasks[i]['status'] == 'Incomplete') {
          incomplete.add(
            SizedBox(
              height:
                  (i == 0 ? 12 : 20) / 800 * MediaQuery.of(context).size.height,
            ),
          );
          incomplete.add(
            TaskTile(
              // id: preTasks[i]['task_id'],
              title: preAgendas[i]['agenda_title'],
              deadline: preTasks[i]['deadline'].toString(),
              personal: per,
              taskTitle: preTasks[i]['task_title'],
              agendaNum: preTasks[i]['agenda_num'],
              taskNum: preTasks[i]['task_num'], complete: false,
            ),
          );
        } else {
          completed.add(
            SizedBox(
              height:
                  (i == 0 ? 12 : 20) / 800 * MediaQuery.of(context).size.height,
            ),
          );
          completed.add(
            TaskTile(
              title: preTasks[i]['agenda_title'],
              taskTitle: preTasks[i]['task_title'],
              personal: per,
              deadline: preTasks[i]['deadline'].toString(),
              complete: true,
              agendaNum: preTasks[i]['agenda_num'],
              taskNum: preTasks[i]['task_num'],
            ),
          );
        }
      }

      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
      lastMeet = true;
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  bool lastMeet = false;

  @override
  Widget build(BuildContext context) {
    // Widget attendee = Attendance(
    //   attendees: [],
    //   hands: [],
    // );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyLight.arrow_left_2,
                    size: 30,
                    color: kGrey,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                FutureBuilder(
                  future: _handleMeetName(),
                  builder: (context, snapshot) {
                    return Text(
                      meetName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kGrey,
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (_) => timer,
                        // );
                      },
                      child: Container(
                        height: 29 / 800 * MediaQuery.of(context).size.height,
                        width: 72 / 360 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: kGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "00:00",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    IconButton(
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (_) => attendee,
                        // );
                      },
                      icon: Icon(
                        IconlyBold.user_2,
                        size: 24,
                        color: kGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/conversation.png"),
                    SizedBox(
                      height: 33,
                    ),
                    Text(
                      "We're waiting on the Host",
                      style: TextStyle(
                        fontSize: 20,
                        color: kGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 10,
                      width: 152,
                      decoration: BoxDecoration(
                        color: kPurple2.withOpacity(0.56),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 10,
                          width: 92,
                          decoration: BoxDecoration(
                            color: kPurple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
