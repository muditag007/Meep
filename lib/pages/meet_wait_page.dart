// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/agenda_page.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/task_tile.dart';
import 'package:meep/utils/task_tile_complex.dart';

class MeetWaitPage extends StatefulWidget {
  const MeetWaitPage({super.key});
  static String id = "meetwaitpage";
  @override
  State<MeetWaitPage> createState() => _MeetWaitPageState();
}

class _MeetWaitPageState extends State<MeetWaitPage> {
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                Text(
                  "Meeting Name",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kGrey,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
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
                        SizedBox(
                          height: 12 / 800 * MediaQuery.of(context).size.height,
                        ),
                        TaskTileComplex(),
                        SizedBox(
                          height: 20 / 800 * MediaQuery.of(context).size.height,
                        ),
                        TaskTileComplex(),
                        SizedBox(
                          height: 30 / 800 * MediaQuery.of(context).size.height,
                        ),
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
                        SizedBox(
                          height: 12 / 800 * MediaQuery.of(context).size.height,
                        ),
                        TaskTile(
                          agendaNum: 0,
                          complete: false,
                          deadline: '',
                          personal: '',
                          taskNum: 0,
                          taskTitle: '',
                          title: '',
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
                      Navigator.pushNamed(context, AgendaPage.id);
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
