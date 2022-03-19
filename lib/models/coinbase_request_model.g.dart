// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinbase_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinbaseRequest _$CoinbaseRequestFromJson(Map<String, dynamic> json) {
  return CoinbaseRequest(
    json['type'] as String?,
    json['apikey'] as String?,
    json['heartbeat'] as bool?,
    (json['subscribeDataType'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    (json['subscribeFilterAssetId'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$CoinbaseRequestToJson(CoinbaseRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'apikey': instance.apikey,
      'heartbeat': instance.heartbeat,
      'subscribeDataType': instance.subscribeDataType,
      'subscribeFilterAssetId': instance.subscribeFilterAssetId,
    };
