import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/movie_list/entities/movie_list_entities.dart';
part 'movie_list_model.g.dart';

@JsonSerializable()
class MovieListModel extends MovieListEntities {
  @JsonKey(name: 'data')
  final List<DataModel>? dataModel;

  MovieListModel({
    required String? status,
    required this.dataModel,
    required String? info,
  }) : super(
          status: status,
          data: dataModel,
          info: info,
        );

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListModelToJson(this);
}

@JsonSerializable()
class DataModel extends DataEntities {
  DataModel({
    required int? id,
    required String? title,
    required String? description,
    required String? poster,
    required DateTime? createdDate,
  }) : super(
          id: id,
          title: title,
          description: description,
          poster: poster,
          createdDate: createdDate,
        );

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
