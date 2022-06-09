import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/pages/counter.provider.page.dart';
import 'package:provider_state_management/pages/counter.stateful.page.dart';
import 'package:provider_state_management/provider/counter.state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> CounterState())
      ],
      child: MaterialApp(
        routes: {
          "/": (context) => CounterProviderPage(),
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
