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

  @override
  void dispose() {
    nomeController.dispose();
    cargaController.dispose();
    repeticaoController.dispose();
    serieController.dispose();
    super.dispose();
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Cadastro de Treino',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                      hintText: 'Digite a carga',
                    ),
                  ),
                  const Text(
                    'Repetições:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: repeticaoController,
                    decoration: const InputDecoration(
                        hintText: 'Digite a quantidade de repetições',
                        counterText: ""),
                    keyboardType: TextInputType.phone,
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
                        hintText: 'Digite a quantidade de séries',
                        counterText: ""),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: _salvarInformacoes,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 199, 15, 8), // Cor do texto em branco
                        ),
                        child: ButtonTheme(
                          height: 60.0,
                          child: ElevatedButton(
                            onPressed: _addTreino,
                            child: const Text(
                              "Registrar",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 199, 15, 8)),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTreino() async {
    int personalId = await SessionManager().get("idLogin");
    String nome = nomeController.text;
    int carga = int.parse(cargaController.text);
    int serie = int.parse(serieController.text);
    int rep = int.parse(repeticaoController.text);

    TreinoDTO treinoDTO = TreinoDTO(personalId, nome, carga, serie, rep);

    var catchError = ProfessorService()
        .addTreino(treinoDTO)
        .then((ret) => _msg(ret))
        .catchError((onError) => _fail());
  }

  _msg(bool ret) async {
    if (ret) {
      return const AlertDialog(
        content: Text('Treino registrado com sucesso'),
      );
    } else {
      return const AlertDialog(
        content: Text('Não foi possível registrar o treino'),
      );
    }
  }

  _fail() async {
    return const AlertDialog(
      content: Text('Não foi possível registrar o treino'),
    );
  }
}
