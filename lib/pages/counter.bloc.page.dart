import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_state_management/bloc/counter.bloc.dart';

class CounterBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build....");
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc Page'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Text('Counter Value From Bloc => $state'),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                print("-1");
               // BlocProvider.of<CounterBloc>(context).Decrement();
              }),
          SizedBox(
            width: 35,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                print("+1");
                context.read<CounterBloc>().add(Increment());
              }),
        ],
      ),
    );
  }
}
