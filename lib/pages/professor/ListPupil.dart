import 'package:flutter/material.dart';

// ignore: camel_case_types
class ListPupil extends StatefulWidget {
  const ListPupil({Key? key}) : super(key: key);

  @override
  State<ListPupil> createState() => _listPupilState();
}

// ignore: camel_case_types
class _listPupilState extends State<ListPupil> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Lista de Alunos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255), 
              margin: const EdgeInsets.symmetric(
                  horizontal: 16.0), 
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nome do Aluno",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), 
                      fontSize: 16.0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 0, 0, 0)), 
                    onPressed: () =>
                      {Navigator.of(context).pushNamed("/InfoPupil")},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255), 
              margin: const EdgeInsets.symmetric(
                  horizontal: 16.0), 
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nome do Aluno",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), 
                      fontSize: 16.0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 0, 0, 0)), 
                    onPressed: () =>
                      {Navigator.of(context).pushNamed("/InfoPupil")},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255), 
              margin: const EdgeInsets.symmetric(
                  horizontal: 16.0), 
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nome do Aluno",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), 
                      fontSize: 16.0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 0, 0, 0)), 
                    onPressed: () =>
                      {Navigator.of(context).pushNamed("/InfoPupil")},
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