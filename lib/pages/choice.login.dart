import 'package:flutter/material.dart';

// ignore: camel_case_types
class choicePage extends StatefulWidget {
  const choicePage({super.key});

  @override
  State<choicePage> createState() => _choicePageState();
}

// ignore: camel_case_types
class _choicePageState extends State<choicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Training Calendar"),
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
                    Navigator.of(context).pushNamed("/loginProfessorPage")
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 243, 16, 0),
                  ),
                  child: const Text(
                    "Personal",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
              ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).pushNamed("/LoginPupilPage")
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 243, 16, 0),
                  ),
                  child: const Text(
                    "Aluno",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
