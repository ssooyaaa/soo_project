
import 'dart:convert';

import 'package:csh_restapi/app_http/todo_http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../vo/todo.dart';

class TodoModel extends ChangeNotifier{

  //1개 todo
  Todo todo = Todo();

  //여러개 todo
  List<Todo> todos = [];


  void getAllTodos() async{
     todos = await TodoHttp.fetchAllTodos();

     notifyListeners();
  }


  void getTodo(int index) async{

    todo = Todo();
    todo = await TodoHttp.fetchTodo(index);

    notifyListeners();
  }



}