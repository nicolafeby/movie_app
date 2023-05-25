part of 'add_movie_bloc.dart';

abstract class AddMovieEvent extends Equatable {
  const AddMovieEvent();

  @override
  List<Object> get props => [];
}

class AddMovieStarted extends AddMovieEvent {}
