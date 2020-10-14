import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mi_tienda_app/core/widgets/alerts/common_alert.dart';
import 'package:mi_tienda_app/modules/products/presentation/bloc/cart_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../injection_container.dart';
import '../bloc/payment_bloc.dart';

class PaymentView extends StatelessWidget {
  final String id;
  final String label;
  final double amount;

  PaymentView({
    @required this.id,
    @required this.label,
    @required this.amount,
  });

  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentBloc>(),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            if (state is Empty) {
              context.bloc<PaymentBloc>().add(RequestToPay(
                    id: id,
                    label: label,
                    amount: amount,
                  ));
            }

            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is Loaded) {
              return WebView(
                initialUrl: state.paymentUrl.url,
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                onWebViewCreated: (controller) => _controller = controller,
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.startsWith('http://localhost/retorno')) {
                    var uri = Uri.parse(request.url);
                    if (uri.queryParameters.containsKey('intent') &&
                        uri.queryParameters.containsKey('app') &&
                        uri.queryParameters.containsKey('type') &&
                        uri.queryParameters.containsKey('doc_id')) {
                      context.bloc<CartBloc>().add(ClearCart());
                      Navigator.of(context).pop();
                    }
                  }
                  return NavigationDecision.navigate;
                },
              );
            }

            if (state is Error) {
              return Center(child: Text(state.message));
            }

            return SizedBox(width: 0, height: 0);
          },
        ),
      ),
    );
  }
}
