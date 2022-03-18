// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinbase_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinbaseResponse _$CoinbaseResponseFromJson(Map<String, dynamic> json) {
  return CoinbaseResponse(
    json['price'] as String,
    json['product_id'] as String,
  );
}

Map<String, dynamic> _$CoinbaseResponseToJson(CoinbaseResponse instance) =>
    <String, dynamic>{
      'price': instance.price,
      'product_id': instance.productId,
    };
