import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/config/app_config.dart';
import 'modules/auth/data/repositories/user_repository_impl.dart';
import 'modules/auth/domain/repositories/user_repository.dart';
import 'modules/auth/domain/usecases/login.dart';
import 'modules/auth/presentation/bloc/login_form_bloc.dart';
import 'modules/payments/data/datasources/adamspay_remote_data_source.dart';
import 'modules/payments/data/repositories/payment_repository_impl.dart';
import 'modules/payments/domain/repositories/payment_repository.dart';
import 'modules/payments/domain/usecases/pay_through_external_url.dart';
import 'modules/payments/presentation/bloc/payment_bloc.dart';
import 'modules/products/data/datasources/tmdb_remote_data_source.dart';
import 'modules/products/data/repositories/product_repository_impl.dart';
import 'modules/products/domain/repositories/product_repository.dart';
import 'modules/products/domain/usecases/get_featured_products.dart';
import 'modules/products/domain/usecases/search_products.dart';
import 'modules/products/presentation/bloc/cart_bloc.dart';
import 'modules/products/presentation/bloc/featured_products_bloc.dart';
import 'modules/products/presentation/bloc/search_products_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory(
    () => LoginFormBloc(login: sl()),
  );

  sl.registerFactory(
    () => FeaturedProductsBloc(
      getFeaturedProducts: sl(),
    ),
  );

  sl.registerFactory(
    () => SearchProductsBloc(
      searchProducts: sl(),
    ),
  );

  sl.registerFactory(() => CartBloc());

  sl.registerFactory(
    () => PaymentBloc(
      payThroughExternalUrl: sl(),
    ),
  );

  //! Use cases
  sl.registerLazySingleton(() => Login(userRepository: sl()));
  sl.registerLazySingleton(() => GetFeaturedProducts(productRepository: sl()));
  sl.registerLazySingleton(() => SearchProducts(productRepository: sl()));
  sl.registerLazySingleton(() => PayThroughExternalUrl(paymentRepository: sl()));

  //! Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(tmdbRemoteDataSource: sl()));
  sl.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl(adamsPayRemoteDataSource: sl()));

  //! Data Sources
  sl.registerLazySingleton<TmdbRemoteDataSource>(
    () => TmdbRemoteDataSourceImpl(
      client: sl(),
      appConfig: sl(),
    ),
  );

  sl.registerLazySingleton<AdamsPayRemoteDataSource>(
    () => AdamsPayRemoteDataSourceImpl(
      appConfig: sl(),
      client: sl(),
    ),
  );

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<AppConfig>(() => AppConfigImpl());
}
