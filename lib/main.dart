import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/routes/router.gr.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'modules/products/presentation/bloc/cart_bloc.dart';
import 'modules/products/presentation/bloc/featured_products_bloc.dart';
import 'modules/products/presentation/bloc/search_products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CartBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<FeaturedProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchProductsBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Mi Tienda App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: LoginFormView(),
        initialRoute: "/",
        builder: ExtendedNavigator.builder<Router>(router: Router()),
        onGenerateRoute: Router(),
      ),
    );

    // return ;
  }
}
