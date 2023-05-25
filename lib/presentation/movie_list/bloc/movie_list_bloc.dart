import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/argument/request_movie_list_arg.dart';
import 'package:movie_app/core/models/requests/request_movie_list_model.dart';
import 'package:movie_app/domain/movie_list/entities/movie_list_entities.dart';
import 'package:movie_app/domain/movie_list/usecases/movie_list_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc({
    required this.usecase,
  }) : super(MovieListInitial()) {
    on<MovieListStarted>(_onMovieListStarted);
    on<MovieListInitialStarted>((event, emit) => MovieListInitial());
  }

  int page = 1;
  int size = 10;
  final MovieListUsecase usecase;

  final BehaviorSubject<bool> _isLoadMore = BehaviorSubject.seeded(false);

  Stream<bool> get isLoadMoreStream => _isLoadMore.stream;

  bool get isLoadMore => _isLoadMore.value;

  _onMovieListStarted(
      MovieListStarted event, Emitter<MovieListState> emit) async {
    final currentState = state;

    if (currentState is MovieListInitial) {
      emit(MovieListInProgress());
      emit(await _onMovieListInitialStarted(event));
    } else if (currentState is MovieListLoadInSuccess) {
      if (!currentState.hasReachedMax) {
        emit(await _onMovieListStartedLoadMore(event));
      }
    }
  }

  _onMovieListStartedLoadMore(MovieListStarted event) async {
    _isLoadMore.add(true);
    final currentState = state as MovieListLoadInSuccess;

    final params = RequestMovieListModel(
      page: page++,
      size: size,
    );

    final resp = await usecase.call(params);

    final updateState = resp.fold(
      (l) => MovieListLoadInFailure(),
      (r) => MovieListLoadInSuccess(
        entities: currentState.entities + (r.data ?? []),
        hasReachedMax: false,
      ),
    );

    _isLoadMore.add(false);
    return updateState;
  }

  _onMovieListInitialStarted(MovieListStarted event) async {
    final params = RequestMovieListModel(
      page: event.arg?.page,
      size: size,
    );

    final resp = await usecase.call(params);

    final updateState = resp.fold(
      (l) => MovieListLoadInFailure(),
      (r) => MovieListLoadInSuccess(
        entities: r.data ?? [],
        hasReachedMax: r.data?.isEmpty ?? true,
      ),
    );

    return updateState;
  }
}
