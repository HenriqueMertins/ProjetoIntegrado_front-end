import 'package:flutter/material.dart';

// ignore: camel_case_types
class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

// ignore: camel_case_types
class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 188, 188),
        centerTitle: true,
        title: const Text("Training Calendar"),
        flexibleSpace: Container(
          
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
                  onPressed: () =>
                      {Navigator.of(context).pushNamed("/loginProfessorPage")},
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
                  onPressed: () =>
                      {Navigator.of(context).pushNamed("/LoginPupilPage")},
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
