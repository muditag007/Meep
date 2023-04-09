import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meep/utils/constants.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/invitee.dart';
import 'package:meep/utils/login_controller.dart';

class Attendance extends StatefulWidget {
  // final List<Widget> attendees;
  // final List<Widget> hands;
  final String meetId;
  const Attendance({
    super.key,
    required this.meetId,
    // required this.attendees,
    // required this.hands,
  });

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  LoginController controller = Get.put(LoginController());
  List<Widget> attendees = [];
  List<Widget> hands = [];

  Future<void> _handleAttendees() async {
    try {
      Map<String, Map> json1 = {
        'token': {
          'displayName': controller.googleAccount.value?.displayName,
          'photoUrl': controller.googleAccount.value?.photoUrl,
          'id': controller.googleAccount.value?.id,
          'email': controller.googleAccount.value?.email,
          'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
        }
      };

      final attendeesRes = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/attendees/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      // final handsRes = await http.post(
      //   Uri.parse(
      //       'https://meep-nine.vercel.app/live/details/raisedhands/${widget.meetId}'),
      //   body: json.encode(json1),
      //   headers: {"Content-Type": "application/json"},
      // );

      // print(attendeesRes.body);
      // print("done");
      // print(handsRes.body);

      Map attendeesResMap = json.decode(attendeesRes.body);
      // print(attendeesResMap);
      // print(attendeesResMap['attendees']);

      attendees = [];
      for (int i = 0; i < attendeesResMap['attendees'].length; i++) {
        attendees.add(
          Invitee(
              name: attendeesResMap['attendees'][i]['name'],
              image: attendeesResMap['attendees'][i]['image']),
        );
      }

      // liveCount = Attendance(attendees: attendeesWidget, hands: []);
      if (attendeesRes.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${attendeesRes.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

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
            child: FutureBuilder(
              future: _handleAttendees(),
              builder: (context, snapshot) {
                return Column(
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
                );
              },
            )),
      ),
    );
  }
}
