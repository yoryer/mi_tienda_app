part of 'search_products_bloc.dart';

abstract class SearchProductsEvent extends Equatable {
  const SearchProductsEvent();

  @override
  List<Object> get props => [];
}

class SearchQueryChanged extends SearchProductsEvent {
  final String query;

  SearchQueryChanged({@required this.query});

  @override
  List<Object> get props => [query];
}
