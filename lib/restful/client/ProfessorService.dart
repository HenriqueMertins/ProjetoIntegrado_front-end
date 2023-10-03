import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainingcallendar/restful/json/LoginDTO.dart';
import 'package:trainingcallendar/restful/json/LoginRetDTO.dart';
import '../../constants/WebService.dart';

class ProfessorService {
  Future<LoginRetDTO> login(String cpf, String senha) async {
    LoginDTO loginDTO = LoginDTO(cpf: cpf, senha: senha);
    print("$cpf $senha");
    final response = await http.post(Uri.parse('$SERVIDOR/personal/login'), 
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginDTO.toJson()));
    if (response.statusCode == 200) {
      return LoginRetDTO.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed login');
    }
  }
}
