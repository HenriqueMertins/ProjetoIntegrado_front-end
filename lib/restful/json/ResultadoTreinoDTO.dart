import 'package:json_annotation/json_annotation.dart';

part 'ResultadoTreinoDTO.g.dart';

// executar no terminal:
//      dart run build_runner build
// ou
//      dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ResultadoTreinoDTO {
  int treino_id;
  int aluno_id;
  int id;
  int carga;
  int serie;
  int rep;
  int data;

  ResultadoTreinoDTO(this.treino_id, this.aluno_id, this.id, this.carga, this.serie, this.rep, this.data);

  factory ResultadoTreinoDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultadoTreinoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResultadoTreinoDTOToJson(this);
}