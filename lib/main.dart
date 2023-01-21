import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_amartha/configs/style_config.dart';
import 'package:test_amartha/data/repository_impl/todo_repository_impl.dart';
import 'package:test_amartha/presentations/bloc/todo_bloc.dart';
import 'package:test_amartha/presentations/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (ctx) => TodoBloc(repository: TodoRepositoryImpl()),
      child: MaterialApp(
        title: 'Amartha Test Case',
        themeMode: ThemeMode.light,
        theme: MyThemes.lightTheme,
        home: const SplashPage(),
      ),
    );
  }
}
