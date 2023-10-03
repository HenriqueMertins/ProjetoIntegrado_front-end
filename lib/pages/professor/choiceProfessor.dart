import 'package:flutter/material.dart';

// ignore: camel_case_types
class choiceProfessor extends StatefulWidget {
  const choiceProfessor({super.key});

  @override
  State<choiceProfessor> createState() => _choiceProfessorPageState();
}

// ignore: camel_case_types
class _choiceProfessorPageState extends State<choiceProfessor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(""),
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
              const Center(
                child: Text(
                  "Training Calendar", 
                  style: TextStyle(
                    fontSize: 24.0, 
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).pushNamed("/calendarPupil")
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 243, 16, 0), 
                  ),
                  child: const Text(
                    "Alunos",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
              ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).pushNamed("/register")
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 243, 16, 0), 
                  ),
                  child: const Text(
                    "Cadastro Novo Aluno",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
