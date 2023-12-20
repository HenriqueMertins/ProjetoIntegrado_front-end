// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginRetDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRetDTO _$LoginRetDTOFromJson(Map<String, dynamic> json) => LoginRetDTO(
      json['msg'] as String,
      json['personalId'] as int,
      json['token'] as String,
    )..idLogin = json['idLogin'] as int;

Map<String, dynamic> _$LoginRetDTOToJson(LoginRetDTO instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'idLogin': instance.idLogin,
      'personalId': instance.personalId,
      'token': instance.token,
    };
