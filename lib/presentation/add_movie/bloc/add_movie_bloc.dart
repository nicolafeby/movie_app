import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_movie_event.dart';
part 'add_movie_state.dart';

class AddMovieBloc extends Bloc<AddMovieEvent, AddMovieState> {
  AddMovieBloc() : super(AddMovieInitial()) {
    on<AddMovieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
