import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainingcallendar/restful/client/TreinoService.dart';

class Treino {
  final int id;
  final String nome;
  final int carga;
  final int serie;
  final int rep;
  final int dia;

  Treino(this.id, this.nome, this.carga, this.serie, this.rep, this.dia);
}

class calendarPage extends StatefulWidget {
  const calendarPage({super.key});

  @override
  State<calendarPage> createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  List<Treino> treinos = [];
  DateTime today = DateTime.now();

  @override
void initState() {
  super.initState();
}

  void _onDaySelected(DateTime day, DateTime focusedDay) {
  print("Selected day: $day");
  print(day.weekday);
  _treinos(day);
  setState(() {
    today = day;
  });
}

  Future<void> _treinos(DateTime selectedDay) async {
  int idLogin = await SessionManager().get("idLogin");
  var data = await TreinoService().listTreino(idLogin, selectedDay.weekday);
  treinos = data.map((treinoData) {
    return Treino(
        treinoData.id,
        treinoData.nome,
        treinoData.carga,
        treinoData.serie,
        treinoData.rep,
        treinoData.dia);
  }).toList();
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      appBar: AppBar(
        title: const Text("Training Calendar"),
        backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      ),
      body: Column(
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
          Expanded(
            child: ListView.builder(
              itemCount: treinos.length,
              itemBuilder: (context, index) {
                final treino = treinos[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        treino.nome,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Carga: ${treino.carga}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Série: ${treino.serie}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Rep: ${treino.rep}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showAddTrainingDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 199, 15, 8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTrainingDialog(BuildContext context) {
    TextEditingController seriesController = TextEditingController();
    TextEditingController pesoController = TextEditingController();
    TextEditingController repeticoesController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Adicionar Treino"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: seriesController,
                decoration:
                const InputDecoration(labelText: 'Número de Séries'),
              ),
              TextField(
                controller: pesoController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
              ),
              TextField(
                controller: repeticoesController,
                decoration: const InputDecoration(labelText: 'Repetições'),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // Cor do texto
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Adicionar Treino"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // Cor do texto
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}
