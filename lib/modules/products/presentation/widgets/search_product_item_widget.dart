import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/routes/router.gr.dart';
import '../../domain/entities/product.dart';

class SearchProductItemWidget extends StatelessWidget {
  final Product product;

  SearchProductItemWidget({
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
        padding: EdgeInsets.only(top: 8, bottom: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.blueGrey,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Precio: G. ${product.price.toInt()}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
