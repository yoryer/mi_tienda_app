part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class Empty extends PaymentState {}

class Loading extends PaymentState {}

class Loaded extends PaymentState {
  final PaymentUrl paymentUrl;

  Loaded({@required this.paymentUrl});

  @override
  List<Object> get props => [paymentUrl];
}

class Error extends PaymentState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
