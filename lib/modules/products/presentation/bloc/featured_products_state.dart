part of 'featured_products_bloc.dart';

abstract class FeaturedProductsState extends Equatable {
  const FeaturedProductsState();

  @override
  List<Object> get props => [];
}

class Empty extends FeaturedProductsState {}

class Loading extends FeaturedProductsState {}

class Loaded extends FeaturedProductsState {
  final List<Product> products;

  Loaded({@required this.products});

  @override
  List<Object> get props => [products];
}

class Error extends FeaturedProductsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
