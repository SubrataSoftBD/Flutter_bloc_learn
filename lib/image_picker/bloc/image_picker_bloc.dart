import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/image_picker/bloc/image_picker_event.dart';
import 'package:flutter_bloc_tutorial/image_picker/bloc/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(_onCameraCapture);
    on<GalleryPicker>(_onGalleryPicker);
  }

  void _onCameraCapture(
    CameraCapture event,
    Emitter<ImagePickerState> emit,
  ) async {
    XFile? file = await imagePickerUtils.cameraCaptureTap();
    emit(state.copyWith(file: file));
  }

  void _onGalleryPicker(
    GalleryPicker event,
    Emitter<ImagePickerState> emit,
  ) async {
    XFile? file = await imagePickerUtils.galleryCaptureTap();
    emit(state.copyWith(file: file));
  }
}
