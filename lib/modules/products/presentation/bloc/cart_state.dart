part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Map<Product, int> products;
  final int totalProducts;
  final double totalToPay;

  const CartState({
    this.products,
    this.totalProducts,
    this.totalToPay,
  });

  CartState copyWith({
    Map<Product, int> products,
    int totalProducts,
    double totalToPay,
  }) {
    return CartState(
      products: products ?? this.products,
      totalProducts: totalProducts ?? this.totalProducts,
      totalToPay: totalToPay ?? this.totalToPay,
    );
  }

  @override
  List<Object> get props => [products, totalProducts, totalToPay];
}
