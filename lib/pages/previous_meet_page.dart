// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/meet_tile.dart';

class PreviousMeetPage extends StatefulWidget {
  const PreviousMeetPage({super.key});
  static String id = "previousmeetpage";
  @override
  State<PreviousMeetPage> createState() => _PreviousMeetPageState();
}

class _PreviousMeetPageState extends State<PreviousMeetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25 / 800 * MediaQuery.of(context).size.height,
            horizontal: 20 / 360 * MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Meeting History",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: kGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 21 / 800 * MediaQuery.of(context).size.height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40 / 800 * MediaQuery.of(context).size.height,
                    width: 271 / 360 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2,
                        color: Color.fromRGBO(222, 222, 222, 1),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            20 / 360 * MediaQuery.of(context).size.width,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(222, 222, 222, 1),
                            ),
                          ),
                          Icon(
                            IconlyLight.search,
                            size: 24,
                            color: Color.fromRGBO(222, 222, 222, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconlyLight.filter,
                      size: 24,
                      color: kPurple,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21 / 800 * MediaQuery.of(context).size.height,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Previous Meetings",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 10 / 800 * MediaQuery.of(context).size.height,
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
              MeetTile(
                name: "Timeline Discussion",
                date: "Yesterday",
                time: "20:00",
                team: "Team 1",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
