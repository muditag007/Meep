// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class AgendaForm extends StatefulWidget {
  const AgendaForm({super.key});

  @override
  State<AgendaForm> createState() => _AgendaFormState();
}

class _AgendaFormState extends State<AgendaForm> {
  bool appoint = true;
  TextEditingController _control = new TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    "\"Updation of all names in the spreadsheet\"",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kGrey,
                    ),
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    // textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    "\"There is an urgent need to come up with sponsors to be able to organise events.\"",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kGrey,
                    ),
                    maxLines: 4,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    // textDirection: TextDirection.ltr,
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
                        _control.text = '';
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
                        _control.text = '';
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
                              controller: _control,
                              cursorColor: kGrey,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: 'Describe the task',
                                hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: kWhite,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
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
                              cursorColor: kGrey,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: '@name',
                                hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: kWhite,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
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
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                hintText: 'DD/MM/YY',
                                hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: kWhite,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
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
                              controller: _control,
                              maxLines: null,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.top,
                              expands: true,
                              cursorColor: kGrey,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                // floatingLabelBehavior:
                                // FloatingLabelBehavior.never,
                                // hintTextDirection: TextDirection.rtl,
                                // filled: true,
                                // labelStyle: TextStyle(color: Colors.black),
                                hintText: 'Summarise the Agenda',
                                hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: kWhite,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kWhite, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
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
