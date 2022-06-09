import 'package:bloc/bloc.dart';
import 'todos_filter_event.dart';
import 'todos_filter_state.dart';

class TodosFilterBloc extends Bloc<TodosFilterEvent, TodosFilterState> {
  TodosFilterBloc() : super() {
    on<TodosFilterEvent>((event, emit) {

    });
  }
}

class TodosFilterInitial {
  
}
