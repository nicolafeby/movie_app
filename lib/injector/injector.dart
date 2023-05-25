

import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/api_service.dart';
import 'package:movie_app/data/add_movie/datasources/add_movie_remote_datasource.dart';
import 'package:movie_app/data/add_movie/repositories/add_movie_repository_impl.dart';
import 'package:movie_app/data/movie_list/datasources/movie_list_remote_datasource.dart';
import 'package:movie_app/data/movie_list/repositories/movie_list_repository_impl.dart';
import 'package:movie_app/domain/add_movie/repositories/add_movie_repository.dart';
import 'package:movie_app/domain/add_movie/usecases/add_movie_usecase.dart';
import 'package:movie_app/domain/movie_list/repositories/movie_list_repository.dart';
import 'package:movie_app/domain/movie_list/usecases/movie_list_usecase.dart';
import 'package:movie_app/presentation/add_movie/bloc/add_movie_bloc.dart';
import 'package:movie_app/presentation/movie_list/bloc/movie_list_bloc.dart';

part 'bloc/bloc_injector.dart';
part 'datasource/datasource_injector.dart';
part 'common/common_injector.dart';
part 'repository/repository_injector.dart';
part 'usecase/usecase_injector.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await BlocInjector.configureBlocInjector();
  await DataSourceInjector.configureDataSourceInjector();
  await HelperInjector.configureHelperInjector();
  await RepositoryInjector.configureRepositoryInjector();
  await UsecaseInjector.configureUsecaseInjector();
}
