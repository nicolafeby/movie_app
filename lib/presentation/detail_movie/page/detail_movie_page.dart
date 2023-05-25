import 'package:flutter/material.dart';
import 'package:movie_app/core/argument/detail_movie_arg.dart';
import 'package:movie_app/core/widget/custom_appbar.dart';
import 'package:movie_app/presentation/detail_movie/widget/detail_movie_image.dart';
import 'package:movie_app/presentation/detail_movie/widget/detail_movie_information.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key, required this.arg});

  final DetailMovieArg arg;

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      title: Text(
        'Detail Movie',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _buildBody() {
    final data = arg.entities;
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        DetailMovieImage(
          image:
              arg.entities.poster ?? 'https://dummyimage.com/600x400/000/fff',
        ),
        const SizedBox(height: 16.0),
        DetailMovieInformation(
          title: data.title ?? '',
          desc: data.description ?? '',
          releaseDate: data.createdDate ?? '' as DateTime,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }
}
