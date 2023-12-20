// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:trainingcallendar/restful/client/ProfessorService.dart';
import 'package:trainingcallendar/restful/json/TreinoDTO.dart';

// ignore: camel_case_types
class RegisterTraining extends StatefulWidget {
  const RegisterTraining({Key? key}) : super(key: key);

  @override
  State<RegisterTraining> createState() => _RegisterTrainingState();
}

// ignore: camel_case_types
class _RegisterTrainingState extends State<RegisterTraining> {
  DateTime today = DateTime.now();
  TextEditingController nomeController = TextEditingController();
  TextEditingController cargaController = TextEditingController();
  TextEditingController repeticaoController = TextEditingController();
  TextEditingController serieController = TextEditingController();
  int? selectedDay;

  @override
  void dispose() {
    nomeController.dispose();
    cargaController.dispose();
    repeticaoController.dispose();
    serieController.dispose();
    // diaController.dispose();
    super.dispose();
  }

  List<String> daysOfWeek = [
    'Domingo',
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado'
  ];

  void _salvarInformacoes() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 188, 188),
        centerTitle: true,
        title: const Text("Training Calendar"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Cadastro de Treino',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Nome do Exercicio:',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  hintText: 'Digite o nome',
                ),
              ),
              const Text(
                'Carga Estipulada:',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: cargaController,
                decoration: const InputDecoration(
                    hintText: 'Digite a carga', counterText: ""),
                keyboardType: TextInputType.number,
                maxLength: 4,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const Text(
                'Repetições:',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: repeticaoController,
                decoration: const InputDecoration(
                    hintText: 'Digite o número de repetições',
                    counterText: ""),
                keyboardType: TextInputType.number,
                maxLength: 2,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const Text(
                'Séries:',
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                controller: serieController,
                decoration: const InputDecoration(
                    hintText: 'Digite a quantidade de séries', counterText: ""),
                keyboardType: TextInputType.number,
                maxLength: 2,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const Text(
                'Dia:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButtonFormField<int>(
                value: selectedDay,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedDay = newValue;
                  });
                },
                items: List.generate(7, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(daysOfWeek[index]),
                  );
                }),
                decoration: const InputDecoration(
                  hintText: 'Escolha o dia',
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _addTreino,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 199, 15, 8),
                  ),
                  child: const Text(
                    "Registrar",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _valida() {
    if (nomeController.text == "") {
      _showErrorDialog('Por favor, preencha o nome.');
      return false;
    }
    try {
      int.parse(cargaController.text);
    } catch (ex) {
      _showErrorDialog('Por vafor preencha a carga.');
      return false;
    }
    try {
      int.parse(repeticaoController.text);
    } catch (ex) {
      _showErrorDialog('Por vafor preencha o número de repetições.');
      return false;
    }
     try {
      int.parse(serieController.text);
    } catch (ex) {
      _showErrorDialog('Por vafor preencha o número de séries.');
      return false;
    }
    if (selectedDay == null) {
      _showErrorDialog('Por favor, escolha o dia.');
      return false;
    }

    return true;
  }

  void _addTreino() async {
    if (_valida()) {
      int personalId = await SessionManager().get("idLogin");
      String nome = nomeController.text;
      int carga = int.parse(cargaController.text);
      int serie = int.parse(serieController.text);
      int rep = int.parse(repeticaoController.text);

      int dia = selectedDay ?? 0;

      TreinoDTO treinoDTO = TreinoDTO(personalId, 0, nome, carga, serie, rep, dia);

      ProfessorService()
          .addTreino(treinoDTO)
          .then((ret) => _msg(ret))
          .catchError((onError) => _fail());
      _clearFields();
    }
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

  void _clearFields() {
    nomeController.clear();
    cargaController.clear();
    repeticaoController.clear();
    serieController.clear();
    selectedDay = null;
  }

  void _msg(bool ret) {
    // print(_msg("mensagem"));
    String message;
    if (ret) {
      message = 'Não foi possível registrar o treino';
    } else {
      message = 'Treino registrado com sucesso';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
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

  _fail() async {
    return const AlertDialog(
      content: Text('Não foi possível registrar o treino'),
    );
  }
}
