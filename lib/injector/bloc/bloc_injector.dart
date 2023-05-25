part of '../injector.dart';

class BlocInjector {
  static Future<void> configureBlocInjector() async {
    sl.registerFactory(() => MovieListBloc(usecase: sl()));
  }
}
