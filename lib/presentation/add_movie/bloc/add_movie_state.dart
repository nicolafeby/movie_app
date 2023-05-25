part of 'add_movie_bloc.dart';

abstract class AddMovieState extends Equatable {
  const AddMovieState();
  
  @override
  List<Object> get props => [];
}

class AddMovieInitial extends AddMovieState {}
