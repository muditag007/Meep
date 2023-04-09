// ignore_for_file: prefer_const_constructors, unused_element, unused_import, depend_on_referenced_packages, avoid_print, use_build_context_synchronously, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meep/pages/home_page.dart';
import 'package:meep/utils/constants.dart';
import 'dart:async';
import 'dart:convert' show json;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:meep/utils/login_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static String id = "signinpage";
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool signup = false;
  String webpage = '';
  bool progress = false;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
  //   serverClientId:
  //       '499911003588-q4blg14pu20q4rqu4kvm4ae38nrjfkeh.apps.googleusercontent.com',
  // );
  Future<void> _handleSignIn() async {
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
      // print(controller.googleAccount.value);

      // print(json1);
      // print(json.encode(json1));

      final response = await http.post(
        Uri.parse('https://meep-nine.vercel.app/signup'),
        body: json.encode(json1),
        headers: {"Content-Type": "application/json"},
      );

      // Handle the server's response
      if (response.statusCode == 200) {
        // Success
        print('Authentication successful ${response.body}');
      } else {
        // Error
        print(
            'Authentication error: ${response.reasonPhrase} ${response.statusCode} ${response.headers}');
      }
    } catch (error) {
      // Handle sign-in errors
      print('Sign-in error: $error');
    }
  }

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: progress
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    color: Colors.white,
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 266 / 800 * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Welcome to Meep!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: kGrey,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Meetings ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: kGrey,
                                ),
                              ),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: kPurple,
                                ),
                              ),
                              Text(
                                " Easy ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: kGrey,
                                ),
                              ),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: kPurple,
                                ),
                              ),
                              Text(
                                " Effective ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: kGrey,
                                ),
                              ),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: kPurple,
                                ),
                              ),
                              Text(
                                " Productive",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: kGrey,
                                ),
                              ),
                            ],
                          ),
                          !signup
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 20 /
                                          800 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          await controller.login();
                                          setState(() {
                                            progress = true;
                                          });
                                          await _handleSignIn();
                                          if (controller.googleAccount.value !=
                                              null) {
                                            print(controller.googleAccount.value
                                                ?.displayName);
                                            Navigator.pushNamed(
                                                context, HomePage.id);
                                          }
                                        },
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Container(
                                          height: 47 /
                                              800 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 318 /
                                              360 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: kPurple,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                "Sign In with Google",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 18 /
                                                    360 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                              ),
                                              Image.asset(
                                                'images/google.png',
                                                height: 25,
                                                width: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 22 /
                                          800 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Text(
                                      "Don’t have an account? Sign up!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: kPurple,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            signup = true;
                                          });
                                        },
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Container(
                                          width: 318 /
                                              360 *
                                              MediaQuery.of(context).size.width,
                                          height: 47 /
                                              800 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              width: 2,
                                              color: kPurple,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: kPurple,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 33 /
                                          800 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          await controller.login();
                                          setState(() {
                                            progress = true;
                                          });
                                          await _handleSignIn();
                                          if (controller.googleAccount.value !=
                                              null) {
                                            print(controller.googleAccount.value
                                                ?.displayName);
                                            Navigator.pushNamed(
                                                context, HomePage.id);
                                          }
                                        },
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Container(
                                          height: 47 /
                                              800 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 318 /
                                              360 *
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: kPurple,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                "Sign Up with Google",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 18 /
                                                    360 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                              ),
                                              Image.asset(
                                                'images/google.png',
                                                height: 25,
                                                width: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18 /
                                          800 *
                                          MediaQuery.of(context).size.height,
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            signup = false;
                                          });
                                        },
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Text(
                                          "Go Back",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: kPurple,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
