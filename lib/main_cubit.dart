import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_state_management/bloc/counter.cubit.dart';
import 'package:provider_state_management/pages/counter.cubit.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>CounterCubit(0))
      ],
      child: MaterialApp(
        routes: {
          "/": (context) => CounterCubitPage(),
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
}
