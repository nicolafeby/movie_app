import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/core/widget/custom_appbar.dart';
import 'package:movie_app/core/widget/custom_textfield.dart';
import 'package:movie_app/presentation/add_movie/bloc/add_movie_bloc.dart';
import 'package:movie_app/presentation/add_movie/widget/add_movie_input_image.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  late AddMovieBloc _bloc;
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  void _onTapAddPoster() async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (result != null) {
      _bloc.changeMovieImage(result.path);
    }
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      title: Text(
        'Movies',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAddImage(),
          const SizedBox(height: 20.0),
          _buildTitleField(),
          const SizedBox(height: 16.0),
          _buildDescField(),
          const SizedBox(height: 16.0),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        StreamBuilder(
          stream: _bloc.titleStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return CustomTextfield(
              onChanged: _bloc.changeTitle,
              hintText: 'Input movie title',
              controller: _titleController,
              errorText: snapshot.error as String?,
            );
          },
        ),
      ],
    );
  }

  Widget _buildDescField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        StreamBuilder(
          stream: _bloc.descStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return CustomTextfield(
              onChanged: _bloc.changeDesc,
              maxLine: 3,
              hintText: 'Input movie description',
              controller: _descController,
              errorText: snapshot.error as String?,
            );
          },
        ),
      ],
    );
  }

  Widget _buildAddImage() {
    return AddMovieInputImage(
      onTapAddImage: _onTapAddPoster,
      bloc: _bloc,
    );
  }

  Widget _buildButton() {
    return StreamBuilder<bool>(
      stream: _bloc.isAllSubmited,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          onPressed: (snapshot.data ?? false)
              ? () {
                  log(_bloc.isAllSubmited.toString());
                  _bloc.add(AddMovieStarted());
                }
              : null,
          child: Text(
            'Add Movie',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMovieBloc, AddMovieState>(
      listener: (context, state) {
        if (state is AddMovieInProgress) {
          showDialog(
            barrierColor: Colors.black.withOpacity(0.7),
            barrierDismissible: false,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AddMovieLoadInFailure) {
          Navigator.pop(context);
          final snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: const Text('Oh no! Error when adding movie :()'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is AddMovieLoadInSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          final snackBar = SnackBar(
            content: const Text('Yay! Success adding movie'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }
}
