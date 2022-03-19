// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinbase_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinbaseResponse _$CoinbaseResponseFromJson(Map<String, dynamic> json) {
  return CoinbaseResponse(
    json['time'] as String?,
    json['asset_id_base'] as String?,
    json['asset_id_quote'] as String?,
    (json['src_side_quote'] as List<dynamic>?)
        ?.map((e) => SrcSideBase.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CoinbaseResponseToJson(CoinbaseResponse instance) =>
    <String, dynamic>{
      'time': instance.time,
      'asset_id_base': instance.assetIdBase,
      'asset_id_quote': instance.assetIdQuote,
      'src_side_quote': instance.srcSideBase,
    };
