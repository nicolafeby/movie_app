import 'package:flutter/material.dart';
import 'package:movie_app/core/argument/detail_movie_arg.dart';
import 'package:movie_app/core/extension/extension.dart';
import 'package:movie_app/core/router/router_constant.dart';
import 'package:movie_app/core/widget/custom_network_image.dart';
import 'package:movie_app/domain/movie_list/entities/movie_list_entities.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.entities,
  });

  final List<DataEntities> entities;

  Widget _buildImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: CustomNetworkImage(
        imageUrl: entities[index].poster,
        height: 100,
        width: 100,
      ),
      // child: CachedNetworkImage(
      //   fit: BoxFit.cover,
      //   height: 100,
      //   width: 100,
      //   imageUrl:
      //       entities[index].poster ?? 'https://dummyimage.com/600x400/000/fff',
      // ),
    );
  }

  Widget _buildTitle(BuildContext context, int index) {
    return Text(
      entities[index].title ?? '-',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _buildDesc(BuildContext context, int index) {
    return Text(
      "${entities[index].description}\n",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  Widget _buildReleaseDate(BuildContext context, int index) {
    return Text(
      entities[index].createdDate?.toFormattedDate() ?? '-',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 14.0,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entities.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12.0);
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            RouterConstant.detailMovie,
            arguments: DetailMovieArg(entities: entities[index]),
          ),
          child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(index),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(context, index),
                      _buildDesc(context, index),
                      _buildReleaseDate(context, index),
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
}
