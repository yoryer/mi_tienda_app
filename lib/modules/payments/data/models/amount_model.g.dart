// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountModel _$AmountModelFromJson(Map<String, dynamic> json) {
  return AmountModel(
    currency: json['currency'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$AmountModelToJson(AmountModel instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'value': instance.value,
    };
