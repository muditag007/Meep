// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class CountTile extends StatelessWidget {
  const CountTile({super.key, required this.name, required this.count});
  final String name;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129 / 800 * MediaQuery.of(context).size.height,
      width: 92 / 360 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(162, 48, 237, 0.5),
        ),
        gradient:
            LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
              Color.fromRGBO(255, 255, 255, 0.4),
              Color.fromRGBO(255, 255, 255, 0.1),
            ]),
        // color: Color.fromRGBO(255, 255, 255, 0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Expanded(child: Container()),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
