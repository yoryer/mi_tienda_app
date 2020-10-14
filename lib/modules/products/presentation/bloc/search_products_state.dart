part of 'search_products_bloc.dart';

abstract class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

class Empty extends SearchProductsState {}

class Loading extends SearchProductsState {}

class Loaded extends SearchProductsState {
  final List<Product> products;

  Loaded({@required this.products});

  @override
  List<Object> get props => [products];
}

class Error extends SearchProductsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
