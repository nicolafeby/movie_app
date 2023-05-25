import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailMovieImage extends StatelessWidget {
  final String image;
  const DetailMovieImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: 200.0,
          imageUrl: image,
        ),
      ),
    );
  }
}
