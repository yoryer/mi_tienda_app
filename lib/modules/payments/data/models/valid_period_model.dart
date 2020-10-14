import 'package:json_annotation/json_annotation.dart';

part 'valid_period_model.g.dart';

@JsonSerializable()
class ValidPeriodModel {
  final String start;
  final String end;

  ValidPeriodModel({
    this.start,
    this.end,
  });

  factory ValidPeriodModel.fromJson(Map<String, dynamic> json) => _$ValidPeriodModelFromJson(json);
  Map<String, dynamic> toJson() => _$ValidPeriodModelToJson(this);
}
