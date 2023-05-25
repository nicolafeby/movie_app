import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/models/requests/request_movie_list_model.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/domain/movie_list/entities/movie_list_entities.dart';
import 'package:movie_app/domain/movie_list/repositories/movie_list_repository.dart';

class MovieListUsecase
    implements Usecase<MovieListEntities, RequestMovieListModel> {
  MovieListRepository repository;
  MovieListUsecase({required this.repository});
  @override
  Future<Either<Failures, MovieListEntities>> call(
      RequestMovieListModel params) async {
    return repository.getMovieList(params);
  }
}
