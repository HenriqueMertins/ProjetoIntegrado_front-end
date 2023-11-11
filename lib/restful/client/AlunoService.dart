import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainingcallendar/restful/json/LoginDTO.dart';
import 'package:trainingcallendar/restful/json/LoginRetDTO.dart';
import 'package:trainingcallendar/restful/json/ProfessorDTO.dart';
import '../../constants/WebService.dart';

class AlunoService {
  Future<LoginRetDTO> login(String cpf, String senha) async {
    LoginDTO loginDTO = LoginDTO(cpf: cpf, senha: senha);
    final response = await http.post(Uri.parse('$SERVIDOR/aluno/login'),
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

  Future<ProfessorDTO> getProfessor(int alunoId) async {
    final response = await http.get(
        Uri.parse('$SERVIDOR/personalAlunos/$alunoId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    ProfessorDTO ret = ProfessorDTO.fromJson(jsonDecode(response.body));

    return ret;
  }
}
