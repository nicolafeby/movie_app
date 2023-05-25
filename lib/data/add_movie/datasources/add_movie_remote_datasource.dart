import 'package:movie_app/core/models/requests/request_add_movie_model.dart';
import 'package:movie_app/core/network/api_service.dart';
import 'package:movie_app/domain/add_movie/entities/add_movie_entities.dart';

abstract class AddMovieRemoteDataSource {
  Future<AddMovieEntities> postAddMovie(RequestAddMovieModel params);
}

class AddMovieRemoteDataSourceImpl implements AddMovieRemoteDataSource {
  AddMovieRemoteDataSourceImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<AddMovieEntities> postAddMovie(
    RequestAddMovieModel params,
  ) async {
    final resp = apiService.postAddMovie(params);
    return resp;
  }
}
