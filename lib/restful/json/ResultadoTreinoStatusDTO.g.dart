// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultadoTreinoStatusDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultadoTreinoStatusDTO _$ResultadoTreinoStatusDTOFromJson(
        Map<String, dynamic> json) =>
    ResultadoTreinoStatusDTO(
      json['treinoid'] as int,
      json['nome'] as String,
      json['carga'] as int,
      json['serie'] as int,
      json['rep'] as int,
      json['dia'] as int,
      json['resultid'] as int,
      json['resulcarga'] as int,
      json['resulserie'] as int,
      json['resulrep'] as int,
      DateTime.parse(json['resuldata'] as String),
    );

Map<String, dynamic> _$ResultadoTreinoStatusDTOToJson(
        ResultadoTreinoStatusDTO instance) =>
    <String, dynamic>{
      'treinoid': instance.treinoid,
      'nome': instance.nome,
      'carga': instance.carga,
      'serie': instance.serie,
      'rep': instance.rep,
      'dia': instance.dia,
      'resultid': instance.resultid,
      'resulcarga': instance.resulcarga,
      'resulserie': instance.resulserie,
      'resulrep': instance.resulrep,
      'resuldata': instance.resuldata.toIso8601String(),
    };
