// ignore_for_file: unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/home_page.dart';
import 'package:meep/utils/agenda_task.dart';
import 'package:meep/utils/attendance.dart';
import 'package:meep/utils/constants.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/short_agenda_attendee.dart';
import 'package:meep/utils/summary_tile.dart';
import 'package:meep/utils/task_tile_normal.dart';
import 'package:socket_io_client/socket_io_client.dart';

class AgendaPageAttendee extends StatefulWidget {
  final String meetId;
  const AgendaPageAttendee({super.key, required this.meetId});

  @override
  State<AgendaPageAttendee> createState() => _AgendaPageAttendeeState();
}

class _AgendaPageAttendeeState extends State<AgendaPageAttendee> {
  LoginController controller = Get.put(LoginController());
  String meetName = '';
  List agendasList = [];
  List<Widget> agendasWidget = [];
  List<Widget> discuss = [];
  List convertIds = [];
  List<Widget> discussAgendas = [];
  List discussIds = [];
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

  Stream<http.Response> getAgendas() async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) {
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
            'https://meep-nine.vercel.app/agendas/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
    }).asyncMap((event) async => await event);
  }

  Stream<http.Response> getDiscuss() async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) {
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

  Stream<http.Response> getTasks() async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) async {
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

  // Future<void> _handleDiscussIds() async {
  //   try {
  //     Map<String, Map> json1 = {
  //       'token': {
  //         'displayName': controller.googleAccount.value?.displayName,
  //         'photoUrl': controller.googleAccount.value?.photoUrl,
  //         'id': controller.googleAccount.value?.id,
  //         'email': controller.googleAccount.value?.email,
  //         'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
  //       }
  //     };

  //     final response = await http.post(
  //       Uri.parse(
  //           'https://meep-nine.vercel.app/live/details/current/${widget.meetId}'),
  //       body: json.encode(json1),
  //       headers: {"Content-Type": "application/json"},
  //     );
  //     // print(json.decode(response.body));
  //     Map discussFurther = json.decode(response.body);

  //     for (int i = 0; i < discussFurther['discussFurther'].length; i++) {
  //       discussIds.add(discussFurther['discussFurther'][i]['task_id']);
  //     }

  //     if (response.statusCode == 200) {
  //       print('Authentication successful');
  //     } else {
  //       print('Authentication error: ${response.reasonPhrase}');
  //     }
  //   } catch (error) {
  //     print('Sign-in error: $error');
  //   }
  // }

  Future<void> _handleDiscussTasks() async {
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

      final responseDis = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/current/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
      // print(json.decode(response.body));
      Map discussFurther = json.decode(responseDis.body);

      for (int i = 0; i < discussFurther['discussFurther'].length; i++) {
        discussIds.add(discussFurther['discussFurther'][i]['task_id']);
      }

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/meetings/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      final newRes = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/tasks/previous/${json.decode(response.body)['previous_meeting']}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      List<dynamic> tasksData = json.decode(newRes.body);
      // print("mudit $tasksData");
      discussAgendas = [];
      for (int i = 0; i < tasksData.length; i++) {
        String per = '';
        for (int k = 0; k < tasksData[i]['task_personnel'].length; k++) {
          if (k == 0) {
            per = per +
                "@" +
                tasksData[i]['task_personnel'][k]['name']
                    .toString()
                    .split(' ')[0];
          } else {
            per = per +
                ", @" +
                tasksData[i]['task_personnel'][k]['name']
                    .toString()
                    .split(' ')[0];
          }
        }
        if (discussIds.contains(tasksData[i]['task_id']) &&
            !convertIds.contains(tasksData[i]['task_id'])) {
          discussAgendas.add(
            SizedBox(
              height:
                  (i == 0 ? 12 : 20) / 800 * MediaQuery.of(context).size.height,
            ),
          );
          discussAgendas.add(
            TaskTileNormal(
              discuss: true,
              title: tasksData[i]['agenda_title'],
              taskTitle: tasksData[i]['task_title'],
              personal: per,
              deadline: tasksData[i]['deadline'].toString(),
              complete: false,
              agendaNum: tasksData[i]['agenda_num'].toString(),
              taskNum: tasksData[i]['task_num'].toString(),
              prevDeadline: '',
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

  Future<void> _handleAgendas() async {
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
            'https://meep-nine.vercel.app/agendas/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      agendasList = json.decode(response.body);
      agendasWidget = [];
      print(agendasList);
      int k = 0;
      for (int i = 0; i < agendasList.length; i++) {
        if (agendasList[i]['summary'] == null) {
          if (i == k) {
            agendasWidget.add(
              ShortAgendaAttendee(
                meetId: widget.meetId,
                agenda: agendasList[i]['title'],
                desc: agendasList[i]['description'],
                agenda_num: agendasList[i]['agenda_num'].toString(),
                // agendaId: agendasList[i]['_id'],
              ),
            );
          } else {
            agendasWidget.add(
              SummaryTile(
                summaryShort: true,
                agenda: agendasList[i]['title'],
                desc: agendasList[i]['description'],
                summary: '',
                agenda_num: agendasList[i]['agenda_num'].toString(),
              ),
            );
          }
        } else {
          // final taskRes = await http.post(
          //   Uri.parse(
          //       'https://meep-nine.vercel.app/tasks/${agendasList[i]['_id']}'),
          //   body: json.encode(json1),
          //   headers: {"Content-Type": "application/json"},
          // );
          // print("hellovrkvbrjv");
          // print(json.decode(taskRes.body));
          agendasWidget.add(
            AgendaTask(
              agendaNum: agendasList[i]['agenda_num'].toString(),
              agenda: agendasList[i]['title'],
              task: 'task',
              desc: agendasList[i]['description'],
              summary: agendasList[i]['summary'],
              personnel: '',
              deadline: '',
              taskNum: '',
            ),
          );
          k++;
        }

        if (i != agendasList.length - 1) {
          agendasWidget.add(
            SizedBox(
              height: 18,
            ),
          );
        }
        // completedAgendas.add(false);
      }

      print(json.decode(response.body));

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
  void initState() {
    connectToServer();
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20 / 800 * MediaQuery.of(context).size.height,
                    ),
                    Divider(
                      thickness: 0,
                      height: 0,
                      color: Colors.transparent,
                    ),
                    Container(
                      width: 200 / 360 * MediaQuery.of(context).size.width,
                      height: 170 / 800 * MediaQuery.of(context).size.height,
                      child: Image.asset("images/agenda.png"),
                    ),
                    SizedBox(
                      height: 20 / 800 * MediaQuery.of(context).size.height,
                    ),
                    Text(
                      "Meeting Agendas",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kGrey,
                      ),
                    ),
                    SizedBox(
                      height: 11 / 800 * MediaQuery.of(context).size.height,
                    ),
                    FutureBuilder(
                      future: _handleAgendas(),
                      builder: (context, snapshot) {
                        return Column(
                          children: agendasWidget,
                        );
                      },
                    ),
                    // StreamBuilder(
                    //   stream: getAgendas(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       agendasList = json.decode(snapshot.data!.body);
                    //       agendasWidget = [];
                    //       print(agendasList);
                    //       int k = 0;
                    //       for (int i = 0; i < agendasList.length; i++) {
                    //         if (agendasList[i]['summary'] == null) {
                    //           if (i == k) {
                    //             agendasWidget.add(
                    //               ShortAgendaAttendee(
                    //                 meetId: widget.meetId,
                    //                 agenda: agendasList[i]['title'],
                    //                 desc: agendasList[i]['description'],
                    //                 agenda_num:
                    //                     agendasList[i]['agenda_num'].toString(),
                    //                 // agendaId: agendasList[i]['_id'],
                    //               ),
                    //             );
                    //           } else {
                    //             agendasWidget.add(
                    //               SummaryTile(
                    //                 summaryShort: true,
                    //                 agenda: agendasList[i]['title'],
                    //                 desc: agendasList[i]['description'],
                    //                 summary: '',
                    //                 agenda_num:
                    //                     agendasList[i]['agenda_num'].toString(),
                    //               ),
                    //             );
                    //           }
                    //         } else {
                    //           // final taskRes = await http.post(
                    //           //   Uri.parse(
                    //           //       'https://meep-nine.vercel.app/tasks/${agendasList[i]['_id']}'),
                    //           //   body: json.encode(json1),
                    //           //   headers: {"Content-Type": "application/json"},
                    //           // );
                    //           // print("hellovrkvbrjv");
                    //           // print(json.decode(taskRes.body));
                    //           agendasWidget.add(
                    //             AgendaTask(
                    //               agendaNum:
                    //                   agendasList[i]['agenda_num'].toString(),
                    //               agenda: agendasList[i]['title'],
                    //               task: 'task',
                    //               desc: agendasList[i]['description'],
                    //               summary: agendasList[i]['summary'],
                    //               personnel: '',
                    //               deadline: '',
                    //               taskNum: '',
                    //             ),
                    //           );
                    //           k++;
                    //         }

                    //         if (i != agendasList.length - 1) {
                    //           agendasWidget.add(
                    //             SizedBox(
                    //               height: 18,
                    //             ),
                    //           );
                    //         }
                    //         // completedAgendas.add(false);
                    //       }
                    //       return Column(
                    //         children: [...agendasWidget],
                    //       );
                    //     } else {
                    //       return CircularProgressIndicator();
                    //     }
                    //   },
                    // ),
                    // StreamBuilder(
                    //   stream: getDiscuss(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       Map discussFurther = json.decode(snapshot.data!.body);
                    //       List discussIds = [];
                    //       for (int i = 0;
                    //           i < discussFurther['discussFurther'].length;
                    //           i++) {
                    //         discussIds.add(
                    //             discussFurther['discussFurther'][i]['task_id']);
                    //       }
                    //       discuss = [];
                    //       return StreamBuilder(
                    //         stream: getTasks(),
                    //         builder: (context, snapshot) {
                    //           if (snapshot.hasData) {
                    //             List<dynamic> tasksData =
                    //                 json.decode(snapshot.data!.body);
                    //             print("mudit $tasksData");
                    //             discuss = [];
                    //             for (int i = 0; i < tasksData.length; i++) {
                    //               String per = '';
                    //               for (int k = 0;
                    //                   k < tasksData[i]['task_personnel'].length;
                    //                   k++) {
                    //                 if (k == 0) {
                    //                   per = per +
                    //                       "@" +
                    //                       tasksData[i]['task_personnel'][k]
                    //                               ['name']
                    //                           .toString()
                    //                           .split(' ')[0];
                    //                 } else {
                    //                   per = per +
                    //                       ", @" +
                    //                       tasksData[i]['task_personnel'][k]
                    //                               ['name']
                    //                           .toString()
                    //                           .split(' ')[0];
                    //                 }
                    //               }
                    //               // if(summaryAll){
                    //               //   convertIds.add()
                    //               // }
                    //               if (discussIds
                    //                       .contains(tasksData[i]['task_id']) &&
                    //                   !convertIds
                    //                       .contains(tasksData[i]['task_id'])) {
                    //                 discuss.add(
                    //                   SizedBox(
                    //                     height: (i == 0 ? 12 : 20) /
                    //                         800 *
                    //                         MediaQuery.of(context).size.height,
                    //                   ),
                    //                 );
                    //                 discuss.add(
                    //                   TaskTileNormal(
                    //                     discuss: true,
                    //                     title: tasksData[i]['agenda_title'],
                    //                     taskTitle: tasksData[i]['task_title'],
                    //                     personal: per,
                    //                     deadline:
                    //                         tasksData[i]['deadline'].toString(),
                    //                     complete: false,
                    //                     agendaNum: tasksData[i]['agenda_num']
                    //                         .toString(),
                    //                     taskNum:
                    //                         tasksData[i]['task_num'].toString(),
                    //                     prevDeadline: '',
                    //                   ),
                    //                 );
                    //               }
                    //             }
                    //             return Column(
                    //               children: [
                    //                 ...discuss,
                    //               ],
                    //             );
                    //           } else {
                    //             return CircularProgressIndicator();
                    //           }
                    //         },
                    //       );
                    //     } else {
                    //       return CircularProgressIndicator();
                    //     }
                    //   },
                    // ),
                    FutureBuilder(
                      future: _handleDiscussTasks(),
                      builder: (context, snapshot) {
                        return Column(
                          children: discussAgendas,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16 / 800 * MediaQuery.of(context).size.height,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierColor: Colors.black54,
                            barrierDismissible: true,
                            barrierLabel: 'Label',
                            pageBuilder: (_, __, ___) {
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 160 /
                                      800 *
                                      MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20,
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Text(
                                            "Are you sure you want to leave this Meeting?",
                                            style: TextStyle(
                                              fontFamily: 'Proxima Nova',
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Material(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, HomePage.id);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 320,
                                              decoration: BoxDecoration(
                                                color: kPurple,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  width: 2,
                                                  color: kPurple,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Confirm",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Proxima Nova',
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: 46 / 800 * MediaQuery.of(context).size.height,
                          width: 318 / 360 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: kPurple,
                            boxShadow: [
                              kShadow,
                            ],
                            border: Border.all(
                              color: kPurple,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Leave Meeting",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30 / 800 * MediaQuery.of(context).size.height,
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
