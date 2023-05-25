import 'package:flutter/material.dart';
import 'package:movie_app/core/router/router_constant.dart';
import 'package:movie_app/core/widget/custom_appbar.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MovieDrawer(),
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leading: InkWell(
        onTap: () => _scaffoldKey.currentState?.openDrawer(),
        child: const Icon(Icons.menu, color: Colors.black),
      ),
      title: Text(
        'Movies',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildBody() {
    return const MovieList();
  }

  Widget _buildFloatingButton() {
    return MovieFloatingButton(
      onTap: () => Navigator.pushNamed(context, RouterConstant.addMovie),
    );
  }
}
