part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object?> get props => [];
}

class MovieListStarted extends MovieListEvent {
  final RequestMovieListArg? arg;

  const MovieListStarted({this.arg});

  @override
  List<Object?> get props => [arg];
}

class MovieListInitialStarted extends MovieListEvent {}
