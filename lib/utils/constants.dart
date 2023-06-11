// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Color kGrey = Color.fromRGBO(69, 68, 68, 1);
Color kPurple = Color.fromRGBO(107, 0, 215, 1);
Color kOrange = Color.fromRGBO(255, 122, 0, 1);
Color kOrange2 = Color.fromRGBO(255, 151, 76, 1);
Color kPurple2 = Color.fromRGBO(162, 48, 237, 1);
Color kGreen = Color.fromRGBO(116, 254, 68, 1);
Color kWhite = Color.fromRGBO(222, 222, 222, 1);

BoxShadow kShadow = BoxShadow(
  blurRadius: 25,
  spreadRadius: 4,
  offset: Offset(0, 8),
  color: Color.fromRGBO(69, 68, 68, 0.32),
);

InputDecoration kTextField = InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  hintText: 'Agenda',
  hintStyle: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: kWhite,
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kWhite, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kWhite, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

// double kWidth = MediaQuery.of(context).size.width;




