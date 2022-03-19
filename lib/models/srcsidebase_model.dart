import 'package:json_annotation/json_annotation.dart';

part 'srcsidebase_model.g.dart';

@JsonSerializable()
class SrcSideBase  {
  String? time;
  String? asset;
  double? rate;
  double? volume;

  SrcSideBase({this.time, this.asset, this.rate, this.volume});
  factory SrcSideBase.fromJson(Map<String, dynamic> json) =>
      _$SrcSideBaseFromJson(json);

  Map<String, dynamic> toJson() => _$SrcSideBaseToJson(this);
}