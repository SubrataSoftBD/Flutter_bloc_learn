import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/model/data_list_model.dart';
import 'package:flutter_bloc_tutorial/utils/status.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<DataListModel> postList;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.message = "",
  });

  PostState copyWith({
    PostStatus? postStatus,
    List<DataListModel>? postList,
    String? message,
  }) {
    return PostState(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, message];
}
