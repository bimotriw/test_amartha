import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_amartha/configs/style_config.dart';
import 'package:test_amartha/presentations/bloc/todo_bloc.dart';
import 'package:test_amartha/presentations/widget/tile_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController todoController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    todoController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(16),
                insetPadding: const EdgeInsets.all(16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                title: const Text("Add New Todo"),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: todoController,
                          validator: (String? val) {
                            if (val!.trim().isEmpty) {
                              return 'This field is required.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await context
                                  .read<TodoBloc>()
                                  .addTodo(todoController.text.trim());
                              todoController.clear();
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Add New'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (ctx, state) {
          if (state is TodoLoadedState) {
            if (state.toDoList.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.event_busy,
                    size: 64,
                    color: AppColor.primary,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Todo list is empty',
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }
            return ListView.builder(
              itemCount: state.toDoList.length,
              itemBuilder: (ctx, index) =>
                  TileTodo(todo: state.toDoList[index]),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
