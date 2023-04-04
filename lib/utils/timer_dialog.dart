// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:meep/pages/meet_wait_page.dart';
import 'package:meep/utils/constants.dart';

class TimerDialog extends StatelessWidget {
  final String meetId;
  // final String preId;
  // final String meetName;
  const TimerDialog({super.key, required this.meetId,});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 386.0 / 800 * MediaQuery.of(context).size.height,
        width: 318 / 360 * MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Your Meeting Timer",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              height: 57 / 800 * MediaQuery.of(context).size.height,
              width: 142 / 360 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "00:00",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Text(
              "Your meeting should end by 18:00",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 122,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2, color: kWhite),
                  ),
                  child: Center(
                    child: Text(
                      "30:00",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(154, 154, 154, 1),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 87,
                  decoration: BoxDecoration(
                    color: kPurple2,
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(width: 2, color: kWhite),
                  ),
                  child: Center(
                    child: Text(
                      "+30 mins",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 26,
              ),
              child: Row(
                children: [
                  Container(
                    height: 20 / 800 * MediaQuery.of(context).size.height,
                    width: 49 / 360 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "00:00",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Text(
                    "Your meeting is doing great!",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 26,
              ),
              child: Row(
                children: [
                  Container(
                    height: 20 / 800 * MediaQuery.of(context).size.height,
                    width: 49 / 360 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 122, 0, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "00:00",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Text(
                    "Let's start wrapping up!",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 26,
              ),
              child: Row(
                children: [
                  Container(
                    height: 20 / 800 * MediaQuery.of(context).size.height,
                    width: 49 / 360 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(203, 0, 0, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "00:00",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Text(
                    "No one is paying attention anymore!",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 19,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MeetWaitPage(
                      meetId: meetId,
                      // meetName: '',
                      // preId: '',
                    ),
                  ),
                );
                // Navigator.pushNamed(context, MeetWaitPage.id);
              },
              child: Container(
                height: 30,
                width: 157,
                decoration: BoxDecoration(
                  color: kPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
