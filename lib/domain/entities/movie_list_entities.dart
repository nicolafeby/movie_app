import 'package:json_annotation/json_annotation.dart';

class MovieListEntities {
  String? status;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<DataEntities>? data;
  String? info;

  MovieListEntities({
    this.status,
    this.data,
    this.info,
  });
}

class DataEntities {
  int? id;
  String? title;
  String? description;
  String? poster;
  DateTime? createdDate;

  DataEntities({
    this.id,
    this.title,
    this.description,
    this.poster,
    this.createdDate,
  });
}
