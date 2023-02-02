import 'package:flutter/material.dart';
import 'package:meep/utils/constants.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318/360*MediaQuery.of(context).size.width,
      height: 210/800*MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          kShadow,
        ],
        color: Colors.white,
        
      ),
    );
  }
}