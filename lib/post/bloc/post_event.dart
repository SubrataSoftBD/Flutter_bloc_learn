import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostFetchEvent extends PostEvent {}

class PostSearchItems extends PostEvent {
  final String searchText;

  PostSearchItems(this.searchText);
}
