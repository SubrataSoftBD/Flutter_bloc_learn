import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_event.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_state.dart';
import 'package:flutter_bloc_tutorial/repository/post_repository.dart';
import 'package:flutter_bloc_tutorial/utils/status.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository = PostRepository();

  PostBloc(this.postRepository) : super(PostState()) {
    on<PostFetchEvent>(fetchPost);
  }

  void fetchPost(PostFetchEvent event, Emitter<PostState> emit) async {
    await postRepository
        .fetchData()
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
}
