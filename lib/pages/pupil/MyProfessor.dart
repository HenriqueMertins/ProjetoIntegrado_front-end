import 'package:flutter/material.dart';

// ignore: camel_case_types
class MyProfessor extends StatefulWidget {
  const MyProfessor({Key? key}) : super(key: key);

  @override
  State<MyProfessor> createState() => _MyProfessorState();
}

// ignore: camel_case_types
class _MyProfessorState extends State<MyProfessor> {
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
              'Dados do professor atual',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 228, 227, 227),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nome do Professor",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17.0),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 228, 227, 227),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "E-mail",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17.0),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 228, 227, 227),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fone",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17.0),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 228, 227, 227),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CREF",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17.0),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 228, 227, 227),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Instagram",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
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
