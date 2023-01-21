import 'package:test_amartha/domain/entity/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> fetch();

  Future<int> addNew(String label);

  Future<void> changeStatus(TodoEntity data);
}
