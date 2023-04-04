// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class MeetDetailsDet extends StatefulWidget {
  final List<Widget> participants;
  final Map<String, dynamic> detailsRes;
  final Widget previous;
  final double width;
  const MeetDetailsDet({
    super.key,
    required this.participants,
    required this.detailsRes,
    required this.previous,
    required this.width,
  });

  @override
  State<MeetDetailsDet> createState() => _MeetDetailsDetState();
}

class _MeetDetailsDetState extends State<MeetDetailsDet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 318 / 360 * widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              BoxShadow(
                blurRadius: 25,
                spreadRadius: 4,
                offset: Offset(0, 8),
                color: Color.fromRGBO(69, 68, 68, 0.32),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22 / 360 * MediaQuery.of(context).size.width,
              vertical: 21 / 800 * MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                // SizedBox(
                //   height:
                //       21 / 800 * MediaQuery.of(context).size.height,
                // ),
                Text(
                  widget.detailsRes['host'] != null
                      ? "${widget.detailsRes['date'].toString().substring(0, 10)},${widget.detailsRes['time']}"
                      : "Waiting...",
                  style: TextStyle(
                    // fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(69, 68, 68, 1),
                  ),
                ),
                SizedBox(
                  height: 3 / 800 * MediaQuery.of(context).size.height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      IconlyBold.location,
                      size: 20,
                      color: Color.fromRGBO(
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
                      widget.detailsRes['venue'] != null
                          ? widget.detailsRes['venue']
                          : "To be decided",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(69, 68, 68, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17 / 800 * MediaQuery.of(context).size.height,
                ),
                widget.previous,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Invitees",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5 / 800 * MediaQuery.of(context).size.height,
                ),
                ...widget.participants,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
