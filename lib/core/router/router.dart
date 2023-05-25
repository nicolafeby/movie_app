import 'package:flutter/material.dart';
import 'package:movie_app/core/router/router_constant.dart';
import 'package:movie_app/presentation/add_movie/page/add_movie_page.dart';
import 'package:movie_app/presentation/detail_movie/page/detail_movie_page.dart';
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
        return const AddMoviePage();
      case RouterConstant.detailMovie:
        return const DetailMoviePage();
      default:
        return const MovieListPage();
    }
  }

  Route? generateAppRoutes(RouteSettings settings) {
    Widget getRoutedWidget = getPageRoute(settings);
    return generateRouter(getRoutedWidget, settings);
  }
}
