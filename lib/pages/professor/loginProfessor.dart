import 'package:flutter/material.dart';
import 'package:trainingcallendar/restful/client/ProfessorService.dart';
import '../../restful/client/ProfessorService.dart';

class LoginProfessorPage extends StatefulWidget {
  const LoginProfessorPage({super.key});

  @override
  State<LoginProfessorPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginProfessorPage> {
  final controlCpfField = TextEditingController();
  final controlSenhaField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
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
    // Clean up the controller when the widget is disposed.
    controlCpfField.dispose();
    controlSenhaField.dispose();
    super.dispose();
  }

  void _loginPress() async {
    var login = ProfessorService()
        .login(controlCpfField.text, controlSenhaField.text)
        .then((value) => Navigator.of(context).pushNamed("/choiceProfessor"))
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



