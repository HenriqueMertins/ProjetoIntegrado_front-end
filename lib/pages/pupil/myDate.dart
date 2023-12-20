// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class myDate extends StatefulWidget {
  const myDate({Key? key}) : super(key: key);

  @override
  State<myDate> createState() => _myDateState();
}

// ignore: camel_case_types
class _myDateState extends State<myDate> {
  DateTime today = DateTime.now();
  TextEditingController nomeController = TextEditingController();
  TextEditingController bracoController = TextEditingController();
  TextEditingController pernaController = TextEditingController();
  String? sexo; 
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    bracoController.dispose();
    pernaController.dispose();
    dataNascimentoController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  void _salvarInformacoes() {}

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
              'Meus Dados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Nome:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      hintText: 'Digite seu nome',
                    ),
                  ),
                  const Text(
                    'Braço:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: bracoController,
                    decoration: const InputDecoration(
                      hintText: 'Digite o tamanho do seu braço',
                    ),
                  ),
                  const Text(
                    'quadriceps:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: pernaController,
                    decoration: const InputDecoration(
                        hintText: 'Digite seu telefone', counterText: ""),
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const Text(
                    'Sexo:',
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButtonFormField<String>(
                    value: sexo,
                    items: <String>[
                      'Feminino',
                      'Masculino',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        sexo = newValue;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Selecione o sexo',
                    ),
                  ),
                  const Text(
                    'Cintura',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: dataNascimentoController,
                    decoration: const InputDecoration(
                        hintText: 'Digite o tamanho da sua cintura', counterText: ""),
                    keyboardType: TextInputType.datetime,
                    maxLength: 8,
                  ),
                  const Text(
                    'Peso:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: pesoController,
                    decoration: const InputDecoration(
                        hintText: 'Digite seu peso', counterText: ""),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _salvarInformacoes,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                            255, 199, 15, 8), 
                      ),
                      child: const Text('Salvar'),
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

class DataNascimentoInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (oldValue.text.length < text.length) {
      if (text.length == 2 || text.length == 5) {
        return newValue.copyWith(text: '$text/');
      }
    }
    return newValue;
  }
}
