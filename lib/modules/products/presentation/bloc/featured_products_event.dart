part of 'featured_products_bloc.dart';

abstract class FeaturedProductsEvent extends Equatable {
  const FeaturedProductsEvent();

  @override
  List<Object> get props => [];
}

class RetrieveFeaturedProducts extends FeaturedProductsEvent {}
