import 'package:flutter/material.dart';

// ignore: camel_case_types
class InfoPupil extends StatefulWidget {
  const InfoPupil({Key? key}) : super(key: key);

  @override
  State<InfoPupil> createState() => _InfoPupilState();
}

// ignore: camel_case_types
class _InfoPupilState extends State<InfoPupil> {
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
              'Informação do Aluno',
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
                    "Nome do Aluno",
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
                    "Sexo",
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
                    "Data de Nascimento",
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
                    "Peso",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(
                    right: 16.0), 
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 199, 15, 8),
                  ),
                  child: const Text('Remover'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
