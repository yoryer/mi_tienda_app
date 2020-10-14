import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/tmdb_remote_data_source.dart';
import '../models/movie_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final TmdbRemoteDataSource tmdbRemoteDataSource;

  ProductRepositoryImpl({
    @required this.tmdbRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> featuredProducts() async {
    try {
      final List<MovieModel> movies = await tmdbRemoteDataSource.getTopRatedMovies();
      final List<Product> products = movies
          .map(
            (e) => Product(
              id: e.id.toString(),
              name: e.title,
              description: e.overview,
              imageUrl: e.posterPath != null
                  ? 'https://image.tmdb.org/t/p/w500${e.posterPath}'
                  : e.backdropPath != null
                      ? 'https://image.tmdb.org/t/p/w500${e.backdropPath}'
                      : 'https://image.freepik.com/free-vector/movie-time-cartoon-poster_1284-9179.jpg',
              price: e.voteAverage == 0 ? 50000 : (e.voteAverage * 10000).roundToDouble(),
            ),
          )
          .toList();
      return Right(products);
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProduct(String query) async {
    try {
      final List<MovieModel> movies = await tmdbRemoteDataSource.searchMovies(query);
      if (movies.length == 0) {
        return Left(NoSearchResultsFailure());
      }
      final List<Product> products = movies
          .map(
            (e) => Product(
              id: e.id.toString(),
              name: e.title,
              description: e.overview,
              imageUrl: e.posterPath != null
                  ? 'https://image.tmdb.org/t/p/w500${e.posterPath}'
                  : e.backdropPath != null
                      ? 'https://image.tmdb.org/t/p/w500${e.backdropPath}'
                      : 'https://image.freepik.com/free-vector/movie-time-cartoon-poster_1284-9179.jpg',
              price: e.voteAverage == 0 ? 50000 : (e.voteAverage * 10000).roundToDouble(),
            ),
          )
          .toList();
      return Right(products);
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
