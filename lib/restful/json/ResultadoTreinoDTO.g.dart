// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultadoTreinoDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultadoTreinoDTO _$ResultadoTreinoDTOFromJson(Map<String, dynamic> json) =>
    ResultadoTreinoDTO(
      json['treino_id'] as int,
      json['aluno_id'] as int,
      json['id'] as int,
      json['carga'] as int,
      json['serie'] as int,
      json['rep'] as int,
      DateTime.parse(json['data'] as String),
    );

Map<String, dynamic> _$ResultadoTreinoDTOToJson(ResultadoTreinoDTO instance) =>
    <String, dynamic>{
      'treino_id': instance.treino_id,
      'aluno_id': instance.aluno_id,
      'id': instance.id,
      'carga': instance.carga,
      'serie': instance.serie,
      'rep': instance.rep,
      'data': instance.data.toIso8601String(),
    };
