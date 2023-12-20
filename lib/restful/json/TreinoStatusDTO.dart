import 'package:json_annotation/json_annotation.dart';
import 'package:trainingcallendar/restful/json/ResultadoTreinoStatusDTO.dart';
import 'TreinoDTO.dart';

part 'TreinoStatusDTO.g.dart';

// executar no terminal:
//      dart run build_runner build
// ou
//      dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class TreinoStatusDTO {
  late List<ResultadoTreinoStatusDTO>  _treinosFeitos;

   List<ResultadoTreinoStatusDTO> get treinosFeitos => _treinosFeitos;

  set treinosFeitos(List<ResultadoTreinoStatusDTO> value) {
    _treinosFeitos = value;
  }

  late List<ResultadoTreinoStatusDTO> _treinosNaoFeitos;

  List<ResultadoTreinoStatusDTO> get treinosNaoFeitos => _treinosNaoFeitos;

  set treinosNaoFeitos(List<ResultadoTreinoStatusDTO> value) {
    _treinosNaoFeitos = value;
  }

  TreinoStatusDTO(List<ResultadoTreinoStatusDTO> treinosFeitos,
      List<ResultadoTreinoStatusDTO> treinosNaoFeitos) {
    this._treinosFeitos = treinosFeitos;
    this._treinosNaoFeitos = treinosNaoFeitos;
  }

  factory TreinoStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$TreinoStatusDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TreinoStatusDTOToJson(this);
}
