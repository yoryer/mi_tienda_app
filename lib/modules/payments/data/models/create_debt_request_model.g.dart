// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_debt_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDebtRequestModel _$CreateDebtRequestModelFromJson(
    Map<String, dynamic> json) {
  return CreateDebtRequestModel(
    debt: json['debt'] == null
        ? null
        : DebtModel.fromJson(json['debt'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateDebtRequestModelToJson(
        CreateDebtRequestModel instance) =>
    <String, dynamic>{
      'debt': instance.debt,
    };
