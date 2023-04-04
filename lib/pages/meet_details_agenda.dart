// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class MeetDetailsAgenda extends StatefulWidget {
  final List<Widget> tasksList;
  final List<Widget> agendasList;
  final bool actionTakenReport;
  const MeetDetailsAgenda({
    super.key,
    required this.tasksList,
    required this.agendasList,
    required this.actionTakenReport,
  });

  @override
  State<MeetDetailsAgenda> createState() => _MeetDetailsAgendaState();
}

class _MeetDetailsAgendaState extends State<MeetDetailsAgenda> {
  bool actionreport = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        if (widget.actionTakenReport)
          Container(
            width: 318 / 360 * MediaQuery.of(context).size.width,
            // height: 59 / 800 * MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                kShadow,
              ],
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Container(
                  // constraints: BoxConstraints.expand(),
                  width: 52 / 360 * MediaQuery.of(context).size.width,
                  height: 59 / 800 * MediaQuery.of(context).size.height,
                  // height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    color: kOrange.withOpacity(0.43),
                  ),
                  child: Center(
                    child: Icon(
                      IconlyBold.edit,
                      size: 25,
                      color: Color.fromRGBO(19, 15, 38, 1),
                    ),
                  ),
                ),
                Container(
                  width: 266 / 360 * MediaQuery.of(context).size.width,
                  // height: 59 / 800 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5 / 800 * MediaQuery.of(context).size.height,
                      horizontal: 16 / 360 * MediaQuery.of(context).size.width,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // setState(
                            //     () {
                            //   actionreport =
                            //       !actionreport;
                            // });
                            SchedulerBinding.instance
                                .addPostFrameCallback((_) => setState(() {
                                      actionreport = !actionreport;
                                    }));
                          },
                          icon: Icon(
                            !actionreport
                                ? IconlyBold.arrow_down_2
                                : IconlyBold.arrow_up_2,
                            color: kGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (widget.actionTakenReport)
          SizedBox(
            height: 18 / 800 * MediaQuery.of(context).size.height,
          ),
        if (actionreport) ...widget.tasksList,
        ...widget.agendasList,
      ],
    );
  }
}
