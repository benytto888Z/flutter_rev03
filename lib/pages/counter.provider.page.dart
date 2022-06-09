import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/counter.state.dart';

class CounterProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterState counterState =
        Provider.of<CounterState>(context, listen: false);
    print("Build....");
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Provider Page'),
      ),
      body: Consumer<CounterState>(
        builder: (context, counterState, child) {
          print("Text generation...");
          return Center(
            child: Text('Counter Value Provider =>${counterState.counter} '),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                counterState.decrement();
              }),
          SizedBox(
            width: 35,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                counterState.increment();
              }),
        ],
      ),
    );
  }
}
