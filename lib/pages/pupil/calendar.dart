import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainingcallendar/restful/client/TreinoService.dart';
import 'package:trainingcallendar/restful/json/ResultadoTreinoDTO.dart';

class Treino {
  final int id;
  final String nome;
  final int carga;
  final int serie;
  final int rep;
  final int dia;

  Treino(this.id, this.nome, this.carga, this.serie, this.rep, this.dia);
}

// ignore: camel_case_types
class calendarPage extends StatefulWidget {
  const calendarPage({super.key});

  @override
  State<calendarPage> createState() => _calendarPageState();
}

// ignore: camel_case_types
class _calendarPageState extends State<calendarPage> {
  TextEditingController seriesController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController repeticoesController = TextEditingController();

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
      return Treino(treinoData.id, treinoData.nome, treinoData.carga,
          treinoData.serie, treinoData.rep, treinoData.dia);
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        treino.nome,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                          _showAddTrainingDialog(context, treino.id);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 199, 15, 8),
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

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _valida() {
    if (seriesController.text == "") {
      _showErrorDialog('Por favor, preencha o numero de series.');
      return false;
    }
    try {
      int.parse(pesoController.text);
    } catch (ex) {
      _showErrorDialog('Por favor preencha a carga.');
      return false;
    }
    try {
      int.parse(repeticoesController.text);
    } catch (ex) {
      _showErrorDialog('Por favor preencha o número de repetições.');
      return false;
    }

    return true;
  }

  void _addResultado(int treinoId) async {
    if (_valida()) {
      int alunoId = await SessionManager().get("idLogin");
      
      int serie = int.parse(seriesController.text);
      int carga = int.parse(pesoController.text);
      int rep = int.parse(repeticoesController.text);

      // print("alunoId $alunoId    treinoid $treinoId    today $today" );

      String formattedDate = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

      DateTime dateObject = DateTime.parse(formattedDate);


      ResultadoTreinoDTO resultadoTreinoDTO = ResultadoTreinoDTO(
        treinoId,
        alunoId,
        0,
        carga,
        serie,
        rep,
        dateObject,
      );

        var catchError = TreinoService()
            .addResultadoTreino(resultadoTreinoDTO)
            .then((ret) => _msg(ret))
            .catchError((onError) => _fail());
        _clearFields();
          Navigator.of(context).pop();
    }
 
  }

  void _clearFields() {
    seriesController.clear();
    pesoController.clear();
    repeticoesController.clear();
  }

  _fail() async {
    return const AlertDialog(
      content: Text('Não foi possível registrar o treino'),
    );
  }

  void _msg(bool ret) {
    // print(_msg("mensagem"));
    String message;
    if (ret) {
      message = 'Treino registrado com sucesso';
    } else {
      message = 'Não foi possível registrar o treino';
    }
  }

  void _showAddTrainingDialog(BuildContext context, int treinoId ) {
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
                foregroundColor: Colors.red,
              ),
              onPressed: () {
               _addResultado(treinoId);
              },
              child: const Text("Adicionar Treino"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
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
