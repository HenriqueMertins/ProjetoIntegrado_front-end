import 'dart:convert';

import 'package:trainingcallendar/constants/WebService.dart';
import 'package:trainingcallendar/restful/json/TreinoDTO.dart';

import 'package:http/http.dart' as http;


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
}