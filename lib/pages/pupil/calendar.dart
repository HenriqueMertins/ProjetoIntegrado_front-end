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

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      appBar: AppBar(
        title: const Text("Training Calendar"),
        backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TableCalendar(
                  locale: "en_US",
                  rowHeight: 43,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  onDaySelected: _onDaySelected,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Pular Corda",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        alignment: Alignment.center,
                        child: const Text(
                          "5 min",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Simulador Escada",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        alignment: Alignment.center,
                        child: const Text(
                          "5 min",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Supino reto com halteres",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        alignment: Alignment.center,
                        child: const Text(
                          "12x de 35kg  4 series",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Supino inclinado com halteres",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        alignment: Alignment.center,
                        child: const Text(
                          "12x de 27kg  4 series",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Flexão",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        alignment: Alignment.center,
                        child: const Text(
                          "12 rep",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Triceps Polia Alta",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        alignment: Alignment.center,
                        child: const Text(
                          "10x de 30kg  4 series",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Triceps Francês Unilateral",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        alignment: Alignment.center,
                        child: const Text(
                          "10x de 22kg  4 series",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
