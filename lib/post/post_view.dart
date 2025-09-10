import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_bloc.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_state.dart';
import 'package:flutter_bloc_tutorial/utils/status.dart';

import '../counter/bloc/counter_bloc.dart';
import 'bloc/post_event.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    context.read<PostBloc>().add(PostFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post View'),
        actions: [
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
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.success:
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Products List",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search title here",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<PostBloc>().add(PostSearchItems(value));
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: state.errorMessage.isNotEmpty
                        ? Center(
                            child: Text(
                              state.errorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.tempPostList.isEmpty
                                ? state.postList.length
                                : state.tempPostList.length,
                            itemBuilder: (context, index) {
                              final data = state.tempPostList.isNotEmpty
                                  ? state.tempPostList[index]
                                  : state.postList[index];
                              if (state.tempPostList.isNotEmpty) {
                                return ListTile(title: Text(data.title ?? ""));
                              } else {
                                return ListTile(title: Text(data.title ?? ""));
                              }
                            },
                          ),
                  ),
                ],
              );

            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
