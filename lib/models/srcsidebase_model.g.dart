// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'srcsidebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SrcSideBase _$SrcSideBaseFromJson(Map<String, dynamic> json) {
  return SrcSideBase(
    time: json['time'] as String?,
    asset: json['asset'] as String?,
    rate: (json['rate'] as num?)?.toDouble(),
    volume: (json['volume'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$SrcSideBaseToJson(SrcSideBase instance) =>
    <String, dynamic>{
      'time': instance.time,
      'asset': instance.asset,
      'rate': instance.rate,
      'volume': instance.volume,
    };
