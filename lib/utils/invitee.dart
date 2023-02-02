// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meep/utils/constants.dart';

class Invitee extends StatelessWidget {
  final String name;

  const Invitee({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 38 / 360 * MediaQuery.of(context).size.width,
            width: 38 / 360 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 16/360*MediaQuery.of(context).size.width,),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
