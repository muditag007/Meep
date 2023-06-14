// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, unused_local_variable, unused_element, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/pages/meet_wait_page.dart';
import 'package:meep/utils/attendance.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/login_controller.dart';
import 'package:meep/utils/timer_dialog.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class WaitingPage extends StatefulWidget {
  final String meetId;
  final bool linked;
  const WaitingPage({super.key, required this.meetId, required this.linked});
  static String id = 'waitingpage';

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  LoginController controller = Get.put(LoginController());
  String meetName = '';
  // bool linked;

  Future<void> _handleMeetingName() async {
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

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/meetings/details/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      // if (json.decode(response.body)['previous_meeting'] != null) {
      //   linked = true;
      // }
      print(json.decode(response.body));
      meetName = (json.decode(response.body))['title'];

      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  // @override
  // void initState() {
  //   _handleMeetingName();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Widget timer = TimerDialog(
      meetId: widget.meetId,
      linked: widget.linked,
    );
    // Widget attendee = Attendance(
    //   attendees: [],
    //   hands: [],
    // );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyLight.arrow_left_2,
                    size: 30,
                    color: kGrey,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                FutureBuilder(
                  future: _handleMeetingName(),
                  builder: (context, snapshot) {
                    return Text(
                      meetName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kGrey,
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => timer,
                        );
                      },
                      child: Container(
                        height: 29 / 800 * MediaQuery.of(context).size.height,
                        width: 72 / 360 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: kGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "00:00",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    IconButton(
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (_) => attendee,
                        // );
                      },
                      icon: Icon(
                        IconlyBold.user_2,
                        size: 24,
                        color: kGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/waiting.png"),
                    SizedBox(
                      height: 33,
                    ),
                    Text(
                      "Let's wait for people to join.",
                      style: TextStyle(
                        fontSize: 20,
                        color: kGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 10,
                      width: 152,
                      decoration: BoxDecoration(
                        color: kPurple2.withOpacity(0.56),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 10,
                          width: 92,
                          decoration: BoxDecoration(
                            color: kPurple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
