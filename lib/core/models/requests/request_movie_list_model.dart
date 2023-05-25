import 'package:json_annotation/json_annotation.dart';
part 'request_movie_list_model.g.dart';

@JsonSerializable()
class RequestMovieListModel {
  final int? page;
  final int? size;

  RequestMovieListModel({
    this.page,
    this.size,
  });

  factory RequestMovieListModel.fromJson(Map<String, dynamic> json) =>
      _$RequestMovieListModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestMovieListModelToJson(this);
}
