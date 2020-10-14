import 'package:flutter/material.dart';

import '../../modules/payments/presentation/views/payment_view.dart';

class PaymentPage extends StatelessWidget {
  final String paymentId;
  final String paymentLabel;
  final double paymentAmount;

  PaymentPage({
    @required this.paymentId,
    @required this.paymentLabel,
    @required this.paymentAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Tienda'),
      ),
      body: PaymentView(
        id: paymentId,
        label: paymentLabel,
        amount: paymentAmount,
      ),
    );
  }
}
