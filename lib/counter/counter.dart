import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/post/post_view.dart';

import '../post/bloc/post_bloc.dart';
import '../post/bloc/post_state.dart';
import '../utils/status.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    _counterBloc = CounterBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    print("objectOne");
    return BlocProvider(
      create: (context) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostView()),
                  );
                },
                child: Text("Go Next"),
              ),

              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  print("object");
                  return Column(
                    children: [
                      const Text('You have pushed the button this many times:'),
                      Text(
                        '${state.counter}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current, prev) => false,
                    builder: (context, state) {
                      print("object");
                      return ActionChip(
                        label: Text("Increment"),
                        onPressed: () {
                          context.read<CounterBloc>().add(
                            IncrementCounterEvent(),
                          );
                        },
                      );
                    },
                  ),

                  BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current, prev) => false,
                    builder: (context, state) {
                      print("object");
                      return ActionChip(
                        label: Text("Decrement"),
                        onPressed: () {
                          context.read<CounterBloc>().add(
                            DecrementCounterEvent(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),

              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  switch (state.postStatus) {
                    case PostStatus.success:
                      return Column(
                        children: [
                          Text(state.tempPostList.length.toString()),
                          Text(state.postList.length.toString()),
                        ],
                      );

                    default:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
