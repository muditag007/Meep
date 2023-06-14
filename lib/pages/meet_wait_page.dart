// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, unused_element, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, use_build_context_synchronously, depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/agenda_page.dart';
import 'package:meep/utils/attendance.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/task_tile.dart';
import 'package:meep/utils/task_tile_complex.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:meep/utils/task_tile_normal.dart';
import 'package:socket_io_client/socket_io_client.dart';

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
  List<Widget> discuss = [];
  List<Widget> extend = [];
  List<dynamic> preTasks = [];
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  List<bool> incompleteCheck = [];

  Stream<http.Response> getPreId() async* {
    yield* Stream.periodic(Duration(milliseconds: 5), (_) {
      Map<String, Map> json1 = {
        'token': {
          'displayName': controller.googleAccount.value?.displayName,
          'photoUrl': controller.googleAccount.value?.photoUrl,
          'id': controller.googleAccount.value?.id,
          'email': controller.googleAccount.value?.email,
          'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
        }
      };
      return http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/meetings/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
    }).asyncMap((event) async => await event);
  }

  Stream<http.Response> getTasks() async* {
    yield* Stream.periodic(Duration(milliseconds: 5), (_) async {
      Map<String, Map> json1 = {
        'token': {
          'displayName': controller.googleAccount.value?.displayName,
          'photoUrl': controller.googleAccount.value?.photoUrl,
          'id': controller.googleAccount.value?.id,
          'email': controller.googleAccount.value?.email,
          'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
        }
      };
      final resp = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/meetings/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
      return http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/tasks/previous/${json.decode(resp.body)['previous_meeting']}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
    }).asyncMap((event) async => await event);
  }

  Stream<http.Response> getDiscuss() async* {
    yield* Stream.periodic(Duration(milliseconds: 5), (_) {
      Map<String, Map> json1 = {
        'token': {
          'displayName': controller.googleAccount.value?.displayName,
          'photoUrl': controller.googleAccount.value?.photoUrl,
          'id': controller.googleAccount.value?.id,
          'email': controller.googleAccount.value?.email,
          'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
        }
      };
      return http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/current/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
    }).asyncMap((event) async => await event);
  }

  Stream<http.Response> getMeetName() async* {
    yield* Stream.periodic(Duration(milliseconds: 5), (_) {
      Map<String, Map> json1 = {
        'token': {
          'displayName': controller.googleAccount.value?.displayName,
          'photoUrl': controller.googleAccount.value?.photoUrl,
          'id': controller.googleAccount.value?.id,
          'email': controller.googleAccount.value?.email,
          'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
        }
      };
      return http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/meetings/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
    }).asyncMap((event) async => await event);
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

      final discussRes = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/current/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      var discussFurther = json.decode(discussRes.body);
      print(discussFurther['discussFurther']);
      List discussIds = [];
      for (int i = 0; i < discussFurther['discussFurther'].length; i++) {
        discussIds.add(discussFurther['discussFurther'][i]['task_id']);
      }

      // print(json.decode(response.body));
      preTasks = json.decode(response.body);
      print(preTasks);
      incomplete = [];
      completed = [];
      extend = [];
      discuss = [];

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
        if (discussIds.contains(preTasks[i]['task_id'])) {
          discuss.add(
            SizedBox(
              height:
                  (i == 0 ? 12 : 20) / 800 * MediaQuery.of(context).size.height,
            ),
          );
          discuss.add(
            TaskTileNormal(
              discuss: true,
              title: preTasks[i]['agenda_title'],
              taskTitle: preTasks[i]['task_title'],
              personal: per,
              deadline: preTasks[i]['deadline'].toString(),
              complete: false,
              agendaNum: preTasks[i]['agenda_num'].toString(),
              taskNum: preTasks[i]['task_num'].toString(),
              prevDeadline: '',
            ),
          );
        } else {
          if (preTasks[i]['status'] == 'Incomplete' &&
              preTasks[i]['previous_deadline'] == null) {
            incomplete.add(
              SizedBox(
                height: (i == 0 ? 12 : 20) /
                    800 *
                    MediaQuery.of(context).size.height,
              ),
            );
            incomplete.add(
              TaskTileComplex(
                meetId: widget.meetId,
                // prevDeadline: '',
                id: preTasks[i]['task_id'],
                agenda: preTasks[i]['agenda_title'],
                deadline: preTasks[i]['deadline'].toString(),
                personnel: per,
                task: preTasks[i]['task_title'],
                agendaNum: preTasks[i]['agenda_num'].toString(),
                taskNum: preTasks[i]['task_num'].toString(),
              ),
            );
          } else if (preTasks[i]['status'] == 'Incomplete' &&
              preTasks[i]['previous_deadline'] != null) {
            extend.add(
              SizedBox(
                height: (i == 0 ? 12 : 20) /
                    800 *
                    MediaQuery.of(context).size.height,
              ),
            );
            extend.add(
              TaskTileNormal(
                discuss: false,
                title: preTasks[i]['agenda_title'],
                taskTitle: preTasks[i]['task_title'],
                personal: per,
                deadline: preTasks[i]['deadline'].toString(),
                complete: false,
                agendaNum: preTasks[i]['agenda_num'].toString(),
                taskNum: preTasks[i]['task_num'].toString(),
                prevDeadline: preTasks[i]['previous_deadline'],
              ),
            );
          } else {
            completed.add(
              SizedBox(
                height: (i == 0 ? 12 : 20) /
                    800 *
                    MediaQuery.of(context).size.height,
              ),
            );
            completed.add(
              TaskTileNormal(
                title: preTasks[i]['agenda_title'],
                taskTitle: preTasks[i]['task_title'],
                personal: per,
                deadline: preTasks[i]['deadline'].toString(),
                complete: true,
                agendaNum: preTasks[i]['agenda_num'].toString(),
                taskNum: preTasks[i]['task_num'].toString(),
                discuss: false,
                prevDeadline: '',
              ),
            );
          }
        }
        print("idhar");
        print(extend);
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

  late Socket socket;

  void connectToServer() {
    try {
      socket = io('https://meep-websocket.onrender.com/', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      print("here");
      socket.on('connect', (_) => print('connect: ${socket.id}'));
      socket.emit('turned on', 'hello');
      socket.onConnectError((data) => print(data));
      socket.on('disconnect', (_) => print('disconnect'));
      socket.on('fromServer', (_) => print(_));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    connectToServer();
    socket.on(
        'Refresh',
        (mId) => {
              if (mId == widget.meetId)
                {
                  print("refresh"),
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MeetWaitPage(meetId: widget.meetId)),
                    (Route<dynamic> route) => false,
                  ),
                }
            });
    // socket.on('Refresh',widget.meetId)
    super.initState();
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
                StreamBuilder<http.Response>(
                  stream: getMeetName(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> data =
                          json.decode(snapshot.data!.body);
                      return Text(
                        data['title'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kGrey,
                        ),
                      );
                    } else {
                      return Text("Loading...");
                    }
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Attendance(meetId: widget.meetId);
                          },
                        );
                      },
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
                        // FutureBuilder(
                        //   future: _handleTasks(),
                        //   builder: (context, snapshot) {
                        //     return Column(
                        //       children: [
                        // if (incomplete.isNotEmpty ||
                        //     extend.isNotEmpty ||
                        //     discuss.isNotEmpty)
                        //   Row(
                        //     children: [
                        //       SizedBox(
                        //         width: 32,
                        //       ),
                        //       Text(
                        //         "Incomplete",
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w700,
                        //           color: kGrey,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ...incomplete,
                        // // SizedBox(
                        // //   height: 12,
                        // // ),
                        // ...extend,
                        // SizedBox(
                        //   height: 12,
                        // ),
                        // ...discuss,
                        // if (discuss.isNotEmpty)
                        //   SizedBox(
                        //     height: 30 /
                        //         800 *
                        //         MediaQuery.of(context).size.height,
                        //   ),

                        // if (incomplete.isNotEmpty)
                        //   SizedBox(
                        //     height: 30 /
                        //         800 *
                        //         MediaQuery.of(context).size.height,
                        //   ),
                        // if (completed.isNotEmpty)
                        //   Row(
                        //     children: [
                        //       SizedBox(
                        //         width: 32,
                        //       ),
                        //       Text(
                        //         "Completed",
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w700,
                        //           color: kGrey,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ...completed,
                        //         // TaskTileNormal(
                        //         //   title: 'title',
                        //         //   taskTitle: '',
                        //         //   personal: '',
                        //         //   deadline: "nfsvbs",
                        //         //   complete: false,
                        //         //   agendaNum: "0",
                        //         //   taskNum: "0",
                        //         //   prevDeadline: "bvsjdvjs",
                        //         //   discuss: true,
                        //         // ),
                        //       ],
                        //     );
                        //   },
                        // ),

                        // StreamBuilder(
                        //   stream: getPreId(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData) {
                        //       String previousMeetId = json.decode(
                        //           snapshot.data!.body)['previous_meeting'];
                        //       // print(previousMeetId)
                        //       print("1 done");
                        //       return
                        StreamBuilder(
                          stream: getDiscuss(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              Map discussFurther =
                                  json.decode(snapshot.data!.body);
                              // print(discussFurther);

                              // print("2 done");
                              return StreamBuilder(
                                stream: getTasks(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<dynamic> tasksData =
                                        json.decode(snapshot.data!.body);
                                    List discussIds = [];
                                    for (int i = 0;
                                        i <
                                            discussFurther['discussFurther']
                                                .length;
                                        i++) {
                                      discussIds.add(
                                          discussFurther['discussFurther'][i]
                                              ['task_id']);
                                    }
                                    incomplete = [];
                                    completed = [];
                                    extend = [];
                                    discuss = [];

                                    for (int i = 0; i < tasksData.length; i++) {
                                      String per = '';
                                      for (int k = 0;
                                          k <
                                              tasksData[i]['task_personnel']
                                                  .length;
                                          k++) {
                                        if (k == 0) {
                                          per = per +
                                              "@" +
                                              tasksData[i]['task_personnel'][k]
                                                      ['name']
                                                  .toString()
                                                  .split(' ')[0];
                                        } else {
                                          per = per +
                                              ", @" +
                                              tasksData[i]['task_personnel'][k]
                                                      ['name']
                                                  .toString()
                                                  .split(' ')[0];
                                        }
                                      }
                                      if (discussIds
                                          .contains(tasksData[i]['task_id'])) {
                                        discuss.add(
                                          SizedBox(
                                            height: (i == 0 ? 12 : 20) /
                                                800 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                          ),
                                        );
                                        discuss.add(
                                          TaskTileNormal(
                                            discuss: true,
                                            title: tasksData[i]['agenda_title'],
                                            taskTitle: tasksData[i]
                                                ['task_title'],
                                            personal: per,
                                            deadline: tasksData[i]['deadline']
                                                .toString(),
                                            complete: false,
                                            agendaNum: tasksData[i]
                                                    ['agenda_num']
                                                .toString(),
                                            taskNum: tasksData[i]['task_num']
                                                .toString(),
                                            prevDeadline: '',
                                          ),
                                        );
                                      } else {
                                        if (tasksData[i]['status'] ==
                                                'Incomplete' &&
                                            tasksData[i]['previous_deadline'] ==
                                                null) {
                                          incomplete.add(
                                            SizedBox(
                                              height: (i == 0 ? 12 : 20) /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                          );
                                          incomplete.add(
                                            TaskTileComplex(
                                              meetId: widget.meetId,
                                              // prevDeadline: '',
                                              id: tasksData[i]['task_id'],
                                              agenda: tasksData[i]
                                                  ['agenda_title'],
                                              deadline: tasksData[i]['deadline']
                                                  .toString(),
                                              personnel: per,
                                              task: tasksData[i]['task_title'],
                                              agendaNum: tasksData[i]
                                                      ['agenda_num']
                                                  .toString(),
                                              taskNum: tasksData[i]['task_num']
                                                  .toString(),
                                            ),
                                          );
                                        } else if (tasksData[i]['status'] ==
                                                'Incomplete' &&
                                            tasksData[i]['previous_deadline'] !=
                                                null) {
                                          extend.add(
                                            SizedBox(
                                              height: (i == 0 ? 12 : 20) /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                          );
                                          extend.add(
                                            TaskTileNormal(
                                              discuss: false,
                                              title: tasksData[i]
                                                  ['agenda_title'],
                                              taskTitle: tasksData[i]
                                                  ['task_title'],
                                              personal: per,
                                              deadline: tasksData[i]['deadline']
                                                  .toString(),
                                              complete: false,
                                              agendaNum: tasksData[i]
                                                      ['agenda_num']
                                                  .toString(),
                                              taskNum: tasksData[i]['task_num']
                                                  .toString(),
                                              prevDeadline: tasksData[i]
                                                  ['previous_deadline'],
                                            ),
                                          );
                                        } else {
                                          completed.add(
                                            SizedBox(
                                              height: (i == 0 ? 12 : 20) /
                                                  800 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                            ),
                                          );
                                          completed.add(
                                            TaskTileNormal(
                                              title: tasksData[i]
                                                  ['agenda_title'],
                                              taskTitle: tasksData[i]
                                                  ['task_title'],
                                              personal: per,
                                              deadline: tasksData[i]['deadline']
                                                  .toString(),
                                              complete: true,
                                              agendaNum: tasksData[i]
                                                      ['agenda_num']
                                                  .toString(),
                                              taskNum: tasksData[i]['task_num']
                                                  .toString(),
                                              discuss: false,
                                              prevDeadline: '',
                                            ),
                                          );
                                        }
                                      }
                                      // print("idhar");
                                      // print(extend);
                                    }
                                    return Column(
                                      children: [
                                        if (incomplete.isNotEmpty ||
                                            extend.isNotEmpty ||
                                            discuss.isNotEmpty)
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
                                        // SizedBox(
                                        //   height: 12,
                                        // ),
                                        ...extend,
                                        SizedBox(
                                          height: 12,
                                        ),
                                        ...discuss,
                                        if (discuss.isNotEmpty)
                                          SizedBox(
                                            height: 30 /
                                                800 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                          ),

                                        if (incomplete.isNotEmpty)
                                          SizedBox(
                                            height: 30 /
                                                800 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
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
                                        ...completed,
                                      ],
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                        //     } else {
                        //       return CircularProgressIndicator();
                        //     }
                        //   },
                        // ),
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
                      if (incomplete.isEmpty) {
                        socket.emit('Proceed', widget.meetId);
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
                      }
                    },
                    child: Container(
                      height: 50 / 800 * MediaQuery.of(context).size.height,
                      width: 317 / 360 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: incomplete.isNotEmpty
                            ? kPurple2.withOpacity(0.56)
                            : kPurple,
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
