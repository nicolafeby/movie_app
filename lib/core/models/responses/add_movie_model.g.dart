// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMovieModel _$AddMovieModelFromJson(Map<String, dynamic> json) =>
    AddMovieModel(
      status: json['status'] as String?,
      data: json['data'] as String?,
      info: json['info'] as String?,
    );

Map<String, dynamic> _$AddMovieModelToJson(AddMovieModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'info': instance.info,
    };
