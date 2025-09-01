import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/favourite/bloc/favourite_bloc.dart';
import 'package:flutter_bloc_tutorial/favourite/bloc/favourite_event.dart';
import 'package:flutter_bloc_tutorial/favourite/bloc/favourite_state.dart';
import 'package:flutter_bloc_tutorial/model/favourite_list_model.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (state.status == ListStatus.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.status == ListStatus.failure) {
              return Center(child: Text("Something went wrong"));
            } else {
              return ListView.builder(
                itemCount: state.favouriteList.length,
                itemBuilder: (context, index) {
                  final data = state.favouriteList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: state.tempFavouriteList.contains(data)
                            ? true
                            : false,
                        onChanged: (value) {
                          print(value!);
                          if (value!) {
                            context.read<FavouriteBloc>().add(
                              SelectItem(items: data),
                            );
                          } else {
                            context.read<FavouriteBloc>().add(
                              UnSelectItem(items: data),
                            );
                          }
                        },
                      ),
                      title: Text(state.favouriteList[index].value),
                      trailing: IconButton(
                        onPressed: () {
                          FavouriteListModel fav = FavouriteListModel(
                            id: data.id,
                            value: data.value,
                            isFavourite: data.isFavourite ? false : true,
                          );
                          context.read<FavouriteBloc>().add(
                            FavouriteList(items: fav),
                          );
                        },
                        icon: Icon(
                          data.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
