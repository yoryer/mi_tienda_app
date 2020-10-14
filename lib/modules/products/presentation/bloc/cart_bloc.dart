import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    Map<Product, int> cartProducts = Map<Product, int>();
    if (state.products != null) {
      cartProducts = state.products;
    }

    if (event is AddOne) {
      if (cartProducts.containsKey(event.product)) {
        cartProducts[event.product] = cartProducts[event.product] + 1;
      } else {
        cartProducts.addAll({event.product: 1});
      }
    }

    if (event is RemoveOne) {
      if (cartProducts.containsKey(event.product)) {
        if (cartProducts[event.product] > 1) {
          cartProducts[event.product] = cartProducts[event.product] - 1;
        }
      }
    }

    if (event is RemoveFromCart) {
      if (cartProducts.containsKey(event.product)) {
        cartProducts.remove(event.product);
      }
    }

    if (event is ClearCart) {
      cartProducts.clear();
    }

    yield state.copyWith(
      products: cartProducts,
      totalProducts: cartProducts.values.fold(0, (previousValue, quantity) => previousValue + quantity),
      totalToPay:
          cartProducts.entries.fold(0, (previousValue, element) => previousValue + (element.key.price * element.value)),
    );
  }
}
