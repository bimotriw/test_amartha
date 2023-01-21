import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int id;
  final String label;
  final bool isActive;

  const TodoEntity({
    required this.id,
    required this.label,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [id, label, isActive];

  TodoEntity copyWith({
    String? label,
    bool? isActive,
  }) {
    return TodoEntity(
      id: id,
      label: label ?? this.label,
      isActive: isActive ?? this.isActive,
    );
  }
}
