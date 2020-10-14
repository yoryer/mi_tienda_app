// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtModel _$DebtModelFromJson(Map<String, dynamic> json) {
  return DebtModel(
    docId: json['docId'] as String,
    label: json['label'] as String,
    amount: json['amount'] == null
        ? null
        : AmountModel.fromJson(json['amount'] as Map<String, dynamic>),
    validPeriod: json['validPeriod'] == null
        ? null
        : ValidPeriodModel.fromJson(
            json['validPeriod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DebtModelToJson(DebtModel instance) => <String, dynamic>{
      'docId': instance.docId,
      'label': instance.label,
      'amount': instance.amount,
      'validPeriod': instance.validPeriod,
    };
