import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvents {}

class IncrementEvent extends CounterEvents {}

class DecrementEvent extends CounterEvents {}

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>(
      (event, emit) {
        emit(state + 1);
      },
    );
    on<DecrementEvent>(
      (event, emit) {
        if (state == 0) {
          return;
        }
        emit(state - 1);
      },
    );
  }
}
