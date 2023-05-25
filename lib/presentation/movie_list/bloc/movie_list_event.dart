part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object?> get props => [];
}

class MovieListStarted extends MovieListEvent {
  const MovieListStarted({this.arg});

  final RequestMovieListArg? arg;

  @override
  List<Object?> get props => [arg];
}

class MovieListInitialStarted extends MovieListEvent {}
