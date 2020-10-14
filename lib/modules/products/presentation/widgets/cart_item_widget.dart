import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../bloc/cart_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final int quantity;

  CartItemWidget({
    @required this.product,
    @required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 2),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.blueGrey,
            style: BorderStyle.solid,
          ),
          right: BorderSide(
            width: 1,
            color: Colors.blueGrey,
            style: BorderStyle.solid,
          ),
          left: BorderSide(
            width: 3,
            color: Colors.blueGrey,
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            width: 3,
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
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Cantidad:',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 4),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () => quantity > 1 ? context.bloc<CartBloc>().add(RemoveOne(product: product)) : null,
                          child: Icon(
                            Icons.remove_circle,
                            size: 18,
                            color: quantity > 1 ? Colors.grey : Colors.grey[400],
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 4),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 4),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () => context.bloc<CartBloc>().add(AddOne(product: product)),
                          child: Icon(
                            Icons.add_circle,
                            size: 18,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  context.bloc<CartBloc>().add(RemoveFromCart(product: product));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 12, 8),
                  child: Icon(
                    Icons.remove_circle,
                    size: 32,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
