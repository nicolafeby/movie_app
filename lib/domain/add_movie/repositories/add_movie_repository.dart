import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/models/requests/request_add_movie_model.dart';
import 'package:movie_app/domain/add_movie/entities/add_movie_entities.dart';

abstract class AddMovieRepository {
  Future<Either<Failures, AddMovieEntities>> postAddMovie(
      RequestAddMovieModel params);
}
