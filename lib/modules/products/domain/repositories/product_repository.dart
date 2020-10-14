import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> featuredProducts();
  Future<Either<Failure, List<Product>>> searchProduct(String query);
}
