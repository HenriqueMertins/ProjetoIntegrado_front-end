import 'package:json_annotation/json_annotation.dart';

part 'ProfessorDTO.g.dart';

// executar no terminal:
//      dart run build_runner build
// ou
//      dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ProfessorDTO {
  int id;
  String nome;
  int cpf;
  String fone;
  int cref;

  ProfessorDTO(this.id, this.nome, this.cpf, this.fone, this.cref);

  factory ProfessorDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfessorDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessorDTOToJson(this);
}
