  // ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations

  import 'package:flutter/material.dart';
  import 'package:flutter/scheduler.dart';
  import 'package:iconly/iconly.dart';
  import 'package:meep/utils/constants.dart';

  class TaskTile extends StatefulWidget {
    final String title;
    final String taskTitle;
    final String personal;
    final String deadline;
    final bool complete;
    final int agendaNum;
    final int taskNum;

    const TaskTile({
      super.key,
      required this.title,
      required this.taskTitle,
      required this.personal,
      required this.deadline,
      required this.complete,
      required this.agendaNum,
      required this.taskNum,
    });

    @override
    State<TaskTile> createState() => _TaskTileState();
  }

  class _TaskTileState extends State<TaskTile> {
    bool markDoneVisible = false;
    bool complete = false;

    @override
    void initState() {
      complete = widget.complete;
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
                  markDoneVisible = !markDoneVisible;
                }));
          },
          child: AnimatedContainer(
            width: 318 / 360 * MediaQuery.of(context).size.width,
            height: (markDoneVisible ? 253 : 210) /
                800 *
                MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                kShadow,
              ],
              color: Colors.white,
            ),
            duration: Duration(
              milliseconds: 300,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 17 / 800 * MediaQuery.of(context).size.height,
                horizontal: 16 / 360 * MediaQuery.of(context).size.width,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: kOrange2.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            "${widget.agendaNum}.${widget.taskNum}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: kOrange,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12 / 360 * MediaQuery.of(context).size.width,
                      ),
                      Flexible(
                        child: Text(
                          "\"${widget.taskTitle}\"",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kGrey,
                          ),
                          maxLines: 2,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 14 / 800 * MediaQuery.of(context).size.height,
                  // ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: kPurple2.withOpacity(0.56),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Center(
                          child: Text(
                            "${widget.agendaNum}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: kPurple,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12 / 360 * MediaQuery.of(context).size.width,
                      ),
                      Flexible(
                        child: Text(
                          "\"${widget.title}\"",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kGrey,
                          ),
                          maxLines: 2,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 7 / 800 * MediaQuery.of(context).size.height,
                  // ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        IconlyBold.user_2,
                        size: 20,
                        color: kOrange,
                      ),
                      SizedBox(
                        width: 12 / 360 * MediaQuery.of(context).size.width,
                      ),
                      Flexible(
                        child: Text(
                          "${widget.personal}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: kGrey,
                          ),
                          maxLines: 2,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10 / 800 * MediaQuery.of(context).size.height,
                  // ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        IconlyBold.calendar,
                        size: 20,
                        color: kOrange,
                      ),
                      SizedBox(
                        width: 12 / 360 * MediaQuery.of(context).size.width,
                      ),
                      Flexible(
                        child: Text(
                          "${widget.deadline}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: !complete
                                ? Color.fromRGBO(255, 0, 0, 1)
                                : Color.fromRGBO(26, 132, 0, 1),
                          ),
                          maxLines: 2,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          // textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        IconlyBold.arrow_right_2,
                        size: 20,
                        color: Color.fromRGBO(25, 0, 135, 1),
                      ),
                      SizedBox(
                        width: 12 / 360 * MediaQuery.of(context).size.width,
                      ),
                      Container(
                        height: 20 / 800 * MediaQuery.of(context).size.height,
                        width: 91 / 360 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: !complete
                              ? Color.fromRGBO(255, 0, 0, 0.5)
                              : Color.fromRGBO(116, 254, 68, 0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            complete ? "Complete" : "Incomplete",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: !complete
                                  ? Color.fromRGBO(203, 0, 0, 1)
                                  : Color.fromRGBO(26, 132, 0, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (markDoneVisible)
                    Material(
                      child: InkWell(
                        onTap: () {
                          // setState(() {
                          //   complete = !complete;
                          // });
                          SchedulerBinding.instance
                                                            .addPostFrameCallback(
                                                                (_) =>
                                                                    setState(() {
                                                                      complete =
                                                                          !complete;
                                                                    }));
                        },
                        child: Container(
                          height: 28 / 800 * MediaQuery.of(context).size.height,
                          width: 125 / 360 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPurple,
                          ),
                          child: Center(
                            child: Text(
                              !complete ? "Mark as done" : "Mark as undone",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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
