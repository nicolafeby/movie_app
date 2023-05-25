import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailMovieImage extends StatelessWidget {
  const DetailMovieImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          height: 200.0,
          width: 200.0,
          imageUrl: 'https://dummyimage.com/600x400/000/fff',
        ),
      ),
    );
  }
}
