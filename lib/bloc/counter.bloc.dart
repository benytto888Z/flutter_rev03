import 'package:bloc/bloc.dart';

abstract class CounterEvent{}
class Increment extends CounterEvent {}
class Decrement extends CounterEvent {}

class SetCounter extends CounterEvent {
  final int setTo;
  SetCounter({required this.setTo});
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<SetCounter>((event, emit) => emit(event.setTo));
  }

  void _onIncrement(Increment event, Emitter<int> emit) {
    emit(state + 1);
  }

  void _onDecrement(Decrement event, Emitter<int> emit) {
    emit(state - 1);
  }
}

