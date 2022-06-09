

import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("Build....");
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Stateful Page'),
      ),
      body: Center(
        child: Text('Counter Value State=> $counter'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  --counter;
                });
              }),
          SizedBox(
            width: 35,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  ++counter;
                });
              }),
        ],
      ),
    );
  }
}
