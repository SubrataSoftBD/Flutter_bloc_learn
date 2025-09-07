import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostFetchEvent extends PostEvent {}
