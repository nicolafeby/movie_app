import 'package:flutter/material.dart';
import 'package:movie_app/core/extension/extension.dart';

class DetailMovieInformation extends StatelessWidget {
  final String title;
  final String desc;
  final DateTime releaseDate;
  const DetailMovieInformation({
    super.key,
    required this.title,
    required this.desc,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        const SizedBox(height: 4.0),
        _buildReleaseDate(context),
        const SizedBox(height: 12.0),
        _buildDescriotion(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 22.0),
    );
  }

  Widget _buildReleaseDate(BuildContext context) {
    return Text(
      'Release date ${releaseDate.toFormattedDate()}',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildDescriotion(BuildContext context) {
    return Text(
      desc,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
