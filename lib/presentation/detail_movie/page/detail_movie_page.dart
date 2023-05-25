import 'package:flutter/material.dart';
import 'package:movie_app/core/widget/custom_appbar.dart';
import 'package:movie_app/presentation/detail_movie/widget/detail_movie_image.dart';
import 'package:movie_app/presentation/detail_movie/widget/detail_movie_information.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

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
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailMovieImage(),
          SizedBox(height: 16.0),
          DetailMovieInformation(),
        ],
      ),
    );
  }
}
