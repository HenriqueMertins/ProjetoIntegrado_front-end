import 'package:flutter/material.dart';

// ignore: camel_case_types
class choicePupil extends StatefulWidget {
  const choicePupil({Key? key});

  @override
  State<choicePupil> createState() => _choicePupilPageState();
}

// ignore: camel_case_types
class _choicePupilPageState extends State<choicePupil> {
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
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
                          size: 300.0,
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
                      onPressed: () => {
                        Navigator.of(context).pushNamed("/calendarPupil")
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 243, 16, 0), 
                      ),
                      child: const Text(
                        "Minha Agenda",
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  ButtonTheme(
                    height: 60.0,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).pushNamed("/MyProfessor")
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 243, 16, 0), 
                      ),
                      child: const Text(
                        "Meu Professor",
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  ButtonTheme(
                    height: 60.0,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).pushNamed("/myDatePupil")
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 243, 16, 0), 
                      ),
                      child: const Text(
                        "Meus Dados",
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
