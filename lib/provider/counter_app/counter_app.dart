import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get counter => _count;
  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Counter App",
      home: ChangeNotifierProvider(
        create: (context) => Counter(),
        child: const CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Counter",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              '${counter.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        counter.decrement();
                      },
                      tooltip: "Decrement",
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        counter.increment();
                      },
                      tooltip: "increment",
                      child: const Icon(Icons.add),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
