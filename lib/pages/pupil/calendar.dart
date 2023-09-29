import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:trainingcallendar/main.dart';

// void main(){
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//   ));
// }


// ignore: camel_case_types
class calendarPage extends StatefulWidget {
  const calendarPage({super.key});

  @override
  State<calendarPage> createState() => _calendarPageState();
}

// ignore: camel_case_types
class _calendarPageState extends State<calendarPage> {
  DateTime today = DateTime.now(); 
  void _onDaySelected(DateTime day, DateTime focusedDay ) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      appBar: AppBar(title: const Text("Training Calendar"),
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),),
      // drawer: const Drawer(),  //isso aqui abre o menu na direita
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TableCalendar(
            locale: "en_US",
              rowHeight: 43, // tamanho do calendario
              headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true), 
              availableGestures: AvailableGestures.all,// tira o 2weeks
              selectedDayPredicate: (day)=> isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16), 
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
          ),
        ],
      ),
    );
  }
  
}