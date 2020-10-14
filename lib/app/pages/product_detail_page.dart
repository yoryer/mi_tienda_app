import 'package:flutter/material.dart';

import '../../modules/products/domain/entities/product.dart';
import '../../modules/products/presentation/views/product_detail_view.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ProductDetailView(product: product);
  }
}
