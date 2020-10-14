// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../modules/products/domain/entities/product.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/payment_page.dart';
import '../pages/product_detail_page.dart';

class Routes {
  static const String login_page = '/';
  static const String home_page = '/home-page';
  static const String product_detail_page = '/product-detail-page';
  static const String payment_page = '/payment-page';
  static const all = <String>{
    login_page,
    home_page,
    product_detail_page,
    payment_page,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.login_page, page: LoginPage),
    RouteDef(Routes.home_page, page: HomePage),
    RouteDef(Routes.product_detail_page, page: ProductDetailPage),
    RouteDef(Routes.payment_page, page: PaymentPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    ProductDetailPage: (data) {
      final args = data.getArgs<ProductDetailPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductDetailPage(product: args.product),
        settings: data,
      );
    },
    PaymentPage: (data) {
      final args = data.getArgs<PaymentPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PaymentPage(
          paymentId: args.paymentId,
          paymentLabel: args.paymentLabel,
          paymentAmount: args.paymentAmount,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProductDetailPage arguments holder class
class ProductDetailPageArguments {
  final Product product;
  ProductDetailPageArguments({@required this.product});
}

/// PaymentPage arguments holder class
class PaymentPageArguments {
  final String paymentId;
  final String paymentLabel;
  final double paymentAmount;
  PaymentPageArguments(
      {@required this.paymentId,
      @required this.paymentLabel,
      @required this.paymentAmount});
}
