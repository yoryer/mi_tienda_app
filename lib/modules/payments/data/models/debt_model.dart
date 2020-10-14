import 'package:json_annotation/json_annotation.dart';

import 'amount_model.dart';
import 'valid_period_model.dart';

part 'debt_model.g.dart';

@JsonSerializable()
class DebtModel {
  final String docId;
  final String label;
  final AmountModel amount;
  final ValidPeriodModel validPeriod;

  DebtModel({
    this.docId,
    this.label,
    this.amount,
    this.validPeriod,
  });

  factory DebtModel.fromJson(Map<String, dynamic> json) => _$DebtModelFromJson(json);
  Map<String, dynamic> toJson() => _$DebtModelToJson(this);
}
