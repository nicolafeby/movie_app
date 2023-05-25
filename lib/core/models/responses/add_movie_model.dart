import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/add_movie/entities/add_movie_entities.dart';

part 'add_movie_model.g.dart';

@JsonSerializable()
class AddMovieModel extends AddMovieEntities {
  AddMovieModel({
    required String? status,
    required String? data,
    required String? info,
  }) : super(
          status: status,
          data: data,
          info: info,
        );

  factory AddMovieModel.fromJson(Map<String, dynamic> json) =>
      _$AddMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddMovieModelToJson(this);
}
