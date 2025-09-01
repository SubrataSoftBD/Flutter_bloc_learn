import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/favourite/bloc/favourite_event.dart';
import 'package:flutter_bloc_tutorial/favourite/bloc/favourite_state.dart';
import 'package:flutter_bloc_tutorial/model/favourite_list_model.dart';
import 'package:flutter_bloc_tutorial/repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<FavouriteListModel> favouriteList = [];
  List<FavouriteListModel> tempFavouriteList = [];
  FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository) : super(FavouriteState()) {
    on<FetchFavouriteList>(_fetchList);
    on<FavouriteList>(_addFavouriteItem);
    on<SelectItem>(_selectedItem);
    on<UnSelectItem>(_unSelectedItem);
  }

  void _fetchList(
    FetchFavouriteList event,
    Emitter<FavouriteState> emit,
  ) async {
    favouriteList = await favouriteRepository.fetchItems();
    emit(
      state.copyWith(
        favouriteList: List.from(favouriteList),
        status: ListStatus.success,
      ),
    );
  }

  void _addFavouriteItem(
    FavouriteList event,
    Emitter<FavouriteState> emit,
  ) async {
    final index = favouriteList.indexWhere(
      (element) => element.id == event.items.id,
    );
    favouriteList[index] = event.items;
    emit(state.copyWith(favouriteList: List.from(favouriteList)));
  }

  void _selectedItem(SelectItem event, Emitter<FavouriteState> emit) async {
    tempFavouriteList.add(event.items);

    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }

  void _unSelectedItem(UnSelectItem event, Emitter<FavouriteState> emit) async {
    tempFavouriteList.remove(event.items);
    emit(state.copyWith(tempFavouriteList: List.from(tempFavouriteList)));
  }
}
