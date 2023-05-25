// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_add_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAddMovieModel _$RequestAddMovieModelFromJson(
        Map<String, dynamic> json) =>
    RequestAddMovieModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      poster: json['poster'] as String?,
    );

Map<String, dynamic> _$RequestAddMovieModelToJson(
        RequestAddMovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'poster': instance.poster,
    };
