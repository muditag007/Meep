// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, prefer_if_null_operators, use_build_context_synchronously, unused_local_variable, unused_element, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/meet_wait_page.dart';
import 'package:meep/utils/agenda_tile.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/invitee.dart';
import 'package:meep/utils/task_tile.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class MeetingDetails extends StatefulWidget {
  final String id;
  const MeetingDetails({super.key, required this.id});
  // static String id = "meetingdetails";
  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
  Map<String, dynamic> detailsRes = {};
  List<Widget> participants = [];
  List<Widget> tasksList = [];
  List<dynamic> agendas = [];
  List<dynamic> tasks = [];
  bool continuation = false;
  Widget previous = Container();
  bool funcCall = false;

  Future<void> _handleDetailPage() async {
    if (!funcCall) {
      try {
        Map json1 = {
          'name': 'Mudit',
          'email': 'mudit@gmail.com',
          'picture':
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
        };

        // print(widget.id);

        final response = await http.post(
          Uri.parse(
              'https://meep-nine.vercel.app/meetings/details/${widget.id}'),
          body: json.encode(json1),
          headers: {"Content-Type": "application/json"},
        );

        detailsRes = (json.decode(response.body));

        participants = [];
        // print("heeloooooo");
        // print(detailsRes['participants']);
        for (int i = 0; i < detailsRes['participants'].length; i++) {
          if (i != 0) {
            participants.add(
              SizedBox(
                height: 16 / 800 * MediaQuery.of(context).size.height,
              ),
            );
          }
          participants.add(
            Invitee(
              name: detailsRes['participants'][i]['name'],
              image: detailsRes['participants'][i]['image'],
            ),
          );
        }

        if (detailsRes['previous_meeting'] != "") {
          continuation = true;

          final preResponse = await http.post(
            Uri.parse(
                'https://meep-nine.vercel.app/meetings/details/${detailsRes['previous_meeting']}'),
            body: json.encode(json1),
            headers: {"Content-Type": "application/json"},
          );

          Map<String, dynamic> previousRes = (json.decode(response.body));

          previous = Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "In continuation to",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 9 / 800 * MediaQuery.of(context).size.height,
              ),
              Container(
                width: 269 / 360 * MediaQuery.of(context).size.width,
                height: 37 / 800 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    kShadow,
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        previousRes['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: kPurple,
                        ),
                      ),
                      Text(
                        previousRes['date'].toString().substring(0, 10),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20 / 800 * MediaQuery.of(context).size.height,
              ),
            ],
          );
        }

        final agendaResponse = await http.post(
          Uri.parse('https://meep-nine.vercel.app/agendas/${widget.id}'),
          body: json.encode(json1),
          headers: {"Content-Type": "application/json"},
        );

        agendas = json.decode(agendaResponse.body);
        print("gefbrikvbruvbruvbcsvevefv");
        print(agendas);
        tasksList = [];
        for (int i = 0; i < agendas.length; i++) {
          final tasksResponse = await http.post(
            Uri.parse(
                'https://meep-nine.vercel.app/tasks/${agendas[i]['_id']}'),
            body: json.encode(json1),
            headers: {"Content-Type": "application/json"},
          );

          tasks = json.decode(tasksResponse.body);
          print('befuvbevbe');
          print(tasks);

          for (int j = 0; j < tasks.length; j++) {
            if (j != 0) {
              tasksList.add(
                SizedBox(
                  height: 18,
                ),
              );
            }
            String personnels = '';
            for (int k = 0; k < tasks[j]['personnel'].length; k++) {
              if (k != 0) {
                personnels = personnels + ", ";
              }
              personnels = personnels +
                  '@${tasks[j]['personnel'][k]['name'].toString().split(' ')[0]}';
            }
            tasksList.add(TaskTile(
              agendaNum: i + 1,
              complete: tasks[j]['status'] == 'Incomplete' ? false : true,
              deadline: tasks[j]['deadline'].toString().substring(0, 10),
              personal: personnels,
              taskNum: j + 1,
              taskTitle: tasks[j]['title'],
              title: agendas[i]['title'],
            ));
            if (j == tasks.length - 1) {
              tasksList.add(
                SizedBox(
                  height: 18,
                ),
              );
            }
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
      funcCall = true;
    }

    //   try {
    //     Map json1 = {
    //       'name': 'Mudit',
    //       'email': 'mudit@gmail.com',
    //       'picture':
    //           'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
    //     };

    //     if (agendaResponse.statusCode == 200) {
    //       print('Authentication successful');
    //     } else {
    //       print('Authentication error: ${agendaResponse.reasonPhrase}');
    //     }
    //   } catch (error) {
    //     print('Sign-in error: $error');
    //   }
  }

  bool detailpage = true;
  bool actionreport = false;

  // @override
  // void initState() {
  //   _handleDetailPage();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple,
      body: FutureBuilder<void>(
        future: _handleDetailPage(),
        builder: (context, snapshot) {
          if (detailsRes['title'] != null) {
            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * (1 - 95 / 800),
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 76 /
                                    800 *
                                    MediaQuery.of(context).size.height,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  detailsRes['title'] != null
                                      ? detailsRes['title']
                                      : "Loading...",
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    shadows: [
                                      Shadow(
                                        blurRadius: 15,
                                        offset: Offset(0, 4),
                                        color: Color.fromRGBO(69, 68, 68, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3 /
                                    800 *
                                    MediaQuery.of(context).size.height,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  detailsRes['host'] != null
                                      ? detailsRes['host']
                                      : "Loading...",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    shadows: [
                                      Shadow(
                                        blurRadius: 15,
                                        offset: Offset(0, 4),
                                        color: Color.fromRGBO(69, 68, 68, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 47 /
                                    800 *
                                    MediaQuery.of(context).size.height,
                              ),
                              Expanded(
                                child: Container(
                                  // height: double.infinity,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 17 /
                                          800 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    child: Column(
                                      children: [
                                        // SizedBox(
                                        //   height: 12 / 800 * MediaQuery.of(context).size.height,
                                        // ),
                                        Container(
                                          height: 5,
                                          width: 66 /
                                              360 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color.fromRGBO(
                                                154, 154, 154, 1),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11 /
                                              800 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 22 /
                                                360 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    if (!detailpage) {
                                                      // setState(() {
                                                      //   detailpage = true;
                                                      // });
                                                      SchedulerBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) =>
                                                                  setState(() {
                                                                    detailpage =
                                                                        true;
                                                                  }));
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 45 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 138 /
                                                        360 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: detailpage
                                                          ? Color.fromRGBO(
                                                              107, 0, 215, 1)
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Details",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: detailpage
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    if (detailpage) {
                                                      // setState(() {
                                                      //   detailpage = false;
                                                      // });
                                                      SchedulerBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) =>
                                                                  setState(() {
                                                                    detailpage =
                                                                        false;
                                                                  }));
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 45 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width: 138 /
                                                        360 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: !detailpage
                                                          ? Color.fromRGBO(
                                                              107, 0, 215, 1)
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Agenda",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: !detailpage
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20 /
                                              800 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                        ),
                                        detailpage
                                            ? Container(
                                                width: 318 /
                                                    360 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 25,
                                                      spreadRadius: 4,
                                                      offset: Offset(0, 8),
                                                      color: Color.fromRGBO(
                                                          69, 68, 68, 0.32),
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 22 /
                                                        360 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    vertical: 21 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      // SizedBox(
                                                      //   height:
                                                      //       21 / 800 * MediaQuery.of(context).size.height,
                                                      // ),
                                                      Text(
                                                        detailsRes['host'] !=
                                                                null
                                                            ? "${detailsRes['date'].toString().substring(0, 10)}, ${detailsRes['time']}"
                                                            : "Waiting...",
                                                        style: TextStyle(
                                                          // fontStyle: FontStyle.normal,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromRGBO(
                                                              69, 68, 68, 1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 3 /
                                                            800 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          Icon(
                                                            IconlyBold.location,
                                                            size: 20,
                                                            color:
                                                                Color.fromRGBO(
                                                              107,
                                                              0,
                                                              215,
                                                              1,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 1,
                                                          ),
                                                          Text(
                                                            detailsRes['venue'] !=
                                                                    null
                                                                ? detailsRes[
                                                                    'venue']
                                                                : "To be decided",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      69,
                                                                      68,
                                                                      68,
                                                                      1),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 17 /
                                                            800 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                      ),

                                                      previous,
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Invitees",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: kGrey,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5 /
                                                            800 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                      ),
                                                      ...participants,
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Column(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Container(
                                                    width: 318 /
                                                        360 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    // height: 59 / 800 * MediaQuery.of(context).size.height,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      boxShadow: [
                                                        kShadow,
                                                      ],
                                                      color: Colors.transparent,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          // constraints: BoxConstraints.expand(),
                                                          width: 52 /
                                                              360 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                          height: 59 /
                                                              800 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height,
                                                          // height: double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              bottomLeft: Radius
                                                                  .circular(15),
                                                            ),
                                                            color: kOrange
                                                                .withOpacity(
                                                                    0.43),
                                                          ),
                                                          child: Center(
                                                            child: Icon(
                                                              IconlyBold.edit,
                                                              size: 25,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      19,
                                                                      15,
                                                                      38,
                                                                      1),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 266 /
                                                              360 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                          // height: 59 / 800 * MediaQuery.of(context).size.height,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(15),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 5 /
                                                                  800 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height,
                                                              horizontal: 16 /
                                                                  360 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                // SizedBox(
                                                                //   width: 16 /
                                                                //       360 *
                                                                //       MediaQuery.of(context)
                                                                //           .size
                                                                //           .width,
                                                                // ),
                                                                Flexible(
                                                                  child: Text(
                                                                    "Action Taken Report",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color:
                                                                          kGrey,
                                                                    ),
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    // setState(
                                                                    //     () {
                                                                    //   actionreport =
                                                                    //       !actionreport;
                                                                    // });
                                                                    SchedulerBinding
                                                                        .instance
                                                                        .addPostFrameCallback((_) =>
                                                                            setState(() {
                                                                              actionreport = !actionreport;
                                                                            }));
                                                                  },
                                                                  icon: Icon(
                                                                    !actionreport
                                                                        ? IconlyBold
                                                                            .arrow_down_2
                                                                        : IconlyBold
                                                                            .arrow_up_2,
                                                                    color:
                                                                        kGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 18 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                  if (actionreport)
                                                    ...tasksList,
                                                  // if (actionreport)
                                                  //   SizedBox(
                                                  //     height: 18 /
                                                  //         800 *
                                                  //         MediaQuery.of(context)
                                                  //             .size
                                                  //             .height,
                                                  //   ),
                                                  // if (actionreport) TaskTile(),
                                                  // if (actionreport)
                                                  //   SizedBox(
                                                  //     height: 18 /
                                                  //         800 *
                                                  //         MediaQuery.of(context)
                                                  //             .size
                                                  //             .height,
                                                  //   ),
                                                  AgendaTile(
                                                    title:
                                                        "Revenue Generation Methods",
                                                  ),
                                                  SizedBox(
                                                    height: 18 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                  AgendaTile(
                                                    title:
                                                        "Commision of New Research",
                                                  ),
                                                  SizedBox(
                                                    height: 18 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                  AgendaTile(
                                                    title:
                                                        "Collaborative Efforts",
                                                  ),
                                                  SizedBox(
                                                    height: 18 /
                                                        800 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                  AgendaTile(
                                                    title:
                                                        "Planning for Upcoming Recruitments",
                                                  ),
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          hasScrollBody: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 95 / 800 * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 25,
                          spreadRadius: 4,
                          offset: Offset(0, -4),
                          color: Color.fromRGBO(69, 68, 68, 0.32),
                        )
                      ],
                    ),
                    child: Center(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pushNamed(context, MeetWaitPage.id);
                          },
                          child: Container(
                            height:
                                49 / 800 * MediaQuery.of(context).size.height,
                            width:
                                317 / 360 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: kPurple,
                              borderRadius: BorderRadius.circular(15),
                              // ignore: prefer_const_literals_to_create_immutables
                            ),
                            child: Center(
                              child: Text(
                                "Join This Meeting",
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
            );
          } else {
            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
