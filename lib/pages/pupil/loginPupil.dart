import 'package:flutter/material.dart';
import 'package:trainingcallendar/restful/client/AlunoService.dart';
import '../../restful/client/AlunoService.dart';

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
              TextFormField(
                controller: controlCpfField,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                decoration: const InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30)),
              ),
              const Divider(),
              TextFormField(
                controller: controlSenhaField,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.number,
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
    // Clean up the controller when the widget is disposed.
    controlCpfField.dispose();
    controlSenhaField.dispose();
    super.dispose();
  }

  void _loginPress() async {
    var login = AlunoService()
        .login(controlCpfField.text, controlSenhaField.text)
        .then((value) => Navigator.of(context).pushNamed("/firstScenePupil"))
        .catchError((onError) => showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('Não foi possível realizar autenticação'),
                );
              },
            ));
  }
}
