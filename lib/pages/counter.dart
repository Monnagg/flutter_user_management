import 'package:flutter/material.dart';
import '../providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(title: Text('counter_provider')),
      body: Center(
          child:
              Text('num is ${counter.count.toString()}')),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            key: Key('decrement'),
            onPressed: null,
            tooltip: 'decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            key: Key('increment'),
            onPressed: () {
              return counter.increment();
            },
            tooltip: 'increment',
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
