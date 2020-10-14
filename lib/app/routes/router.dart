import 'package:auto_route/auto_route_annotations.dart';
import '../pages/payment_page.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/product_detail_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      initial: true,
      page: LoginPage,
      name: 'login_page',
    ),
    MaterialRoute(
      page: HomePage,
      name: 'home_page',
    ),
    MaterialRoute(
      page: ProductDetailPage,
      name: 'product_detail_page',
    ),
    MaterialRoute(
      page: PaymentPage,
      name: 'payment_page',
    ),
  ],
)
class $Router {}
