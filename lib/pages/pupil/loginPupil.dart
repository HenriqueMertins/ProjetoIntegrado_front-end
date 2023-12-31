// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:trainingcallendar/restful/client/AlunoService.dart';

import '../../restful/json/LoginRetDTO.dart';

class LoginPupilPage extends StatefulWidget {
  const LoginPupilPage({super.key});

  @override
  State<LoginPupilPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPupilPage> {
  final controlCpfField = TextEditingController();
  final controlSenhaField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 188, 188),
        centerTitle: true,
        title: const Text("Login Aluno"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Icon(
                      Icons.fitness_center,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 250.0,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: controlCpfField,
                autofocus: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                decoration: const InputDecoration(
                    labelText: "CPF",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30)),
              ),
              const Divider(),
              TextFormField(
                controller: controlSenhaField,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 30),
                ),
              ),
              const Divider(),
              ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: _loginPress,
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Color.fromARGB(255, 199, 15, 8)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controlCpfField.dispose();
    controlSenhaField.dispose();
    super.dispose();
  }

  void _loginPress() async {
    AlunoService()
        .login(controlCpfField.text, controlSenhaField.text)
        .then((loginRetDTO) => _go(loginRetDTO))
        .catchError((onError) => _fail());
  }

  void _go(LoginRetDTO loginDTO) async {
    SessionManager().set("token", loginDTO.token);
    SessionManager().set("type", "pupil");
    SessionManager().set("idLogin",loginDTO.idLogin);
    SessionManager().set("personalId",loginDTO.personalId);
    await Navigator.of(context).pushNamed("/firstScenePupil");
  }

  void _fail() async {
    SessionManager().set("token", "");
    SessionManager().set("type", "");
    return await showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Text('Não foi possível realizar autenticação'),
        );
      },
    );
  }
}
