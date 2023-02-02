// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class UpcomingTile extends StatelessWidget {
  const UpcomingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 133 / 800 * MediaQuery.of(context).size.height,
      width: 319 / 360 * MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            left: 24/360*MediaQuery.of(context).size.width,
            top: 39/800*MediaQuery.of(context).size.height,
            child: Container(
              width: 269 / 360 * MediaQuery.of(context).size.width,
              height: 95 / 800 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    spreadRadius: 4,
                    offset: Offset(0, 8),
                    color: Color.fromRGBO(69, 68, 68, 0.3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 11/360*MediaQuery.of(context).size.width,
            top: 19/800*MediaQuery.of(context).size.height,
            child: Container(
              width: 295 / 360 * MediaQuery.of(context).size.width,
              height: 105 / 800 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    spreadRadius: 4,
                    offset: Offset(0, 8),
                    color: Color.fromRGBO(69, 68, 68, 0.3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 317 / 360 * MediaQuery.of(context).size.width,
              height: 113 / 800 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(107, 0, 215,1),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    spreadRadius: 4,
                    offset: Offset(0, 8),
                    color: Color.fromRGBO(69, 68, 68, 0.3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
