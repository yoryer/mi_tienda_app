import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/routes/router.gr.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_item_widget.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: (state.products != null ? state.products.length : 0) > 0
                  ? ListView.builder(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      itemCount: state.products != null ? state.products.length : 0,
                      itemBuilder: (context, index) => CartItemWidget(
                        product: state.products.keys.elementAt(index),
                        quantity: state.products.values.elementAt(index),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Su carrito está vacío!\n\nVaya a la pantalla de búsqueda para encontrar productos de su interés.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 12, 16, 12),
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total de productos: ${state.totalProducts ?? 0}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'TOTAL A PAGAR: ${(state.totalToPay ?? 0).toInt()}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  RaisedButton(
                    child: Text(
                      'Procesar pago',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blueGrey,
                    onPressed: state.totalProducts != null && state.totalProducts > 0
                        ? () {
                            ExtendedNavigator.of(context).push(
                              Routes.payment_page,
                              arguments: PaymentPageArguments(
                                paymentId: Uuid().v4(),
                                paymentLabel: 'Mi carrito',
                                paymentAmount: state.totalToPay,
                              ),
                            );
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
