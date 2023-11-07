// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfessorDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessorDTO _$ProfessorDTOFromJson(Map<String, dynamic> json) => ProfessorDTO(
      json['id'] as int,
      json['nome'] as String,
      json['cpf'] as int,
      json['fone'] as String,
      json['cref'] as int,
    );

Map<String, dynamic> _$ProfessorDTOToJson(ProfessorDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cpf': instance.cpf,
      'fone': instance.fone,
      'cref': instance.cref,
    };
