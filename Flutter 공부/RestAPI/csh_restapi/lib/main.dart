import 'package:csh_restapi/screen/list_screen.dart';
import 'package:csh_restapi/screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/todo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => TodoModel()),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ListScreen(),
      ),
    );
  }
}

