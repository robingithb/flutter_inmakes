import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/bloc/bloc_pattern/counter_app.dart';

void main() {
  runApp(const MyCounter());
}

class MyCounter extends StatelessWidget {
  const MyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "counter_bloc",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterbloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Apps"),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, int>(builder: (context, count) {
        return Center(
          child: Text(
            '$count',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterbloc.add(IncrementEvent());
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterbloc.add(DecrementEvent());
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
