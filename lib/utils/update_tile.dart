// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class UpdateTile extends StatelessWidget {
  const UpdateTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135 / 800 * MediaQuery.of(context).size.height,
      width: 318 / 360 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          kShadow,
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18 / 360 * MediaQuery.of(context).size.width,
          vertical: 20 / 800 * MediaQuery.of(context).size.height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Timeline Discussion",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kGrey,
                  ),
                ),
                Icon(
                  IconlyBold.tick_square,
                  size: 12.5,
                  color: Color.fromRGBO(116, 254, 68, 1),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "20:00",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
                  ),
                ),
                Text(
                  "Team 2",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\"Complete Official Documentation\"",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
                  ),
                ),
                Icon(
                  IconlyBold.user_2,
                  size: 20,
                  color: kOrange,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "@Tanmay, @Kshitij ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: kGrey,
                  ),
                ),
                Text(
                  "completed the task.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
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
