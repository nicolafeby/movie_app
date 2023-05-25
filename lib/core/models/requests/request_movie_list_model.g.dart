// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestMovieListModel _$RequestMovieListModelFromJson(
        Map<String, dynamic> json) =>
    RequestMovieListModel(
      page: json['page'] as int?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$RequestMovieListModelToJson(
        RequestMovieListModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };
