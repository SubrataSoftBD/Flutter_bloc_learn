import 'package:equatable/equatable.dart';

import '../../model/favourite_list_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteListModel> favouriteList;
  final List<FavouriteListModel> tempFavouriteList;

  final ListStatus status;

  const FavouriteState({
    this.favouriteList = const [],
    this.tempFavouriteList = const [],
    this.status = ListStatus.loading,
  });

  FavouriteState copyWith({
    List<FavouriteListModel>? favouriteList,
    List<FavouriteListModel>? tempFavouriteList,
    ListStatus? status,
  }) {
    return FavouriteState(
      favouriteList: favouriteList ?? this.favouriteList,
      tempFavouriteList: tempFavouriteList ?? this.tempFavouriteList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [favouriteList, tempFavouriteList, status];
}
