part of 'add_movie_bloc.dart';

abstract class AddMovieState extends Equatable {
  const AddMovieState();

  @override
  List<Object> get props => [];
}

class AddMovieInProgress extends AddMovieState {}

class AddMovieLoadInSuccess extends AddMovieState {
  const AddMovieLoadInSuccess({required this.entities});

  final AddMovieEntities entities;

  @override
  List<Object> get props => [entities];
}

class AddMovieLoadInFailure extends AddMovieState {}
