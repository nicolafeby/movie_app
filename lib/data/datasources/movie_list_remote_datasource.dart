import 'package:movie_app/core/models/requests/request_movie_list_model.dart';
import 'package:movie_app/core/network/api_service.dart';
import 'package:movie_app/domain/entities/movie_list_entities.dart';

abstract class MovieListRemoteDataSource {
  Future<MovieListEntities> getMovieList(RequestMovieListModel params);
}

class MovieListRemoteDataSourceImpl implements MovieListRemoteDataSource {
  final ApiService apiService;

  MovieListRemoteDataSourceImpl({required this.apiService});
  @override
  Future<MovieListEntities> getMovieList(
    RequestMovieListModel params,
  ) async {
    final resp = apiService.getMovieList(params);
    return resp;
  }
}
