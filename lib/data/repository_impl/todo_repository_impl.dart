import 'package:test_amartha/configs/sqflite_config.dart';
import 'package:test_amartha/data/model/todo_model.dart';
import 'package:test_amartha/domain/entity/todo_entity.dart';
import 'package:test_amartha/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<TodoEntity>> fetch() async {
    List<Map<String, dynamic>> data = await SqfLite.instance.getTodo();
    return TodoModel.parseEntries(data);
  }

  @override
  Future<int> addNew(String label) async {
    return await SqfLite.instance.insertTodo(label: label);
  }

  @override
  Future<void> changeStatus(TodoEntity data) async {
    print('${data.id} -> ${data.isActive}');
    await SqfLite.instance.updateTodo(data: {
      'id': data.id,
      'label': data.label,
      'is_active': data.isActive ? 1 : 0,
    });
  }
}
