import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_state_management/todosapp/add_todo_screen.dart';

import 'blocs/todos_bloc.dart';
import 'blocs/todos_event.dart';
import 'blocs/todos_state.dart';
import 'models/todos_model.dart';

class HomeTodosBlocApp extends StatefulWidget {
  HomeTodosBlocApp({Key? key}) : super(key: key);

  @override
  State<HomeTodosBlocApp> createState() => _HomeTodosBlocAppState();
}

class _HomeTodosBlocAppState extends State<HomeTodosBlocApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc pattern Todos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddToDoScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<Todosbloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const CircularProgressIndicator();
          }

          if (state is TodosLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      'Pending To Dos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _todoCard(context, state.todos[index]);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }

  Card _todoCard(BuildContext context, todo) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('#${todo.id} : ${todo.task}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<Todosbloc>().add(
                          UpdateTodo(todo: todo.copyWith(isCompleted: true),),
                        );
                  },
                  icon: const Icon(Icons.add_task),
                ),
                IconButton(
                  onPressed: () {
                    context.read<Todosbloc>().add(
                          DeleteTodo(todo: todo),
                        );
                  },
                  icon: const Icon(Icons.cancel),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
