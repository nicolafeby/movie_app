part of '../injector.dart';

class DataSourceInjector {
  static Future<void> configureDataSourceInjector() async {
    sl.registerLazySingleton<MovieListRemoteDataSource>(
        () => MovieListRemoteDataSourceImpl(apiService: sl()));
    sl.registerLazySingleton<AddMovieRemoteDataSource>(
        () => AddMovieRemoteDataSourceImpl(apiService: sl()));
  }
}
