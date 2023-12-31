import 'package:json_annotation/json_annotation.dart';

part 'PupilDTO.g.dart';

// executar no terminal:
//      dart run build_runner build
// ou
//      dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class PupilDTO {
  int id;
  String nome;
  String cpf;
  String fone;

  PupilDTO(this.id, this.nome, this.cpf, this.fone);

  factory PupilDTO.fromJson(Map<String, dynamic> json) =>
      _$PupilDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PupilDTOToJson(this);
}
