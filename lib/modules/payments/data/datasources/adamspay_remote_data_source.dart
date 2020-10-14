import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/amount_model.dart';
import '../models/create_debt_request_model.dart';
import '../models/debt_model.dart';
import '../models/valid_period_model.dart';

abstract class AdamsPayRemoteDataSource {
  Future<String> createDebt(String id, String label, double amount);
}

class AdamsPayRemoteDataSourceImpl implements AdamsPayRemoteDataSource {
  final AppConfig appConfig;
  final http.Client client;

  AdamsPayRemoteDataSourceImpl({
    @required this.appConfig,
    @required this.client,
  });

  @override
  Future<String> createDebt(String id, String label, double amount) async {
    final adamsPayApiKey = await appConfig.getAdamsPayApiKey();
    final url = 'https://staging.adamspay.com/api/v1/debts?update_if_exists=1';

    Map<String, String> headers = {
      'apiKey': adamsPayApiKey,
      'Content-Type': 'application/json',
    };

    DateTime currentDateTime = DateTime.now().toUtc();
    final DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');

    AmountModel amountModel = AmountModel(
      currency: 'PYG',
      value: amount.toInt().toString(),
    );

    ValidPeriodModel validPeriodModel = ValidPeriodModel(
      start: formatter.format(currentDateTime),
      end: formatter.format(currentDateTime.add(Duration(days: 2))),
    );

    DebtModel debtModel = DebtModel(
      docId: id,
      label: label,
      amount: amountModel,
      validPeriod: validPeriodModel,
    );

    CreateDebtRequestModel requestModel = CreateDebtRequestModel(
      debt: debtModel,
    );

    final http.Response response = await client.post(
      url,
      body: json.encode(requestModel.toJson()),
      headers: headers,
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      try {
        return jsonData['debt']['payUrl'];
      } on Exception catch (_) {
        throw ServerException();
      }
    }

    throw ServerException();
  }
}
