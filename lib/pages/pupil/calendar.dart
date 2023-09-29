import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


// ignore: camel_case_types
class calendarPage extends StatefulWidget {
  const calendarPage({super.key});

  @override
  State<calendarPage> createState() => _calendarPageState();
}

// ignore: camel_case_types
class _calendarPageState extends State<calendarPage> {

  DateTime today = DateTime.now(); 

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 188, 188),
      // appBar: AppBar(title: Text("Training Calendar")),
      // body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        const Text("123"),
        Container(
          child: TableCalendar(focusedDay: today, firstDay: DateTime.utc(2010, 10, 16), lastDay: DateTime.utc(2030, 3, 14)),
        ),
      ],
    );
  }

}