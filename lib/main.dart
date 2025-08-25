import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/search/search_file.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SearchableHtmlPage(),
      ),
    );
  }
}


