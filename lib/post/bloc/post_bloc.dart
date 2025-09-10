import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_event.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_state.dart';
import 'package:flutter_bloc_tutorial/repository/post_repository.dart';
import 'package:flutter_bloc_tutorial/utils/status.dart';

import '../../model/data_list_model.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository? postRepository = PostRepository();
  List<DataListModel> tempPostList = [];

  PostBloc() : super(PostState()) {
    on<PostFetchEvent>(fetchPost);
    on<PostSearchItems>(_filterList);
  }

  void fetchPost(PostFetchEvent event, Emitter<PostState> emit) async {
    await postRepository
        ?.fetchData()
        .then((value) {
          emit(
            state.copyWith(
              postStatus: PostStatus.success,
              postList: value,
              message: "Success",
            ),
          );
        })
        .onError((error, stackTrac) {
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }

  void _filterList(PostSearchItems event, Emitter<PostState> emit) async {
    if (event.searchText.isEmpty) {
      emit(state.copyWith(tempPostList: [], errorMessage: ""));
    } else {
      tempPostList = state.postList
          .where(
            (element) => element.id.toString() == event.searchText.toString(),
          )
          .toList();
      if (tempPostList.isEmpty) {
        emit(
          state.copyWith(
            tempPostList: tempPostList,
            errorMessage: "No data found",
          ),
        );
      } else {
        emit(state.copyWith(tempPostList: tempPostList, errorMessage: ""));
      }
    }
  }
}
