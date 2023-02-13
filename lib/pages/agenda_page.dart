// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/agenda_form.dart';
import 'package:meep/utils/agenda_form_complex.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/summary_tile.dart';
import 'package:meep/utils/task_tile.dart';
import 'package:meep/utils/task_tile_complex.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});
  static String id = "agendapage";
  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  int agendas = 0;
  List<Widget> list = [];
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
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemBuilder: (context, index) {
                    //       return Column(
                    //         children: [
                    //           AgendaForm(),
                    //           SizedBox(
                    //             height:
                    //                 16 / 800 * MediaQuery.of(context).size.height,
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //     itemCount: agendas,
                    //   ),
                    // ),
                    ...list,
                    // AgendaForm(),
                    // SizedBox(
                    //   height: 16 / 800 * MediaQuery.of(context).size.height,
                    // ),
                    // AgendaForm(),
                    // SizedBox(
                    //   height: 16 / 800 * MediaQuery.of(context).size.height,
                    // ),
                    SummaryTile(
                      summaryShort: true,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            agendas++;
                            list.add(
                              AgendaFormComplex(),
                            );
                            list.add(
                              SizedBox(
                                height: 16 /
                                    800 *
                                    MediaQuery.of(context).size.height,
                              ),
                            );
                          });
                        },
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: 46 / 800 * MediaQuery.of(context).size.height,
                          width: 318 / 360 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                              "Add an Agenda",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: kPurple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16 / 800 * MediaQuery.of(context).size.height,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
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
                              "Conclude Meeting",
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
