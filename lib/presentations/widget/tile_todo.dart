import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_amartha/configs/style_config.dart';
import 'package:test_amartha/domain/entity/todo_entity.dart';
import 'package:test_amartha/presentations/bloc/todo_bloc.dart';

class TileTodo extends StatelessWidget {
  final TodoEntity todo;

  const TileTodo({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<TodoBloc>().changeActivation(todo),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              margin: const EdgeInsets.only(right: 16),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColor.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                todo.label.split('').first.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Text(
              todo.label,
              style: TextStyle(
                decoration: !todo.isActive ? TextDecoration.lineThrough : null,
                color: !todo.isActive ? AppColor.greyNonActiveText : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
