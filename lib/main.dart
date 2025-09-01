import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/favourite/bloc/favourite_bloc.dart';
import 'package:flutter_bloc_tutorial/image_picker/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_tutorial/repository/favourite_repository.dart';
import 'package:flutter_bloc_tutorial/search/html.dart';
import 'package:flutter_bloc_tutorial/switch_example/bloc/switch_bloc.dart';
import 'package:flutter_bloc_tutorial/todo/bloc/todo_bloc.dart';
import 'package:flutter_bloc_tutorial/utils/image_picker_utils.dart';

import 'favourite/favourite_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HtmlSearchView(),
      ),
    );
  }
}
