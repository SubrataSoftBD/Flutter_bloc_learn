import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/model/favourite_list_model.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class FavouriteList extends FavouriteEvent {
  final FavouriteListModel items;
  const FavouriteList({required this.items});
}

class SelectItem extends FavouriteEvent {
  final FavouriteListModel items;
  const SelectItem({required this.items});
}

class UnSelectItem extends FavouriteEvent {
  final FavouriteListModel items;
  const UnSelectItem({required this.items});
}
