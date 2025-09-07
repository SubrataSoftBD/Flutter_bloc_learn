import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_bloc.dart';
import 'package:flutter_bloc_tutorial/post/bloc/post_state.dart';
import 'package:flutter_bloc_tutorial/utils/status.dart';

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
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Post View')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.success:
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Products List", style: TextStyle(fontSize: 18)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.postList.length,
                      itemBuilder: (context, index) {
                        final data = state.postList[index];
                        return ListTile(title: Text(data.title ?? ""));
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
