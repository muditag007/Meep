// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/invitee.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/login_controller.dart';

// class MovingOn extends StatefulWidget {
//   final String meetId;
//   const MovingOn({super.key, required this.meetId});

//   @override
//   State<MovingOn> createState() => _MovingOnState();
// }

class MovingOn extends StatefulWidget {
  final String meetId;
  MovingOn({
    super.key,
    required this.meetId,
  });

  @override
  State<MovingOn> createState() => _MovingOnState();
}

class _MovingOnState extends State<MovingOn> {
  LoginController controller = Get.put(LoginController());

  List<Widget> personnels = [];

  List resp = [];

  Future<void> _handleMovingOn() async {
    try {
      // Map<String, Map> json1 = {
      //   'task': {
      //     "summary": ,
      //   }
      // };

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/movingon/${widget.meetId}'),
        // body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      print("meinviefbjvbvs");
      print(json.decode(response.body));
      // meetName = json.decode(response.body)['title'];
      // preId = json.decode(response.body)['previous_meeting'];
      // _handleTasks();
      resp = json.decode(response.body)['moving_on'];
      personnels = [];
      for (int i = 0; i < resp.length; i++) {
        personnels.add(
          Invitee(
            name: resp[i]['name'],
            image: resp[i]['image'],
          ),
        );
        personnels.add(
          SizedBox(
            height: 16,
          ),
        );
      }

      if (response.statusCode == 200) {
        print('Authentication successful');
      } else {
        print('Authentication error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Sign-in error: $error');
    }
  }

  Future<void> _handleReset() async {
    try {
      // Map<String, Map> json1 = {
      //   'task': {
      //     "summary": _summary.text,
      //   }
      // };

      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/reset/movingon/${widget.meetId}'),
        // body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      print(json.decode(response.body));
      // meetName = json.decode(response.body)['title'];
      // preId = json.decode(response.body)['previous_meeting'];
      // _handleTasks();
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
  //   _handleMovingOn();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 472,
        width: 318,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Waiting On...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Invitee(name: name, image: image)
              SingleChildScrollView(
                child: FutureBuilder(
                  future: _handleMovingOn(),
                  builder: (context, snapshot) {
                    return Column(
                      children: personnels,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(),
              ),
              InkWell(
                onTap: () async {
                  await _handleReset();
                  Navigator.pop(context);
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
                      "Move on anyway",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
