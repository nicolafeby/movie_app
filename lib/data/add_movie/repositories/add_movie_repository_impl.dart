import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/models/requests/request_add_movie_model.dart';
import 'package:movie_app/data/add_movie/datasources/add_movie_remote_datasource.dart';
import 'package:movie_app/domain/add_movie/entities/add_movie_entities.dart';
import 'package:movie_app/domain/add_movie/repositories/add_movie_repository.dart';

class AddMovieRepositoryImpl implements AddMovieRepository {
  final AddMovieRemoteDataSource remoteDataSource;

  AddMovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, AddMovieEntities>> postAddMovie(
    RequestAddMovieModel params,
  ) async {
    try {
      final resp = await remoteDataSource.postAddMovie(params);
      if (resp.status == 'success') return Right(resp);
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
