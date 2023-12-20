// ignore: file_names
import 'package:flutter/material.dart';
import 'package:trainingcallendar/restful/client/AlunoService.dart';
import 'package:trainingcallendar/restful/json/ProfessorDTO.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class Personal {
  final String nome;
  final String cpf;
  final String cref;
  final String fone;

  Personal(this.nome, this.cpf, this.fone, this.cref);
}

class MyProfessor extends StatefulWidget {
  const MyProfessor({Key? key}) : super(key: key);

  @override
  State<MyProfessor> createState() => _MyProfessorState();
}

class _MyProfessorState extends State<MyProfessor> {
  List<Personal> professores = [];

  @override
  void initState() {
    super.initState();
    _personal();
  }

  Future<void> _personal() async {
    int idLogin = await SessionManager().get("idLogin");
    ProfessorDTO data = await AlunoService().getProfessor(idLogin);

    var teste = Personal(data.nome, data.cpf.toString(), data.fone, data.cref.toString());
    professores.add(teste);
    setState(() {});
  }

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
        child: professores.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: professores.length,
                itemBuilder: (context, index) {
                  final professor = professores[index];
                  return Card(
                    margin: const EdgeInsets.all(16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.face, size: 40.0, color: Colors.blue), 
                            title: Text(
                              professor.nome,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text('CPF: ${professor.cpf}'),
                          Text('Telefone: ${professor.fone}'),
                          Text('CREF: ${professor.cref}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
