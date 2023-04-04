import 'package:flutter/material.dart';
import 'package:meep/utils/constants.dart';

class Attendance extends StatelessWidget {
  final List<Widget> attendees;
  final List<Widget> hands;
  const Attendance({super.key, required this.attendees, required this.hands});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 472,
        width: 318,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 20,
          ),
          child: Column(
            children: [
              if (hands.isNotEmpty)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Hands Raised",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      thickness: 2,
                      color: kGrey,
                    ),
                    ...hands,
                  ],
                ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Attendees",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 2,
                color: kGrey,
              ),
              ...attendees,
            ],
          ),
        ),
      ),
    );
  }
}
