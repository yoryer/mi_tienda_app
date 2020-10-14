import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/movie_model.dart';

abstract class TmdbRemoteDataSource {
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> searchMovies(String query);
}

class TmdbRemoteDataSourceImpl implements TmdbRemoteDataSource {
  final http.Client client;
  final AppConfig appConfig;

  TmdbRemoteDataSourceImpl({
    @required this.client,
    @required this.appConfig,
  });

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final tmdbApiKey = await appConfig.getTmdbApiKey();
    final url =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$tmdbApiKey&language=es&page=1&include_adult=false';

    final http.Response response = await client.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      List movieList = jsonData['results'];
      return movieList.map((e) => MovieModel.fromJson(e)).toList();
    }

    throw ServerException();
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final tmdbApiKey = await appConfig.getTmdbApiKey();
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$tmdbApiKey&language=es&query=$query&page=1&include_adult=false';

    final http.Response response = await client.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      List movieList = jsonData['results'];
      return movieList.map((e) => MovieModel.fromJson(e)).toList();
    }

    throw ServerException();
  }
}
