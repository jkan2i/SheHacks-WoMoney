import 'package:flutter/material.dart';
import 'package:money_app/ColorScheme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import "package:flutter/cupertino.dart";

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }

  Container taskList(String title, String description, IconData iconImg,
      Color iconColor, bool isDone) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Icon(
            iconImg,
            color: isDone ? iconColor : Color(0xffaeafad),
            size: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Text(description,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: darkBlue,
                    todayColor: Color(0xff30374b)),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                        color: Color(0xff30384c),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    weekendStyle: TextStyle(
                        color: Color(0xff30384c),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    dowTextBuilder: (date, locale) {
                      return DateFormat.E(locale).format(date).substring(0, 1);
                    }),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Color(0xff30384c),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Color(0xff30384c),
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Color(0xff30384c),
                    )),
                calendarController: _controller,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular((50)),
                        topRight: Radius.circular(50)),
                    color: lightBlue),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "Today",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        taskList(
                            "Task 1",
                            "Plant a seed in your home or neighbourhood",
                            CupertinoIcons.check_mark_circled_solid,
                            Color(0xff008037),
                            true),
                        taskList(
                            "Task 2",
                            "Suggest a reusable bag to 3 people",
                            CupertinoIcons.check_mark_circled_solid,
                            Color(0xff008037),
                            false),
                        taskList(
                            "Task 3",
                            "Learn about pesticides and garden chemicals",
                            CupertinoIcons.check_mark_circled_solid,
                            Color(0xff008037),
                            false),
                        taskList(
                            "Task 4",
                            "Take only a 10-minute hot shower",
                            CupertinoIcons.check_mark_circled_solid,
                            Color(0xff008037),
                            false)
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                              Color(0xffe6fadb).withOpacity(0),
                              Color(0xffe6fadb)
                            ],
                                stops: [
                              0.0,
                              1.0
                            ])),
                      ),
                    ),
                    Positioned(
                      bottom: 270,
                      right: 40,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff008037),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff8de65d), blurRadius: 10)
                            ]),
                        child: Text(
                          "10 cents",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
