import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/presentation/add_movie/bloc/add_movie_bloc.dart';

class AddMovieInputImage extends StatelessWidget {
  const AddMovieInputImage({
    super.key,
    required this.onTapAddImage,
    required this.bloc,
  });

  final AddMovieBloc bloc;
  final VoidCallback onTapAddImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAddImage,
      child: StreamBuilder(
        stream: bloc.imageStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.file(
                File(snapshot.data),
                height: 280.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            );
          }
          return Container(
            height: 280.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    size: 64.0,
                  ),
                  Text(
                    'Add Image',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
