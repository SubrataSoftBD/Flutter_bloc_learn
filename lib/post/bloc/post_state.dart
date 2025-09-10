import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/model/data_list_model.dart';
import 'package:flutter_bloc_tutorial/utils/status.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<DataListModel> postList;
  final List<DataListModel> tempPostList;
  final String message;
  final String errorMessage;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.tempPostList = const [],
    this.message = "",
    this.errorMessage = "",
  });

  PostState copyWith({
    PostStatus? postStatus,
    List<DataListModel>? postList,
    List<DataListModel>? tempPostList,
    String? message,
    String? errorMessage,
  }) {
    return PostState(
      postList: postList ?? this.postList,
      tempPostList: tempPostList ?? this.tempPostList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, message, tempPostList, errorMessage];
}
