part of '../injector.dart';

class RepositoryInjector {
  static Future<void> configureRepositoryInjector() async {
    sl.registerLazySingleton<MovieListRepository>(
        () => MovieListRepositoryImpl(remoteDataSource: sl()));
    sl.registerLazySingleton<AddMovieRepository>(
        () => AddMovieRepositoryImpl(remoteDataSource: sl()));
  }
}
