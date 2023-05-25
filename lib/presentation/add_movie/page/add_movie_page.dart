import 'package:flutter/material.dart';
import 'package:movie_app/core/widget/custom_appbar.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      title: Text(
        'Movies',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
