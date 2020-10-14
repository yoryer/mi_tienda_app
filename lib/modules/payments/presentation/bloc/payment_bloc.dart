import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/payment_url.dart';
import '../../domain/usecases/pay_through_external_url.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PayThroughExternalUrl _payThroughExternalUrl;

  PaymentBloc({
    @required PayThroughExternalUrl payThroughExternalUrl,
  })  : assert(payThroughExternalUrl != null),
        _payThroughExternalUrl = payThroughExternalUrl,
        super(Empty());

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    if (event is RequestToPay) {
      yield Loading();
      final paymentUrl = await _payThroughExternalUrl.call(Params(
        id: event.id,
        label: event.label,
        amount: event.amount,
      ));
      yield paymentUrl.fold(
        (failure) => Error(message: 'Error al conectarse con el medio de pago'),
        (paymentUrl) => Loaded(paymentUrl: paymentUrl),
      );
    }
  }
}
