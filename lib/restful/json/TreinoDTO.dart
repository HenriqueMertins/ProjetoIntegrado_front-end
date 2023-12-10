import 'package:json_annotation/json_annotation.dart';

part 'TreinoDTO.g.dart';

// executar no terminal:
//      dart run build_runner build
// ou
//      dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class TreinoDTO {
  // int id;
  int personalId;
  String nome;
  int carga;
  int serie;
  int rep;

  // TreinoDTO(this.id, this.personalId, this.nome, this.carga, this.serie, this.rep);
  TreinoDTO(this.personalId, this.nome, this.carga, this.serie, this.rep);


  factory TreinoDTO.fromJson(Map<String, dynamic> json) =>
      _$TreinoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TreinoDTOToJson(this);
}