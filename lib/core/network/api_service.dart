import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/models/requests/request_add_movie_model.dart';
import 'package:movie_app/core/models/requests/request_movie_list_model.dart';
import 'package:movie_app/core/models/responses/add_movie_model.dart';
import 'package:movie_app/core/models/responses/movie_list_model.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/domain/add_movie/entities/add_movie_entities.dart';
import 'package:movie_app/domain/movie_list/entities/movie_list_entities.dart';

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
    var response = await get('${AppConstant.baseUrl}/movie',
        queryParameters: params.toJson());
    return MovieListModel.fromJson(response.data);
  }

  Future<AddMovieEntities> postAddMovie(RequestAddMovieModel params) async {
    final formData = FormData.fromMap(
      {
        'title': params.title,
        'description': params.description,
        'poster': await MultipartFile.fromFile(params.poster ?? ''),
      },
    );
    var response =
        await post('https://dlabs-test.irufano.com/api/movie', data: formData);
    return AddMovieModel.fromJson(response.data);
  }
}
