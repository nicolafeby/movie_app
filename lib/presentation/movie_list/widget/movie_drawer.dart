import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_constants.dart';

class MovieDrawer extends StatefulWidget {
  const MovieDrawer({
    super.key,
  });

  @override
  State<MovieDrawer> createState() => _MovieDrawerState();
}

class _MovieDrawerState extends State<MovieDrawer> {
  Widget _buildHeader(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(color: Color(0xFFBDBDBD)),
      child: Stack(
        alignment: Alignment.topLeft,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -40,
            child: Image.asset(
              AssetConstant.imgMovie,
              height: 150,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aplikasi movie kekinian',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  'nicolafsalv@gmail.com',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
        ],
      ),
    );
  }
}
