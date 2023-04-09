// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, prefer_if_null_operators, use_build_context_synchronously, unused_local_variable, unused_element, prefer_interpolation_to_compose_strings, unused_field, prefer_final_fields, avoid_types_as_parameter_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/agenda_page_attendee.dart';
import 'package:meep/pages/attendee_waiting.dart';
import 'package:meep/pages/meet_details_agenda.dart';
import 'package:meep/pages/meet_details_det.dart';
import 'package:meep/pages/meet_wait_page.dart';
import 'package:meep/pages/waiting_page.dart';
import 'package:meep/utils/agenda_tile.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/invitee.dart';
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/task_tile.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:extended_tabs/extended_tabs.dart';

class MeetingDetails extends StatefulWidget {
  final String id;
  const MeetingDetails({super.key, required this.id});
  // static String id = "meetingdetails";
  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails>
    with TickerProviderStateMixin {
  Map<String, dynamic> detailsRes = {};
  List<Widget> participants = [];
  List<Widget> tasksList = [];
  List<dynamic> agendas = [];
  List<dynamic> tasks = [];
  List<dynamic> newAgendas = [];
  List<Widget> agendasList = [];
  bool continuation = false;
  Widget previous = Container();
  bool funcCall = false;
  bool actionTakenReport = false;
  LoginController controller = Get.put(LoginController());

  Future<void> _handleDetailPage() async {
    if (!funcCall) {
      try {
        // Map json1 = {
        //   'name': 'Mudit',
        //   'email': 'mudit@gmail.com',
        //   'picture':
        //       'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
        // };
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
              'https://meep-nine.vercel.app/meetings/details/${widget.id}'),
          body: json.encode(json1),
          headers: {"Content-Type": "application/json"},
        );

        detailsRes = (json.decode(response.body));
        print(detailsRes);

        participants = [];
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

        if (detailsRes['previous_meeting'] != "") {
          actionTakenReport = true;
          final agendaResponse = await http.post(
            Uri.parse(
                'https://meep-nine.vercel.app/agendas/${detailsRes['previous_meeting']}'),
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
        }

        final newAgendaResponse = await http.post(
          Uri.parse('https://meep-nine.vercel.app/agendas/${widget.id}'),
          body: json.encode(json1),
          headers: {"Content-Type": "application/json"},
        );

        newAgendas = json.decode(newAgendaResponse.body);

        for (int i = 0; i < newAgendas.length; i++) {
          if (i != 0) {
            agendasList.add(
              SizedBox(
                height: 18 / 800 * MediaQuery.of(context).size.height,
              ),
            );
            agendasList.add(
              AgendaTile(
                title: newAgendas[i]['title'],
              ),
            );
          } else {
            agendasList.add(
              AgendaTile(
                title: newAgendas[i]['title'],
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
      funcCall = true;
    }
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
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: FutureBuilder<void>(
        future: _handleDetailPage(),
        builder: (context, snapshot) {
          if (funcCall) {
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
                    child: DefaultTabController(
                      length: 2,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height:
                                  76 / 800 * MediaQuery.of(context).size.height,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Align(
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
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height:
                                  3 / 800 * MediaQuery.of(context).size.height,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Align(
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
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height:
                                  47 / 800 * MediaQuery.of(context).size.height,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Expanded(
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
                                      Container(
                                        height: 5,
                                        width: 66 /
                                            360 *
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromRGBO(154, 154, 154, 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20 /
                                            800 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      Container(
                                        child: TabBar(
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          indicator: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: kPurple,
                                          ),
                                          labelStyle: TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          labelColor: Colors.white,
                                          unselectedLabelColor: Colors.black,
                                          unselectedLabelStyle: TextStyle(
                                            fontFamily: 'Proxima Nova',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          controller: tabController,
                                          tabs: [
                                            Container(
                                              height: 45,
                                              width: 138,
                                              child: Center(
                                                child: Text(
                                                  "Details",
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 45,
                                              width: 138,
                                              child: Center(
                                                child: Text(
                                                  "Agenda",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20 /
                                            800 *
                                            MediaQuery.of(context).size.height,
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                420 /
                                                800,
                                        child: TabBarView(
                                          controller: tabController,
                                          children: [
                                            MeetDetailsDet(
                                              participants: participants,
                                              detailsRes: detailsRes,
                                              previous: previous,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                            MeetDetailsAgenda(
                                              tasksList: tasksList,
                                              agendasList: agendasList,
                                              actionTakenReport:
                                                  actionTakenReport,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ListView(
                          //   physics: NeverScrollableScrollPhysics(),
                          //   children: [],
                          // ),
                        ],
                      ),
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
                            // Navigator.pushNamed(context, WaitingPage.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailsRes['host'] ==
                                        controller.googleAccount.value?.email
                                    ? WaitingPage(
                                        meetId: widget.id,
                                        linked:continuation,
                                      )
                                    : AgendaPageAttendee(meetId: widget.id),
                              ),
                            );
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
