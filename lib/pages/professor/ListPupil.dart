import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainingcallendar/restful/client/ProfessorService.dart';
import 'package:trainingcallendar/restful/json/PupilDTO.dart';

// ignore: camel_case_types
class ListPupil extends StatefulWidget {
  const ListPupil({Key? key}) : super(key: key);

  @override
  State<ListPupil> createState() => _listPupilState();
}

// ignore: camel_case_types
class _listPupilState extends State<ListPupil> {
  @override
  void initState() {
    super.initState();
    _pupils();
  }

  Future<List<PupilDTO>> _pupils() async {
    var v = await ProfessorService().listPupil(1);
    return v;
  }

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
        child: FutureBuilder<List<PupilDTO>>(
          future: _pupils(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data?.elementAt(index).nome ?? "");
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'Lista de Alunos',
      //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(height: 20),
      //       Container(
      //         width: double.infinity,
      //         color: const Color.fromARGB(255, 255, 255, 255),
      //         margin: const EdgeInsets.symmetric(horizontal: 16.0),
      //         padding: const EdgeInsets.all(16.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             const Text(
      //               "Nome do Aluno",
      //               style: TextStyle(
      //                 color: Color.fromARGB(255, 0, 0, 0),
      //                 fontSize: 16.0,
      //               ),
      //             ),
      //             IconButton(
      //               icon: const Icon(Icons.keyboard_arrow_down,
      //                   color: Color.fromARGB(255, 0, 0, 0)),
      //               onPressed: () =>
      //                   {Navigator.of(context).pushNamed("/InfoPupil")},
      //             ),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //     ],
      //   ),
      // ),
    );
  }
}
