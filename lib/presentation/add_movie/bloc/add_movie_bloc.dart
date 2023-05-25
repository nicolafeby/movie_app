import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/helper/validator_helper.dart';
import 'package:movie_app/core/models/requests/request_add_movie_model.dart';
import 'package:movie_app/domain/add_movie/entities/add_movie_entities.dart';
import 'package:movie_app/domain/add_movie/usecases/add_movie_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'add_movie_event.dart';
part 'add_movie_state.dart';

class AddMovieBloc extends Bloc<AddMovieEvent, AddMovieState> {
  AddMovieBloc({
    required this.usecase,
  }) : super(AddMovieInProgress()) {
    on<AddMovieStarted>(_onAddMovieStarted);
  }

  final AddMovieUsecase usecase;

  final _descController = BehaviorSubject<String>();
  final _movieImageController = BehaviorSubject<String>();
  final _titleController = BehaviorSubject<String>();

  changeMovieImage(String event) => _movieImageController.sink.add(event);
  changeTitle(String event) => _titleController.sink.add(event);
  changeDesc(String event) => _descController.sink.add(event);

  Stream<String> get imageStream =>
      _movieImageController.stream.transform(ValidatorHelper.validateRequired);
  Stream<String> get titleStream =>
      _titleController.stream.transform(ValidatorHelper.validateRequired);
  Stream<String> get descStream =>
      _descController.stream.transform(ValidatorHelper.validateRequired);

  String get image => _movieImageController.value;
  String get title => _titleController.value;
  String get desc => _descController.value;

  Stream<bool> get isAllSubmited => CombineLatestStream.combine3(
        imageStream,
        titleStream,
        descStream,
        (a, b, c) {
          if (a == image && b == title && c == desc) {
            return true;
          }
          return false;
        },
      );

  void dispose() {
    _movieImageController.close();
    _titleController.close();
    _descController.close();
  }

  _onAddMovieStarted(
    AddMovieStarted event,
    Emitter<AddMovieState> emit,
  ) async {
    emit(AddMovieInProgress());
    final params = RequestAddMovieModel(
      description: desc,
      poster: image,
      title: title,
    );

    final resp = await usecase.call(params);

    final updateState = resp.fold(
      (l) => AddMovieLoadInFailure(),
      (r) => AddMovieLoadInSuccess(entities: r),
    );

    emit(updateState);
  }
}
