import 'package:json_annotation/json_annotation.dart';

part 'LoginDTO.g.dart';
// executar no terminal:
//      flutter pub run build_runner build
// ou
//      flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class LoginDTO {
  final String cpf;
  final String senha;

  const LoginDTO({required this.cpf, required this.senha});

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}

