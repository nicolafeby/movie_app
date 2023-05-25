import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failures.dart';
import 'package:movie_app/core/models/requests/request_movie_list_model.dart';
import 'package:movie_app/data/movie_list/datasources/movie_list_remote_datasource.dart';
import 'package:movie_app/domain/movie_list/entities/movie_list_entities.dart';
import 'package:movie_app/domain/movie_list/repositories/movie_list_repository.dart';

class MovieListRepositoryImpl implements MovieListRepository {
  MovieListRepositoryImpl({required this.remoteDataSource});

  final MovieListRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failures, MovieListEntities>> getMovieList(
    RequestMovieListModel params,
  ) async {
    try {
      final resp = await remoteDataSource.getMovieList(params);
      if (resp.status == 'success') return Right(resp);
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
