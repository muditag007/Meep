// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/login_controller.dart';

class ShortAgendaAttendee extends StatefulWidget {
  final String agenda;
  final String desc;
  final String agenda_num;
  final String meetId;
  const ShortAgendaAttendee(
      {super.key,
      required this.agenda,
      required this.desc,
      required this.agenda_num,
      required this.meetId});

  @override
  State<ShortAgendaAttendee> createState() => _ShortAgendaAttendeeState();
}

class _ShortAgendaAttendeeState extends State<ShortAgendaAttendee> {
  LoginController controller = Get.put(LoginController());
  bool cond = true;

  Future<void> _handleWaiting() async {
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
            'https://meep-nine.vercel.app/live/remove/movingon/${widget.meetId}'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      print("teri ammi ki ding ding");
      print(json.decode(response.body));

      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: kPurple,
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
                      widget.agenda_num,
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
                    "\"${widget.agenda}\"",
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
                    "\"${widget.desc}\"",
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
            if (cond)
              Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Are you on the same page?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: kGrey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      await _handleWaiting();
                    },
                    child: Container(
                      height: 30,
                      width: 143,
                      decoration: BoxDecoration(
                        // color: kPurple,
                        border: Border.all(
                          width: 1,
                          color: kPurple,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 143,
                decoration: BoxDecoration(
                  color: kPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Raise Hand 🤚",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
