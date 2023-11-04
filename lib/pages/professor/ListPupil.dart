import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainingcallendar/restful/client/ProfessorService.dart';


class Aluno {
  final String nome;
  final String cpf;
  final String fone;

  Aluno(this.nome, this.cpf, this.fone);
}

class ListPupil extends StatefulWidget {
  const ListPupil({Key? key}) : super(key: key);

  @override
  State<ListPupil> createState() => _ListPupilState();
}

class _ListPupilState extends State<ListPupil> {
  List<Aluno> alunos = [];

  @override
  void initState() {
    super.initState();
    _pupils();
  }

  Future<void> _pupils() async {
    var data = await ProfessorService().listPupil(1);
    alunos = data.map((alunoData) {
      if (alunos['nome'] != null &&
          alunos['cpf'] != null &&
          alunos['fone'] != null) {
        return Aluno(alunos['nome'], alunos['cpf'], alunos['fone']);
      } else {
        return Aluno(
            "Nome desconhecido", "Cpf desconhecido", "Telefone desconhecido");
      }
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 188, 188),
        centerTitle: true,
        title: const Text("Calendário de Treinamento"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      body: Center(
        child: alunos.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: alunos.length,
                itemBuilder: (context, index) {
                  final aluno = alunos[index];
                  return ListTile(
                    title: Text(aluno.nome),
                    subtitle:
                        Text('Telefone: ${aluno.cpf} , CPF: ${aluno.nome}'),
                  );
                },
              ),
      ),
    );
  }
}
