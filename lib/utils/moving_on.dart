// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meep/utils/constants.dart';
import 'package:meep/utils/invitee.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:meep/utils/login_controller.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../pages/agenda_page.dart';

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
  late Socket socket;

  void connectToServer() {
    try {
      socket = io('https://meep-websocket.onrender.com/', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      print("here");
      socket.on('connect', (_) => print('connect: ${socket.id}'));
      socket.emit('turned on', 'hello');
      socket.onConnectError((data) => print(data));
      socket.on('disconnect', (_) => print('disconnect'));
      socket.on('fromServer', (_) => print(_));
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<http.Response> getMovingOn() async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) {
      // Map<String, Map> json1 = {
      //   'token': {
      //     'displayName': controller.googleAccount.value?.displayName,
      //     'photoUrl': controller.googleAccount.value?.photoUrl,
      //     'id': controller.googleAccount.value?.id,
      //     'email': controller.googleAccount.value?.email,
      //     'serverAuthCode': controller.googleAccount.value?.serverAuthCode,
      //   }
      // };
      return http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/details/movingon/${widget.meetId}'),
        // body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );
    }).asyncMap((event) async => await event);
  }

  Future<void> _handleMovingOn() async {
    try {
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
      if (resp.length == 0) {
        socket.emit('Refresh', widget.meetId);
        socket.on(
            'Refresh',
            (mId) => {
                  if (mId == widget.meetId)
                    {
                      print("refresh"),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AgendaPage(meetId: widget.meetId)),
                      ),
                    }
                });
      }
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
      final response = await http.post(
        Uri.parse(
            'https://meep-nine.vercel.app/live/reset/movingon/${widget.meetId}'),
        headers: {"Content-Type": "application/json"},
      );

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
  void initState() {
    connectToServer();
    super.initState();
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
                    socket.on(
                        'Refresh',
                        (mId) => {
                              if (mId == widget.meetId)
                                {
                                  print("refresh"),
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MovingOn(meetId: widget.meetId)),
                                    (Route<dynamic> route) => false,
                                  ),
                                }
                            });
                    return Column(
                      children: personnels,
                    );
                  },
                ),
                // child: StreamBuilder(
                //   stream: getMovingOn(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       resp = json.decode(snapshot.data!.body)['moving_on'];
                //       personnels = [];
                //       for (int i = 0; i < resp.length; i++) {
                //         personnels.add(
                //           Invitee(
                //             name: resp[i]['name'],
                //             image: resp[i]['image'],
                //           ),
                //         );
                //         personnels.add(
                //           SizedBox(
                //             height: 16,
                //           ),
                //         );
                //       }
                //       return Column(
                //         children: [...personnels],
                //       );
                //     } else {
                //       return Center(
                //         child: Container(
                //           height: 50,
                //           width: 50,
                //           child: CircularProgressIndicator(),
                //         ),
                //       );
                //     }
                //   },
                // ),
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
                  socket.emit('Refresh', widget.meetId);
                  // socket.on(
                  //     'refresh',
                  //     (mId) => {
                  //           if (mId == widget.meetId)
                  //             {
                  //               print("refresh"),
                  //               Navigator.pushAndRemoveUntil(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) =>
                  //                         AgendaPage(meetId: widget.meetId)),
                  //                 (Route<dynamic> route) => false,
                  //               ),
                  //             }
                  //         });
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
