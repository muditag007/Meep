// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:meep/pages/meeting_details.dart';
import 'package:meep/utils/constants.dart';

class UpcomingMeetTile extends StatelessWidget {
  final String title;
  final String host;
  final String time;
  final String team_name;
  final String venue;
  final String id;
  const UpcomingMeetTile({
    super.key,
    required this.title,
    required this.host,
    required this.time,
    required this.team_name,
    required this.venue,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeetingDetails(
                    id: id,
                  ),
                ),
              );
            },
            child: Container(
              width: 317 / 360 * MediaQuery.of(context).size.width,
              height: 113 / 800 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(107, 0, 215, 1),
                boxShadow: [
                  kShadow,
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20 / 800 * MediaQuery.of(context).size.height,
                  horizontal: 20 / 360 * MediaQuery.of(context).size.width,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              host,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 21,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          venue.length > 15
                              ? "${venue.substring(0, 15)}..."
                              : venue,
                          style: TextStyle(
                            fontSize: 14,
                            // overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          team_name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   height: 11 / 800 * MediaQuery.of(context).size.height,
        //   width: 295 / 360 * MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(15),
        //       bottomRight: Radius.circular(15),
        //     ),
        //     color: Colors.white,
        //     boxShadow: [
        //       kShadow,
        //     ],
        //   ),
        // ),
        // Container(
        //   height: 11 / 800 * MediaQuery.of(context).size.height,
        //   width: 269 / 360 * MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(15),
        //       bottomRight: Radius.circular(15),
        //     ),
        //     color: Colors.white,
        //     boxShadow: [
        //       kShadow,
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
