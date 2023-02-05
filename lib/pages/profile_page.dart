// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = "profilepage";
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool host = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 29 / 800 * MediaQuery.of(context).size.height,
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Your Profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 24 / 800 * MediaQuery.of(context).size.height,
            ),
            Container(
              height: 201 / 800 * MediaQuery.of(context).size.height,
              width: 257 / 360 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: kOrange.withOpacity(0.43),
                  width: 1,
                ),
                gradient: LinearGradient(
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.4),
                    Color.fromRGBO(217, 217, 217, 0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              // child: Stack(
              //   children: [
              // Container(
              //   height: 201 / 800 * MediaQuery.of(context).size.height,
              //   width: 257 / 360 * MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     gradient: LinearGradient(
              //       // ignore: prefer_const_literals_to_create_immutables
              //       colors: [
              //         Color.fromRGBO(255, 255, 255, 1),
              //         Color.fromRGBO(255, 122, 0, 0.43),
              //       ],
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //     ),
              //   ),
              // )
              //   ],
              // ),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 24 / 800 * MediaQuery.of(context).size.height,
                  // ),
                  Container(
                    height: 120 / 800 * MediaQuery.of(context).size.height,
                    width: 257 / 360 * MediaQuery.of(context).size.width,
                    // color: Colors.yellow,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          // top: 6 / 800 * MediaQuery.of(context).size.height,
                          left: 78 / 360 * MediaQuery.of(context).size.width,
                          child: Container(
                            height:
                                90 / 800 * MediaQuery.of(context).size.height,
                            width:
                                101 / 360 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5 / 800 * MediaQuery.of(context).size.height,
                          right: 5 / 360 * MediaQuery.of(context).size.width,
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18 / 800 * MediaQuery.of(context).size.height,
                  ),
                  Text(
                    "Yuvraj Aaditya Aarya",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 2 / 800 * MediaQuery.of(context).size.height,
                  ),
                  Text(
                    "Username@email.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 19 / 800 * MediaQuery.of(context).size.height,
            ),
            Container(
              height: 60 / 800 * MediaQuery.of(context).size.height,
              width: 305 / 360 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: host ? kPurple : Colors.white,
                border: Border.all(color: kPurple, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 26,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Become a Host",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: host ? Colors.white : kGrey,
                      ),
                    ),
                    // FlutterSwitch(
                    //   value: host,
                    //   width: 35,
                    //   height: 13,
                    //   toggleSize: 22,
                    //   padding: 0,
                    //   onToggle: (val) {
                    //     setState(() {
                    //       host = val;
                    //     });
                    //   },
                    // ),
                    // CupertinoSwitch(
                    //   value: host,
                    //   onChanged: (val) {
                    //     setState(() {
                    //       host = !host;
                    //     });
                    //   },
                    // ),
                    Switch(
                      // thumbColor: MaterialStateProperty.all<Color>(
                      //   Colors.white,
                      // ),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Color.fromRGBO(217, 217, 217, 1),
                      // trackColor: MaterialStateProperty.all<Color>(
                      //   Color.fromRGBO(217, 217, 217, 1),
                      // ),
                      activeTrackColor: Color.fromRGBO(162, 48, 237, 1),
                      activeColor: Color.fromRGBO(68, 0, 136, 1),
                      value: host,
                      onChanged: (val) {
                        setState(() {
                          host = val;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 19 / 800 * MediaQuery.of(context).size.height,
            ),
            Container(
              height: 393 / 800 * MediaQuery.of(context).size.height -
                  MediaQuery.of(context).viewPadding.top,
              width: 305 / 360 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 29 / 800 * MediaQuery.of(context).size.height,
                  bottom: 22 / 800 * MediaQuery.of(context).size.height,
                  left: 27.5 / 360 * MediaQuery.of(context).size.width,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Teams",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kGrey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15 / 800 * MediaQuery.of(context).size.height,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Meeting Default Settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kGrey,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 45 / 800 * MediaQuery.of(context).size.height,
                        width: 250 / 360 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(203, 203, 203, 1),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                21 / 360 * MediaQuery.of(context).size.width,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "Log Out",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(154, 154, 154, 1),
                                ),
                              ),
                              Icon(
                                IconlyLight.logout,
                                color: Color.fromRGBO(154, 154, 154, 1),
                              )
                            ],
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
