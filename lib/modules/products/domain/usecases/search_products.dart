import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class SearchProducts implements UseCase<List<Product>, Params> {
  final ProductRepository productRepository;

  SearchProducts({
    @required this.productRepository,
  });

  @override
  Future<Either<Failure, List<Product>>> call(params) async {
    return await productRepository.searchProduct(params.query);
  }
}

class Params extends Equatable {
  final String query;

  Params({
    @required this.query,
  });

  @override
  List<Object> get props => [query];
}
