import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_featured_products.dart';

part 'featured_products_event.dart';
part 'featured_products_state.dart';

class FeaturedProductsBloc extends Bloc<FeaturedProductsEvent, FeaturedProductsState> {
  final GetFeaturedProducts _getFeaturedProducts;

  FeaturedProductsBloc({
    @required GetFeaturedProducts getFeaturedProducts,
  })  : assert(getFeaturedProducts != null),
        _getFeaturedProducts = getFeaturedProducts,
        super(Empty());

  @override
  Stream<FeaturedProductsState> mapEventToState(
    FeaturedProductsEvent event,
  ) async* {
    if (event is RetrieveFeaturedProducts) {
      yield Loading();
      final featuredProducts = await _getFeaturedProducts.call(NoParams());
      yield featuredProducts.fold(
        (failure) => Error(message: 'No hay productos para mostrar.'),
        (products) => Loaded(products: products),
      );
    }
  }
}
