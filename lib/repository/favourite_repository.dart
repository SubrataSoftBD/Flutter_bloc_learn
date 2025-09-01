import 'package:flutter_bloc_tutorial/model/favourite_list_model.dart';

class FavouriteRepository {
  Future<List<FavouriteListModel>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteListModel> _generateList(int length) {
    return List.generate(
      length,
      (index) =>
          FavouriteListModel(id: index.toString(), value: "Items $index"),
    );
  }
}
