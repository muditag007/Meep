// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meep/utils/constants.dart';

class AgendaTile extends StatelessWidget {
  const AgendaTile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318 / 360 * MediaQuery.of(context).size.width,
      // height: 59 / 800 * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          kShadow,
        ],
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Container(
            // constraints: BoxConstraints.expand(),
            width: 52 / 360 * MediaQuery.of(context).size.width,
            height: title.length <= 36
                ? 59 / 800 * MediaQuery.of(context).size.height
                : double.infinity,
            // height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              color: Color.fromRGBO(162, 48, 237, 0.56),
            ),
            child: Center(
              child: Icon(
                IconlyBold.edit,
                size: 25,
                color: Color.fromRGBO(19, 15, 38, 1),
              ),
            ),
          ),
          Container(
            width: 266 / 360 * MediaQuery.of(context).size.width,
            // height: 59 / 800 * MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 22.5,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 16 / 360 * MediaQuery.of(context).size.width,
                  ),
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        // overflow: TextOverflow.visible,
                        fontSize: 16,
                        // fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
