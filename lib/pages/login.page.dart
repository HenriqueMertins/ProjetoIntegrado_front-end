import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 188, 188),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
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
                  onPressed: () => {},
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
}
