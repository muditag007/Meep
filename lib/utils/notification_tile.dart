// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:meep/utils/constants.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97 / 800 * MediaQuery.of(context).size.height,
      width: 318 / 360 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          kShadow,
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16 / 800 * MediaQuery.of(context).size.height,
          bottom: 14 / 800 * MediaQuery.of(context).size.height,
          left: 18 / 360 * MediaQuery.of(context).size.width,
          right: 18 / 360 * MediaQuery.of(context).size.width,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "MoM is ready to view!!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: kGrey,
                  ),
                ),
                SizedBox(
                  width: 12 / 800 * MediaQuery.of(context).size.width,
                ),
                Container(
                  width: 8 / 360 * MediaQuery.of(context).size.width,
                  height: 8 / 800 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kOrange,
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 8 / 800 * MediaQuery.of(context).size.height,
            // ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Logo Colors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kGrey,
                ),
              ),
            ),
            // Expanded(
            //   child: Container(),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "17:00",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
                  ),
                ),
                Text(
                  "Yesterday",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kGrey,
                  ),
                ),
                Text(
                  "Team 1",
                  style: TextStyle(
                    fontSize: 14,
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
