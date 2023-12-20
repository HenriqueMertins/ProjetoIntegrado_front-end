// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TreinoStatusDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreinoStatusDTO _$TreinoStatusDTOFromJson(Map<String, dynamic> json) =>
    TreinoStatusDTO(
      (json['treinosFeitos'] as List<dynamic>)
          .map((e) =>
              ResultadoTreinoStatusDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['treinosNaoFeitos'] as List<dynamic>)
          .map((e) =>
              ResultadoTreinoStatusDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreinoStatusDTOToJson(TreinoStatusDTO instance) =>
    <String, dynamic>{
      'treinosFeitos': instance.treinosFeitos,
      'treinosNaoFeitos': instance.treinosNaoFeitos,
    };
