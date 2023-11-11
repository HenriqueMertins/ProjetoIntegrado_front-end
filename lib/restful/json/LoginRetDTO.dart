import 'package:json_annotation/json_annotation.dart';

part 'LoginRetDTO.g.dart';

// executar no terminal:
//      flutter pub run build_runner build
// ou
//      flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class LoginRetDTO {
  String msg;
  int idLogin=0;
  String token;

  LoginRetDTO(this.msg, this.token);

  factory LoginRetDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginRetDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRetDTOToJson(this);
}
