import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/search/html_high_light.dart';
import 'package:flutter_bloc_tutorial/search/search_file.dart';
import 'package:flutter_bloc_tutorial/switch_example/bloc/switch_bloc.dart';
import 'package:flutter_bloc_tutorial/switch_example/switch_view.dart';
void main()async {
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SwitchView(),
      ),
    );
  }
}


