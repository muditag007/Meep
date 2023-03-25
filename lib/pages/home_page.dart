// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, unused_element, avoid_print, unused_local_variable, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/meeting_details.dart';
import 'package:meep/pages/mom_notifications.dart';
import 'package:meep/pages/previous_meet_page.dart';
import 'package:meep/pages/profile_page.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/count_tile.dart';
import 'package:meep/utils/meet_tile.dart';
import 'package:http/http.dart' as http;
import 'package:meep/utils/upcoming_meet_tile.dart';
import 'dart:convert' show json;
import 'package:meep/utils/upcoming_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "homepage";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> homePageRes = {};
  List<Widget> upcomingMeets = [];
  List<Widget> previousMeets = [];

  Future<void> _handleHomePage() async {
    try {
      Map json1 = {
        'name': 'Mudit',
        'email': 'mudit@gmail.com',
        'picture':
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      };

      final response = await http.post(
        Uri.parse('https://meep-nine.vercel.app/home'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      homePageRes = (json.decode(response.body));
      print(homePageRes['upcoming']);
      previousMeets = [];
      upcomingMeets = [];
      for (int i = 0; i < homePageRes['previous'].length; i++) {
        previousMeets.add(
          MeetTile(
            name: homePageRes['previous'][i]['title'],
            date: homePageRes['previous'][i]['date'],
            time: homePageRes['previous'][i]['time'],
            team: homePageRes['previous'][i]['team_name'],
          ),
        );
      }

      for (int i = 0; i < homePageRes['upcoming'].length; i++) {
        if (i != 0) {
          upcomingMeets.add(
            SizedBox(
              height: 10,
            ),
          );
        }
        upcomingMeets.add(
          UpcomingMeetTile(
            title: homePageRes['upcoming'][i]['title'],
            host: homePageRes['upcoming'][i]['host'],
            time: homePageRes['upcoming'][i]['time'],
            team_name: homePageRes['upcoming'][i]['team_name'],
            venue: homePageRes['upcoming'][i]['venue'],
            id: homePageRes['upcoming'][i]['_id'],
          ),
        );
      }
      // print(homePageRes);

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
    _handleHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: FutureBuilder<void>(
            future: _handleHomePage(),
            builder: (context, snapshot) {
              return CustomScrollView(
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
                                  homePageRes['name'] != null
                                      ? "Hello, ${homePageRes['name']}!"
                                      : "Hello, ...!",
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
                                            homePageRes['image'] != null
                                                ? homePageRes['image']
                                                : "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
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
                                  count: homePageRes['name'] != null
                                      ? "${homePageRes['meetings']}"
                                      : "10",
                                  onpressed: () {},
                                ),
                                CountTile(
                                  name: "Updates",
                                  count: homePageRes['name'] != null
                                      ? "${homePageRes['updates']}"
                                      : "10",
                                  onpressed: () {
                                    Navigator.pushNamed(
                                        context, MomNotifications.id);
                                  },
                                ),
                                CountTile(
                                  name: "Tasks",
                                  count: homePageRes['name'] != null
                                      ? "${homePageRes['tasks']}"
                                      : "10",
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
                                  ...upcomingMeets,
                                  // UpcomingMeetTile(
                                  //   title: homePageRes['upcoming'][0]['title'],
                                  //   host: homePageRes['upcoming'][0]['host'],
                                  //   time: homePageRes['upcoming'][0]['time'],
                                  //   team_name: homePageRes['upcoming'][0]
                                  //       ['team_name'],
                                  //   venue: homePageRes['upcoming'][0]['duration']
                                  //       .toString(),
                                  // ),
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
                                  // MeetTile(
                                  //   name: "Timeline Discussion",
                                  //   date: "22nd Oct'22",
                                  //   time: "20:00",
                                  //   team: "E-Cell",
                                  // ),
                                  // MeetTile(
                                  //   name: "Timeline Discussion",
                                  //   date: "22nd Oct'22",
                                  //   time: "20:00",
                                  //   team: "E-Cell",
                                  // ),
                                  // MeetTile(
                                  //   name: "Timeline Discussion",
                                  //   date: "22nd Oct'22",
                                  //   time: "20:00",
                                  //   team: "E-Cell",
                                  // ),
                                  // MeetTile(
                                  //   name: "Timeline Discussion",
                                  //   date: "22nd Oct'22",
                                  //   time: "20:00",
                                  //   team: "E-Cell",
                                  // ),
                                  // MeetTile(
                                  //   name: "Timeline Discussion",
                                  //   date: "22nd Oct'22",
                                  //   time: "20:00",
                                  //   team: "E-Cell",
                                  // ),
                                  ...previousMeets,
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
              );
            }),
      ),
    );
  }
}
