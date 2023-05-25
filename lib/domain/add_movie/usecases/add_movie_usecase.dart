import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/models/requests/request_add_movie_model.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/domain/add_movie/entities/add_movie_entities.dart';
import 'package:movie_app/domain/add_movie/repositories/add_movie_repository.dart';


class AddMovieUsecase
    implements Usecase<AddMovieEntities, RequestAddMovieModel> {
  AddMovieUsecase({required this.repository});

  AddMovieRepository repository;

  @override
  Future<Either<Failures, AddMovieEntities>> call(
      RequestAddMovieModel params) async {
    return repository.postAddMovie(params);
  }
}
