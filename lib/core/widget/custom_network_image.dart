import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.fit,
    this.height,
    this.width,
    super.key,
  });

  final BoxFit? fit;
  final double? height;
  final String? imageUrl;
  final double? width;

  Widget _buildEmptyImage() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Icon(Icons.broken_image),
    );
  }

  Widget _buildError() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Icon(Icons.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return _buildEmptyImage();

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
          ),
        );
      },
      errorWidget: (context, url, error) => _buildError(),
    );
  }
}
