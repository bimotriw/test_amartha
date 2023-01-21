import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_amartha/configs/sqflite_config.dart';
import 'package:test_amartha/domain/entity/todo_entity.dart';
import 'package:test_amartha/domain/repository/todo_repository.dart';

abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {
  final List<TodoEntity>? toDoList;

  TodoLoadingState({this.toDoList});
}

class TodoLoadedState extends TodoState {
  final List<TodoEntity> toDoList;

  TodoLoadedState(this.toDoList);
}

class TodoBloc extends Cubit<TodoState> {
  final TodoRepository repository;

  TodoBloc({required this.repository}) : super(TodoInitialState());

  Future<void> fetchTodoList() async {
    await SqfLite.init();

    await Future.delayed(const Duration(seconds: 2));
    List<TodoEntity> data = await repository.fetch();

    emit(TodoLoadedState(data));
  }

  Future<void> addTodo(String label) async {
    int insertedId = await repository.addNew(label);

    List<TodoEntity> data = (state as TodoLoadedState).toDoList;
    data.add(TodoEntity(id: insertedId, label: label));

    emit(TodoLoadedState(data));
  }

  Future<void> changeActivation(TodoEntity todo) async {
    await repository.changeStatus(todo.copyWith(isActive: !todo.isActive));

    List<TodoEntity> data = (state as TodoLoadedState).toDoList;
    data[data.indexWhere((element) => element.id == todo.id)] =
        todo.copyWith(isActive: !todo.isActive);

    emit(TodoLoadedState(data));
  }
}
