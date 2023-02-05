// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CountTile extends StatelessWidget {
  const CountTile(
      {super.key,
      required this.name,
      required this.count,
      required this.onpressed,
      this.border = false,
      this.selected = false});
  final String name;
  final String count;
  final VoidCallback onpressed;
  final bool border;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onpressed,
        child: Container(
          height: 129 / 800 * MediaQuery.of(context).size.height,
          width: 92 / 360 * MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: !border
                  ? Color.fromRGBO(162, 48, 237, 0.5)
                  : Color.fromRGBO(
                      162,
                      48,
                      237,
                      0.56,
                    ),
              width: (border && selected) ? 4 : 1,
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.4),
                  Color.fromRGBO(255, 255, 255, 0.1),
                ]),
            // color: Color.fromRGBO(255, 255, 255, 0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: (selected && border) ? 13 : 16,
            ),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
