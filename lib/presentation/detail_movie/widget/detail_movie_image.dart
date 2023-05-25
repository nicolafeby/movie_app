import 'package:flutter/material.dart';
import 'package:movie_app/core/widget/custom_network_image.dart';

class DetailMovieImage extends StatelessWidget {
  const DetailMovieImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CustomNetworkImage(
          imageUrl: image,
        ),
        // child: CachedNetworkImage(
        //   fit: BoxFit.cover,
        //   width: 200.0,
        //   imageUrl: image,
        // ),
      ),
    );
  }
}
