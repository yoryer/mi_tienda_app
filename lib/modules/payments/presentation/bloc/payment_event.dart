part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class RequestToPay extends PaymentEvent {
  final String id;
  final String label;
  final double amount;

  RequestToPay({
    @required this.id,
    @required this.label,
    @required this.amount,
  });

  @override
  List<Object> get props => [id, label, amount];
}

class PaymentEnded extends PaymentEvent {}
