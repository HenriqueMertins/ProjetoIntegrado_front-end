import 'dart:convert';

import 'package:trainingcallendar/constants/WebService.dart';
import 'package:trainingcallendar/restful/json/ResultadoTreinoDTO.dart';
import 'package:trainingcallendar/restful/json/TreinoDTO.dart';

import 'package:http/http.dart' as http;
import 'package:trainingcallendar/restful/json/TreinoStatusDTO.dart';

class TreinoService {

  Future<List<TreinoDTO>> listTreino(int personalId, int dia) async {
    final response = await http.get(
        Uri.parse('$SERVIDOR/treinos/$personalId/$dia'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    List<TreinoDTO> ret = List<TreinoDTO>.empty(growable: true);
    if (response.statusCode == 200) {
      List<dynamic> retTemp = (jsonDecode(response.body) as List<dynamic>);
      retTemp.forEach((element) {
        ret.add(TreinoDTO.fromJson(element));
      });
      return ret;
    } else {
      return ret;
    }
  }

  Future<List<TreinoStatusDTO>> listResultadosTreino(int personalId, int alunoId, int dia, DateTime data) async {
    final response = await http.get(
      Uri.parse('$SERVIDOR/resultadoTreino/$personalId/$alunoId/$dia/$data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    List<TreinoStatusDTO> ret = List<TreinoStatusDTO>.empty(growable: true);
    if (response.statusCode == 200) {
      List<dynamic> retTemp = (jsonDecode(response.body) as List<dynamic>);
      retTemp.forEach((element) {
        ret.add(TreinoStatusDTO.fromJson(element));
      });
      return ret;
    } else {
      return ret;
    }
  }

  Future<bool> addResultadoTreino(ResultadoTreinoDTO resultadoTreinoDTO) async {
    print(jsonEncode(resultadoTreinoDTO.toJson()));
    final response = await http.post(Uri.parse('$SERVIDOR/resultadoTreino'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(resultadoTreinoDTO.toJson()));
        return (response.statusCode == 200);
  }

}


 

  
