import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_state_management/bloc/counter.bloc.dart';
import 'package:provider_state_management/bloc/counter.cubit.dart';
import 'package:provider_state_management/pages/counter.bloc.page.dart';
import 'package:provider_state_management/todosapp/blocs/todos_bloc.dart';
import 'package:provider_state_management/todosapp/home.todos.bloc.dart';

import 'todosapp/blocs/todos_event.dart';
import 'todosapp/models/todos_model.dart';

void main() => runApp(MyApp());

/*
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>CounterCubit(0)),
        BlocProvider(create: (context)=>CounterBloc(),),
      ],
      child: MaterialApp(
        routes: {
          "/": (context) => CounterBlocPage(),
        },
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            textTheme: TextTheme(
              bodyText2: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            )),
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Todosbloc()
            ..add(
              LoadTodos(todos: [
                  Todo(
                    id: '1',
                    task: "sample todo 1",
                    description: "This is a test for todo 1"),
                  Todo(
                    id: '2',
                    task: "sample todo 2",
                    description: "This is a test for todo 2"),
                  Todo(
                    id: '3',
                    task: "sample todo 3",
                    description: "This is a test for todo 3"),
              ]),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc Pattern - TodosApp',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color(0xFF000A1F),
            appBarTheme: const AppBarTheme(
              color: Color(0xFF000A1F),
            )),
        home: HomeTodosBlocApp(),
      ),
    );
  }
}
