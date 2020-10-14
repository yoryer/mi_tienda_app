part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddOne extends CartEvent {
  final Product product;

  AddOne({@required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveOne extends CartEvent {
  final Product product;

  RemoveOne({@required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends CartEvent {
  final Product product;

  RemoveFromCart({@required this.product});

  @override
  List<Object> get props => [product];
}

class ClearCart extends CartEvent {}
