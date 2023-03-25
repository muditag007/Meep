// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class Invitee extends StatelessWidget {
  final String name;
  final String image;

  const Invitee({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 38.0,
            height: 38.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image)),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.redAccent,
            ),
          ),
          SizedBox(
            width: 16 / 360 * MediaQuery.of(context).size.width,
          ),
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
