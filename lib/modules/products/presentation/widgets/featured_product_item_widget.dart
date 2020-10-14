import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;

import '../../../../app/routes/router.gr.dart';
import '../../domain/entities/product.dart';

class FeaturedProductItemWidget extends StatelessWidget {
  final Product product;

  FeaturedProductItemWidget({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ExtendedNavigator.of(context).push(
          Routes.product_detail_page,
          arguments: ProductDetailPageArguments(
            product: product,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(6, 6, 6, 12),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 4),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Precio: G. ${product.price.toInt()}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
