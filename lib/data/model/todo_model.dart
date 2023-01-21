import 'package:test_amartha/domain/entity/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          label: json['label'],
          isActive: json['is_active'] == 1,
        );

  static List<TodoEntity> parseEntries(List<dynamic> entries) {
    List<TodoEntity> data = [];
    for (var value in entries) {
      data.add(TodoModel.fromJson(value));
    }
    return data;
  }
}
