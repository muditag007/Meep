// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_element, unused_import, depend_on_referenced_packages, prefer_if_null_operators, avoid_print, override_on_non_overriding_member, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/mom_notifications.dart';
import 'package:meep/pages/previous_meet_page.dart';
import 'package:meep/pages/profile_page.dart';
import 'package:meep/pages/signin_page.dart';
import 'package:meep/provider/home_provider.dart';
import 'package:meep/utils/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/count_tile.dart';
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/meet_tile.dart';
import 'package:meep/utils/upcoming_meet_tile.dart';
import 'package:riverpod/riverpod.dart';
import 'package:meep/models/user_model.dart';
import 'package:meep/services/services.dart';

import '../provider/user_provider.dart';

class Temp extends ConsumerWidget {
  Temp({Key? key}) : super(key: key);
  static String id = 'temp';
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context, ref) {
    // use ref to listen to a provider
    final counter = ref.watch(homeDataProvider);
    // return Text('${counter}');
    return Scaffold(
      body: counter.when(
        data: (counter) {
          List<Widget> upcoming = [];
          for (int i = 0; i < counter.upcoming!.length; i++) {
            if (i != 0) {
              upcoming.add(
                SizedBox(
                  height: 10,
                ),
              );
            }
            upcoming.add(
              UpcomingMeetTile(
                title: counter.upcoming![i].title.toString(),
                host: counter.upcoming![i].host.toString(),
                time: counter.upcoming![i].time.toString(),
                team_name: counter.upcoming![i].teamName.toString(),
                venue: counter.upcoming![i].venue.toString(),
                id: counter.upcoming![i].sId.toString(),
              ),
            );
          }
          List<Widget> previous = [];
          for (int i = 0; i < counter.previous!.length; i++) {
            previous.add(
              MeetTile(
                name: counter.previous![i].title.toString(),
                date: counter.upcoming![i].date.toString(),
                time: counter.upcoming![i].time.toString(),
                team: counter.upcoming![i].teamName.toString(),
              ),
            );
          }
          print(counter.name.toString());
          return Scaffold(
            body: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 42 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width:
                                291 / 360 * MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hello, ${counter.name.toString().split(' ')[0]}!",
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ProfilePage.id);
                                    },
                                    child: Container(
                                      width: 67,
                                      height: 67,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            counter.image.toString(),
                                          ),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width:
                                318 / 360 * MediaQuery.of(context).size.width,
                            // color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                CountTile(
                                  name: "Meetings",
                                  count: counter.meetings.toString(),
                                  onpressed: () {},
                                ),
                                CountTile(
                                  name: "Updates",
                                  count: counter.updates.toString(),
                                  onpressed: () {
                                    Navigator.pushNamed(
                                        context, MomNotifications.id);
                                  },
                                ),
                                CountTile(
                                  name: "Tasks",
                                  count: counter.tasks.toString(),
                                  onpressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40 / 800 * MediaQuery.of(context).size.height,
                        ),
                        Expanded(
                          child: Container(
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
                                    height: 20 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Your Meetings for the day",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(77, 77, 77, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 11 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  ...upcoming,
                                  SizedBox(
                                    height: 30 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Your Previous Meetings",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(69, 68, 68, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                  ...previous,
                                  Material(
                                    child: InkWell(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PreviousMeetPage.id);
                                      },
                                      child: Container(
                                        height: 58 /
                                            800 *
                                            MediaQuery.of(context).size.height,
                                        width: 318 /
                                            360 *
                                            MediaQuery.of(context).size.width,
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
                                        child: Center(
                                          child: Text(
                                            "View All Previous Meetings",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  Color.fromRGBO(69, 68, 68, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25 /
                                        800 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    hasScrollBody: false,
                  )
                ],
              ),
            ),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover),
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
        ),
      ),
    );
  }
}
