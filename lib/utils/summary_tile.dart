// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class SummaryTile extends StatelessWidget {
  const SummaryTile({
    super.key,
    required this.summaryShort,
  });
  final bool summaryShort;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 130 / 800 * MediaQuery.of(context).size.height,
      width: 318,
      //  / 360 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 12.5,
            spreadRadius: 2,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
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
                    "\"Sponsorships for Upcoming Events\"",
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
            if (!summaryShort)
              Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        IconlyBold.editSquare,
                        color: kPurple2,
                        size: 20,
                      ),
                      SizedBox(
                        width: 12 / 360 * MediaQuery.of(context).size.width,
                      ),
                      Flexible(
                        child: Text(
                          "\"Lorem ipsum dolor sit amet consectetur. Purus arcu enim viverra eget egestas faucibus viverra. Purus sit massa id odio odio sollicitudin at. Interdum suspendisse est felis ultrices at cursus ullamcorper. Semper turpis posuere vivamus quis non quam urna ut in.\"",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: kGrey,
                          ),
                          maxLines: 40,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
