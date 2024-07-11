
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../vo/todo.dart';

class TodoModel extends ChangeNotifier{

  Todo todo = Todo();

  void getTodo() async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    var json = jsonDecode(response.body);

    todo = Todo.fromjson(json);

    notifyListeners();
  }
}