import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/argument/request_movie_list_arg.dart';
import 'package:movie_app/core/router/router_constant.dart';
import 'package:movie_app/core/widget/custom_appbar.dart';
import 'package:movie_app/presentation/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app/presentation/movie_list/widget/movie_drawer.dart';
import 'package:movie_app/presentation/movie_list/widget/movie_floating_button.dart';
import 'package:movie_app/presentation/movie_list/widget/movie_list.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late MovieListBloc _bloc;

  bool _onNotificationHandle(ScrollEndNotification notification) {
    if (notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - 350) {
      _bloc.add(const MovieListStarted());
      log('scroll');
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.add(MovieListInitialStarted());
    _bloc.add(
      const MovieListStarted(
        arg: RequestMovieListArg(page: 1, size: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) => _onNotificationHandle(notification),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const MovieDrawer(),
        appBar: _buildAppbar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: () => _scaffoldKey.currentState?.openDrawer(),
        child: const Icon(Icons.menu, color: Colors.black),
      ),
      title: Text(
        'Movies',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<MovieListBloc, MovieListState>(
      builder: (context, state) {
        if (state is MovieListInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieListInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieListLoadInFailure) {
          return const Center(
            child: Text('Error getting data'),
          );
        }

        (state as MovieListLoadInSuccess);
        return MovieList(entities: state.entities);
      },
    );
  }

  Widget _buildFloatingButton() {
    return MovieFloatingButton(
      onTap: () => Navigator.pushNamed(context, RouterConstant.addMovie),
    );
  }
}
