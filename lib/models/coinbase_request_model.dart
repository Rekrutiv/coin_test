import 'package:json_annotation/json_annotation.dart';

part 'coinbase_request_model.g.dart';

@JsonSerializable()
class CoinbaseRequest {
 final String? type;
 final String? apikey;
 final bool? heartbeat;
 final List<String>? subscribeDataType;
 final List<String>? subscribeFilterAssetId;

  CoinbaseRequest(this.type, this.apikey,this.heartbeat,this.subscribeDataType,this.subscribeFilterAssetId);

  factory CoinbaseRequest.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CoinbaseRequestToJson(this);
}
