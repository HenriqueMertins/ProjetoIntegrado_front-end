import 'package:json_annotation/json_annotation.dart';

part 'ResultadoTreinoStatusDTO.g.dart';

// executar no terminal:
//      dart run build_runner build
// ou
//      dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ResultadoTreinoStatusDTO {
  // int id;
  int treinoid;
  String nome;
  int carga;
  int serie;
  int rep;
  int dia;
  int resultid;
  int resulcarga;
  int resulserie;
  int resulrep;
  DateTime resuldata;
  int realizado;

  ResultadoTreinoStatusDTO(
      this.treinoid,
      this.nome,
      this.carga,
      this.serie,
      this.rep,
      this.dia,
      this.resultid,
      this.resulcarga,
      this.resulserie,
      this.resulrep,
      this.resuldata,
      this.realizado);

  factory ResultadoTreinoStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultadoTreinoStatusDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResultadoTreinoStatusDTOToJson(this);
}
