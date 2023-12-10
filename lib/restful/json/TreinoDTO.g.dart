// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TreinoDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreinoDTO _$TreinoDTOFromJson(Map<String, dynamic> json) => TreinoDTO(
      json['personalId'] as int,
      json['nome'] as String,
      json['carga'] as int,
      json['serie'] as int,
      json['rep'] as int,
    );

Map<String, dynamic> _$TreinoDTOToJson(TreinoDTO instance) => <String, dynamic>{
      'personalId': instance.personalId,
      'nome': instance.nome,
      'carga': instance.carga,
      'serie': instance.serie,
      'rep': instance.rep,
    };
