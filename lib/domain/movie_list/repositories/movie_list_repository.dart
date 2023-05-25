import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/models/requests/request_movie_list_model.dart';
import 'package:movie_app/domain/movie_list/entities/movie_list_entities.dart';

abstract class MovieListRepository {
  Future<Either<Failures, MovieListEntities>> getMovieList(
      RequestMovieListModel params);
}
