import 'package:json_annotation/json_annotation.dart';
import 'amount_model.dart';
import 'debt_model.dart';
import 'valid_period_model.dart';

part 'create_debt_request_model.g.dart';

@JsonSerializable()
class CreateDebtRequestModel {
  final DebtModel debt;

  CreateDebtRequestModel({
    this.debt,
  });

  factory CreateDebtRequestModel.fromJson(Map<String, dynamic> json) => _$CreateDebtRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateDebtRequestModelToJson(this);
}
