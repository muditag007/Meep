// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, unused_element, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/count_tile.dart';
import 'package:meep/utils/notification_tile.dart';
import 'package:meep/utils/task_tile.dart';
import 'package:meep/utils/update_tile.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class MomNotifications extends StatefulWidget {
  const MomNotifications({super.key});
  static String id = 'momnotifications';
  @override
  State<MomNotifications> createState() => _MomNotificationsState();
}

class _MomNotificationsState extends State<MomNotifications> {
  List<dynamic> tasks = [];
  List<Widget> tasksTile = [];
  bool funcCall = false;

  Future<void> _handleTasks() async {
    if (!funcCall) {
      try {
        Map json1 = {
          'name': 'Mudit',
          'email': 'fake@gmail.com',
          'picture':
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
        };

        // print(widget.id);

        final response = await http.post(
          Uri.parse('https://meep-nine.vercel.app/home/find/tasks'),
          body: json.encode(json1),
          headers: {"Content-Type": "application/json"},
        );

        tasks = json.decode(response.body);
        print(tasks);

        for (int i = 0; i < tasks.length; i++) {
          String personnels = '';
          for (int k = 0; k < tasks[i]['personnel'].length; k++) {
            if (k != 0) {
              personnels = personnels + ", ";
            }
            personnels = personnels +
                '@${tasks[i]['personnel'][k]['name'].toString().split(' ')[0]}';
          }
          tasksTile.add(
            TaskTile(
              title: tasks[i]['agenda_title'],
              taskTitle: tasks[i]['title'],
              personal: personnels,
              deadline: tasks[i]['deadline'].toString().substring(0, 10),
              complete: tasks[i]['status'] == 'Complete' ? true : false,
              agendaNum: 0,
              taskNum: 0,
            ),
          );
          tasksTile.add(
            SizedBox(
              height: 21 / 800 * MediaQuery.of(context).size.height,
            ),
          );
        }

        if (response.statusCode == 200) {
          print('Authentication successful');
        } else {
          print('Authentication error: ${response.reasonPhrase}');
        }
      } catch (error) {
        print('Sign-in error: $error');
      }
      
      funcCall = true;
    }
  }

  // @override
  // void initState() {
  //   _handleTasks();
  //   super.initState();
  // }

  bool updateTab = true;
  bool yourTask = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 62 / 800 * MediaQuery.of(context).size.height +
                        MediaQuery.of(context).viewPadding.top,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Let's Get You Up To Date",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27 / 800 * MediaQuery.of(context).size.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CountTile(
                        name: "Updates",
                        count: "2",
                        onpressed: () {
                          setState(() {
                            updateTab = true;
                            yourTask = true;
                          });
                        },
                        border: true,
                        selected: updateTab,
                      ),
                      SizedBox(
                        width: 21 / 360 * MediaQuery.of(context).size.width,
                      ),
                      CountTile(
                        name: "Tasks",
                        count: "13",
                        onpressed: () {
                          setState(() {
                            updateTab = false;
                          });
                        },
                        border: true,
                        selected: !updateTab,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 31 / 800 * MediaQuery.of(context).size.height,
                  ),
                  updateTab
                      ? Expanded(
                          child: Container(
                            // height: null,
                            // height:
                            // (490 / 800 * MediaQuery.of(context).size.height),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 21 /
                                    360 *
                                    MediaQuery.of(context).size.width,
                              ),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  SizedBox(
                                    height: 14 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 66 /
                                        360 *
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(154, 154, 154, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 4 /
                                            360 *
                                            MediaQuery.of(context).size.width,
                                      ),
                                      Text(
                                        "Previous Meetings",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: kGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  NotificationTile(),
                                  SizedBox(
                                    height: 13 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  NotificationTile(),
                                  SizedBox(
                                    height: 13 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  NotificationTile(),
                                  SizedBox(
                                    height: 13 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  NotificationTile(),
                                  SizedBox(
                                    height: 13 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  )
                                ],
                              ),
                            ),
                            // color: Colors.red,
                          ),
                        )
                      : Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(
                                  height: 14 /
                                      800 *
                                      MediaQuery.of(context).size.height,
                                ),
                                Container(
                                  height: 5,
                                  width: 66 /
                                      360 *
                                      MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromRGBO(154, 154, 154, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 11 /
                                      800 *
                                      MediaQuery.of(context).size.height,
                                ),
                                yourTask
                                    ? Row(
                                        children: [
                                          SizedBox(
                                            width: 21 /
                                                360 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Container(
                                            width: 168 /
                                                360 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            height: 45 /
                                                800 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: kPurple,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 21 /
                                                    360 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                right: 16 /
                                                    360 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Text(
                                                    "Your Tasks",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Icon(
                                                    IconlyLight.filter,
                                                    color: kOrange,
                                                    size: 24,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6 /
                                                360 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              // hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                setState(() {
                                                  yourTask = false;
                                                });
                                              },
                                              child: Text(
                                                "Team Updates",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          SizedBox(
                                            width: 42 /
                                                360 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              // hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () {
                                                setState(() {
                                                  yourTask = true;
                                                });
                                              },
                                              child: Text(
                                                "Your Tasks",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7 /
                                                360 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          Container(
                                            width: 192 /
                                                360 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            height: 45 /
                                                800 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: kPurple,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Team Updates",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 22 /
                                      800 *
                                      MediaQuery.of(context).size.height,
                                ),
                                // yourTask
                                //     ? TaskTile(
                                //         agendaNum: 0,
                                //         complete: false,
                                //         deadline: '',
                                //         personal: '',
                                //         taskNum: 0,
                                //         taskTitle: '',
                                //         title: '',
                                //       )
                                //     : UpdateTile(),
                                // SizedBox(
                                //   height: 21 /
                                //       800 *
                                //       MediaQuery.of(context).size.height,
                                // ),
                                // yourTask
                                //     ? TaskTile(
                                //         agendaNum: 0,
                                //         complete: false,
                                //         deadline: '',
                                //         personal: '',
                                //         taskNum: 0,
                                //         taskTitle: '',
                                //         title: '',
                                //       )
                                //     : UpdateTile(),
                                // SizedBox(
                                //   height: 21 /
                                //       800 *
                                //       MediaQuery.of(context).size.height,
                                // ),
                                // yourTask
                                //     ? TaskTile(
                                //         agendaNum: 0,
                                //         complete: false,
                                //         deadline: '',
                                //         personal: '',
                                //         taskNum: 0,
                                //         taskTitle: '',
                                //         title: '',
                                //       )
                                //     : UpdateTile(),
                                // SizedBox(
                                //   height: 21 /
                                //       800 *
                                //       MediaQuery.of(context).size.height,
                                // ),
                                // UpdateTile(),
                                FutureBuilder(
                                  future: _handleTasks(),
                                  builder: (context, snapshot) {
                                    if (funcCall) {
                                      if (yourTask) {
                                        return Column(
                                          children: tasksTile,
                                        );
                                      } else {
                                        return UpdateTile();
                                      }
                                    } else {
                                      return Container(
                                        height: 100,
                                        width: 100,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 10,
                                          color: kPurple,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
