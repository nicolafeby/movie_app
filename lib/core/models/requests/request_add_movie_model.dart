import 'package:json_annotation/json_annotation.dart';
part 'request_add_movie_model.g.dart';

@JsonSerializable()
class RequestAddMovieModel {
  RequestAddMovieModel({
    this.title,
    this.description,
    this.poster,
  });

  factory RequestAddMovieModel.fromJson(Map<String, dynamic> json) =>
      _$RequestAddMovieModelFromJson(json);

  final String? description;
  final String? poster;
  final String? title;

  Map<String, dynamic> toJson() => _$RequestAddMovieModelToJson(this);
}
