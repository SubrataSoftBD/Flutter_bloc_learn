import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/todo/bloc/todo_bloc.dart';
import 'package:flutter_bloc_tutorial/todo/bloc/todo_event.dart';
import 'package:flutter_bloc_tutorial/todo/bloc/todo_state.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoBloc>().add(
              AddTodoEvent(task: "Task" + i.toString()),
            );
          }
        },
        label: Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return Center(
              child: Text(
                "No Data Found",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = state.todosList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${data}"),
                      IconButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(
                            RemoveTodoEvent(task: data),
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
