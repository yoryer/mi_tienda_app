import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/alerts/common_alert.dart';
import '../../domain/entities/product.dart';
import '../bloc/cart_bloc.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  ProductDetailView({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(product.name),
          ),
          body: ListView(
            padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
            children: [
              Row(
                children: [
                  Image.network(
                    product.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Precio: G. ${product.price.toInt()}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 12),
                          RaisedButton(
                            child: Text(
                              'Agregar al carrito',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {
                              context.bloc<CartBloc>().add(AddOne(product: product));
                              showDialog<void>(
                                context: context,
                                builder: (_) => CommonAlert(
                                  message: 'Producto agregado al carrito!',
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
