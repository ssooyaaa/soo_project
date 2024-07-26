

import 'dart:convert';

class Todo{

  int userId = 0;
  int id = 0;
  String title = '';
  bool completed = true;

  Todo({
    this.userId = 0,
    this.id = 0,
    this.title = '',
    this.completed = true,
  });

  factory Todo.fromjson(Map<String, dynamic> json){

    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}