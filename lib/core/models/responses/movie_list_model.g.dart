// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) =>
    MovieListModel(
      status: json['status'] as String?,
      dataModel: (json['data'] as List<dynamic>?)
          ?.map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: json['info'] as String?,
    );

Map<String, dynamic> _$MovieListModelToJson(MovieListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'info': instance.info,
      'data': instance.dataModel,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      poster: json['poster'] as String?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'poster': instance.poster,
      'createdDate': instance.createdDate?.toIso8601String(),
    };
