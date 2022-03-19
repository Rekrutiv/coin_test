import 'package:coin_test/models/srcsidebase_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coinbase_response_model.g.dart';

@JsonSerializable()
class CoinbaseResponse {
  String? time;
  @JsonKey(name: 'asset_id_base')
  String? assetIdBase;
  @JsonKey(name: 'asset_id_quote')
  String? assetIdQuote;
  @JsonKey(name: 'src_side_quote')
  List<SrcSideBase>? srcSideBase;

  CoinbaseResponse(this.time,this.assetIdBase,this.assetIdQuote,this.srcSideBase );

  factory CoinbaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinbaseResponseToJson(this);
}