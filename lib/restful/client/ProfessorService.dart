import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainingcallendar/restful/json/LoginDTO.dart';
import 'package:trainingcallendar/restful/json/LoginRetDTO.dart';
import 'package:trainingcallendar/restful/json/PupilDTO.dart';
import 'package:trainingcallendar/restful/json/TreinoDTO.dart';
import '../../constants/WebService.dart';

class ProfessorService {
  Future<LoginRetDTO> login(String cpf, String senha) async {
    LoginDTO loginDTO = LoginDTO(cpf: cpf, senha: senha);
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

  Future<List<PupilDTO>> listPupil(int personalId) async {
    final response = await http.get(
        Uri.parse('$SERVIDOR/alunosPersonal/$personalId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    List<PupilDTO> ret = List<PupilDTO>.empty(growable: true);
    if (response.statusCode == 200) {
      List<dynamic> retTemp = (jsonDecode(response.body) as List<dynamic>);
      retTemp.forEach((element) {
        ret.add(PupilDTO.fromJson(element));
      });
      return ret;
    } else {
      return ret;
    }
  }

  Future<bool> addTreino(TreinoDTO treinoDTO) async {
    print(jsonEncode(treinoDTO.toJson()));
    final response = await http.post(Uri.parse('$SERVIDOR/treinos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(treinoDTO.toJson()));
        return (response.statusCode == 200);
  }
}
