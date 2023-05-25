import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/models/requests/request_movie_list_model.dart';
import 'package:movie_app/core/models/responses/movie_list_model.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/domain/entities/movie_list_entities.dart';

class ApiService with DioMixin implements Dio {
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  Interceptors get interceptors => Interceptors()
    ..add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      request: true,
      requestHeader: true,
      responseHeader: true,
    ));
  // ..add(InterceptorsWrapper(onRequest: (options, handler) async {
  //   options.headers.addAll(await userAgentClientHintsHeader());
  //   handler.next(options);
  //   return;
  // }));

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: AppConstant.baseUrl,
        contentType: 'application/json',
        responseType: ResponseType.json,
      );

  Future<MovieListEntities> getMovieList(RequestMovieListModel params) async {
    var response = await get('https://dlabs-test.irufano.com/api/movie',
        queryParameters: params.toJson());
    return MovieListModel.fromJson(response.data);
  }
}
