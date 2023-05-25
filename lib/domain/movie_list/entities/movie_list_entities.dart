import 'package:json_annotation/json_annotation.dart';

class MovieListEntities {
  MovieListEntities({
    this.status,
    this.data,
    this.info,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<DataEntities>? data;

  String? info;
  String? status;
}

class DataEntities {
  DataEntities({
    this.id,
    this.title,
    this.description,
    this.poster,
    this.createdDate,
  });

  DateTime? createdDate;
  String? description;
  int? id;
  String? poster;
  String? title;
}
