import 'package:json_annotation/json_annotation.dart';

part 'amount_model.g.dart';

@JsonSerializable()
class AmountModel {
  final String currency;
  final String value;

  AmountModel({
    this.currency,
    this.value,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) => _$AmountModelFromJson(json);
  Map<String, dynamic> toJson() => _$AmountModelToJson(this);
}
