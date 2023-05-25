import 'package:flutter/material.dart';

class DetailMovieInformation extends StatelessWidget {
  const DetailMovieInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SizedBox(height: 8.0),
        _buildReleaseDate(context),
        const SizedBox(height: 8.0),
        _buildDescriotion(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'title',
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.w700),
    );
  }

  Widget _buildReleaseDate(BuildContext context) {
    return Text(
      'Release date ',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget _buildDescriotion(BuildContext context) {
    return Text(
      'description',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
