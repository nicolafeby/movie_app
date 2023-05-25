part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListInitial extends MovieListState {}

class MovieListInProgress extends MovieListState {}

class MovieListLoadInSuccess extends MovieListState {
  final List<DataEntities> entities;
  final bool hasReachedMax;

  const MovieListLoadInSuccess({
    required this.entities,
    required this.hasReachedMax,
  });

  MovieListLoadInSuccess copyWith({
    List<DataEntities>? entities,
    bool? hasReachedMax,
  }) {
    return MovieListLoadInSuccess(
      entities: entities ?? this.entities,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [entities, hasReachedMax];
}

class MovieListLoadInFailure extends MovieListState {}
