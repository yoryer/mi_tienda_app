import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetFeaturedProducts implements UseCase<List<Product>, NoParams> {
  final ProductRepository productRepository;

  GetFeaturedProducts({
    @required this.productRepository,
  });

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await productRepository.featuredProducts();
  }
}
