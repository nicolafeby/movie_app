import 'package:json_annotation/json_annotation.dart';
part 'request_add_movie_model.g.dart';

@JsonSerializable()
class RequestAddMovieModel {
  final String? title;
  final String? description;
  final String? poster;

  RequestAddMovieModel({
    this.title,
    this.description,
    this.poster,
  });

  factory RequestAddMovieModel.fromJson(Map<String, dynamic> json) =>
      _$RequestAddMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestAddMovieModelToJson(this);
}
