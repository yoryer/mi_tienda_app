import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/search_products.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';

class SearchProductsBloc extends Bloc<SearchProductsEvent, SearchProductsState> {
  final SearchProducts _searchProducts;

  SearchProductsBloc({@required SearchProducts searchProducts})
      : assert(searchProducts != null),
        _searchProducts = searchProducts,
        super(Empty());

  @override
  Stream<SearchProductsState> mapEventToState(
    SearchProductsEvent event,
  ) async* {
    if (event is SearchQueryChanged) {
      yield Loading();
      if (event.query == null || event.query.length == 0) {
        yield Empty();
      } else {
        final products = await _searchProducts.call(Params(query: event.query));
        yield products.fold(
          (failure) => Error(message: 'No hay resultados para \'${event.query.toString()}\''),
          (products) => Loaded(products: products),
        );
      }
    }
  }
}
