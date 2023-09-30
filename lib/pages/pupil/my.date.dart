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
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  String? sexo; // Adicionado para armazenar o valor selecionado no sexo.
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    dataNascimentoController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  void _salvarInformacoes() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Meus Dados"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.of(context).pushNamed("/myDatePupil")},
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Informações do Aluno',
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
                    'E-mail:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Digite seu e-mail',
                    ),
                  ),
                  const Text(
                    'Telefone:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: telefoneController,
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
                    'Data de Nascimento:',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextFormField(
                    controller: dataNascimentoController,
                    decoration: const InputDecoration(
                        hintText: 'DD/MM/AAAA', counterText: ""),
                    keyboardType: TextInputType.datetime,
                    maxLength: 8,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   DataNascimentoInputFormatter(),
                    // ],
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
                            255, 199, 15, 8), // Cor do texto em branco
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
