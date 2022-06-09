import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/bloc/counter.cubit.dart';
import 'package:provider_state_management/provider/counter.state.dart';

class CounterCubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build....");
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Cubit Page'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text('Counter Value Cubit => $state'),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<CounterCubit>().decrement();
              }),
          SizedBox(
            width: 35,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<CounterCubit>().increment();
              }),
        ],
      ),
    );
  }
}
