import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/router/router_constant.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12.0);
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            RouterConstant.detailMovie,
            // arguments: DetailArg(
            //   url: entities.articles?[index].url ?? '',
            // ),
          ),
          child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(context),
                      _buildDesc(context),
                      _buildAuthor(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: 100,
        width: 100,
        imageUrl: 'https://dummyimage.com/600x400/000/fff',
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'movie title',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _buildDesc(BuildContext context) {
    return Text(
      "movie description\n",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  Widget _buildAuthor(BuildContext context) {
    return Text(
      "datetime",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
