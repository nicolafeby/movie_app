import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/argument/detail_movie_arg.dart';
import 'package:movie_app/core/router/router_constant.dart';
import 'package:movie_app/injector/injector.dart';
import 'package:movie_app/presentation/add_movie/bloc/add_movie_bloc.dart';
import 'package:movie_app/presentation/add_movie/page/add_movie_page.dart';
import 'package:movie_app/presentation/detail_movie/page/detail_movie_page.dart';
import 'package:movie_app/presentation/movie_list/bloc/movie_list_bloc.dart';
import 'package:movie_app/presentation/movie_list/page/movie_list_page.dart';

class Router {
  Route generateRouter(Widget page, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => getPageRoute(settings),
    );
  }

  Widget getPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstant.addMovie:
        return BlocProvider(
          create: (context) => sl<AddMovieBloc>(),
          child: const AddMoviePage(),
        );
      case RouterConstant.detailMovie:
        return DetailMoviePage(arg: settings.arguments as DetailMovieArg);
      default:
        return BlocProvider(
          create: (context) => sl<MovieListBloc>(),
          child: const MovieListPage(),
        );
    }
  }

  Route? generateAppRoutes(RouteSettings settings) {
    Widget getRoutedWidget = getPageRoute(settings);
    return generateRouter(getRoutedWidget, settings);
  }
}
