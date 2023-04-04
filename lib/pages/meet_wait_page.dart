// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, unused_element, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/agenda_page.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/task_tile.dart';
import 'package:meep/utils/task_tile_complex.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MeetWaitPage extends StatefulWidget {
  final String meetId;
  // final String preId;
  // final String meetName;
  const MeetWaitPage({
    super.key,
    required this.meetId,
    // required this.preId,
    // required this.meetName,
  });
  static String id = "meetwaitpage";
  @override
  State<MeetWaitPage> createState() => _MeetWaitPageState();
}

class _MeetWaitPageState extends State<MeetWaitPage> {
  LoginController controller = Get.put(LoginController());
  String meetName = '';
  String preId = '';
  List<dynamic> preAgendas = [];
  List<Widget> completed = [];
  List<Widget> incomplete = [];
  List<dynamic> preTasks = [];
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  List<bool> incompleteCheck = [];

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
            TaskTileComplex(
              id: preTasks[i]['task_id'],
              agenda: preAgendas[i]['agenda_title'],
              deadline: preTasks[i]['deadline'].toString(),
              personnel: per,
              task: preTasks[i]['task_title'],
              agendaNum: preTasks[i]['agenda_num'],
              taskNum: preTasks[i]['task_num'],
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
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
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
                    Container(
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
                    SizedBox(
                      width: 7,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconlyBold.user_2,
                        size: 24,
                        color: kGrey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * (1 - 150 / 800) -
                  MediaQuery.of(context).viewPadding.top,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Container(
                          width: 200 / 360 * MediaQuery.of(context).size.width,
                          height:
                              170 / 800 * MediaQuery.of(context).size.height,
                          child: Image.asset("images/hiring.png"),
                        ),
                        SizedBox(
                          height: 20 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Text(
                          "Review tasks from Last Meeting",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kGrey,
                          ),
                        ),
                        SizedBox(
                          height: 20 / 800 * MediaQuery.of(context).size.height,
                        ),
                        FutureBuilder(
                          future: _handleTasks(),
                          builder: (context, snapshot) {
                            return Column(
                              children: [
                                if (incomplete.isNotEmpty)
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Text(
                                        "Incomplete",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: kGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ...incomplete,
                                if (incomplete.isNotEmpty)
                                  SizedBox(
                                    height: 30 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                if (completed.isNotEmpty)
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 32,
                                      ),
                                      Text(
                                        "Completed",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: kGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ...completed
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 12 / 800 * MediaQuery.of(context).size.height,
                        ),
                      ],
                    ),
                    hasScrollBody: false,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      // Navigator.pushNamed(context, AgendaPage.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgendaPage(
                            meetId: widget.meetId,
                            // meetName: '',
                            // preId: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50 / 800 * MediaQuery.of(context).size.height,
                      width: 317 / 360 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kPurple2.withOpacity(0.56),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Proceed with Agenda",
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
