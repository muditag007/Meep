// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class MeetTile extends StatelessWidget {
  const MeetTile(
      {super.key,
      required this.name,
      required this.date,
      required this.time,
      required this.team});
  final String name;
  final String date;
  final String time;
  final String team;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 18,
      ),
      child: Container(
        height: 58 / 800 * MediaQuery.of(context).size.height,
        width: 318 / 360 * MediaQuery.of(context).size.width,
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
            horizontal: 18.0/360*MediaQuery.of(context).size.width,
            vertical: 11/800*MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(69, 68, 68, 1),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(69, 68, 68, 1),
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(69, 68, 68, 1),
                    ),
                  ),
                  Text(
                    team,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(69, 68, 68, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
