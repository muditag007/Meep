// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_final_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class AgendaFormComplex extends StatefulWidget {
  const AgendaFormComplex({super.key});

  @override
  State<AgendaFormComplex> createState() => _AgendaFormComplexState();
}

class _AgendaFormComplexState extends State<AgendaFormComplex> {
  bool appoint = true;
  TextEditingController _summary = new TextEditingController();
  TextEditingController _agenda = new TextEditingController();
  TextEditingController _desc = new TextEditingController();
  TextEditingController _task = new TextEditingController();
  TextEditingController _personnel = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318,
      // / 360 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: kPurple,
        ),
        borderRadius: BorderRadius.circular(15),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 12.5,
            spreadRadius: 2,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: kPurple2.withOpacity(0.56),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: kPurple,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12 / 360 * MediaQuery.of(context).size.width,
                ),
                Flexible(
                  child: Text(
                    "Agenda",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: kGrey,
                    ),
                    // maxLines: 2,
                    // softWrap: false,
                    // overflow: TextOverflow.ellipsis,
                    // textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 28,
                ),
                Container(
                  height: 32,
                  width: 248,
                  child: TextField(
                    controller: _agenda,
                    cursorColor: kGrey,
                    decoration: kTextField.copyWith(
                      hintText: "Agenda",
                    ),
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      color: kGrey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  IconlyBold.document,
                  color: kPurple2,
                  size: 20,
                ),
                SizedBox(
                  width: 12 / 360 * MediaQuery.of(context).size.width,
                ),
                Flexible(
                  child: Text(
                    "Agenda Description",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: kGrey,
                    ),
                    // maxLines: 4,
                    // softWrap: false,
                    // overflow: TextOverflow.ellipsis,
                    // textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 28,
                ),
                Container(
                  height: 32,
                  width: 248,
                  child: TextField(
                    controller: _desc,
                    cursorColor: kGrey,
                    decoration:
                        kTextField.copyWith(hintText: "Agenda Description"),
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      color: kGrey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                SizedBox(
                  width: 27,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        appoint = true;
                        // _control.text = '';
                      });
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 23,
                      width: 68,
                      decoration: BoxDecoration(
                        color: appoint ? kPurple : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Appoint",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: appoint ? Colors.white : kGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        appoint = false;
                        // _control.text = '';
                      });
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 23,
                      width: 87,
                      decoration: BoxDecoration(
                        color: !appoint ? kPurple : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Summarise",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: !appoint ? Colors.white : kGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 11,
            ),
            appoint
                ? Column(
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: kOrange2.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Text(
                                "1.1",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: kOrange,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Task",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 32,
                            width: 248,
                            child: TextField(
                              controller: _task,
                              cursorColor: kGrey,
                              decoration: kTextField.copyWith(
                                  hintText: "Describe the task"),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconlyBold.user_2,
                            size: 20,
                            color: kOrange,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Personnel",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 32,
                            width: 248,
                            child: TextField(
                              controller: _personnel,
                              cursorColor: kGrey,
                              decoration:
                                  kTextField.copyWith(hintText: "@name"),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconlyBold.calendar,
                            size: 20,
                            color: kOrange,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Deadline",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 32,
                            width: 248,
                            child: TextField(
                              cursorColor: kGrey,
                              decoration: kTextField.copyWith(
                                hintText: "DD/MM/YY",
                                suffixIcon: Icon(
                                  IconlyLight.calendar,
                                  color: kWhite,
                                  size: 24,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          color: kPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Appoint",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconlyBold.editSquare,
                            size: 20,
                            color: kPurple2,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Agenda Summary",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 156,
                            width: 248,
                            child: TextField(
                              controller: _summary,
                              maxLines: null,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              expands: true,
                              cursorColor: kGrey,
                              keyboardType: TextInputType.multiline,
                              decoration: kTextField.copyWith(
                                  hintText: "Summarise the Agenda"),
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: kGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          color: kPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Moving on",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
