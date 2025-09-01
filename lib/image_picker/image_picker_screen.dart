import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/image_picker/bloc/image_picker_bloc.dart';

import 'bloc/image_picker_event.dart';
import 'bloc/image_picker_state.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(GalleryPicker());
                },
                child: Icon(Icons.camera),
              );
            }
            return Image.file(File(state.file?.path ?? ""));
          },
        ),
      ),
    );
  }
}
