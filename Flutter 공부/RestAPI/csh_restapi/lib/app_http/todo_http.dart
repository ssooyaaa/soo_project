import 'dart:convert';

import 'package:csh_restapi/vo/todo.dart';
import 'package:http/http.dart' as http;

class TodoHttp{
  
  //여러개 조회
  static Future<List<Todo>> fetchAllTodos() async{
    
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));

    List<Todo> list = [];

    if(response.body.isNotEmpty){
      var jsonList = jsonDecode(response.body);

      //for(int i=0;i<jsonList.length;i++){}
      for(var map in jsonList){
        Todo todo = Todo.fromjson(map);
        list.add(todo);
      }
    }

    return list;

  }
  

  //1개 조회
  static Future<Todo> fetchTodo(int index) async{

    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$index'));

    Todo todo = Todo();
    if(response.body.isNotEmpty){

      var json = jsonDecode(response.body);
      todo = Todo.fromjson(json);

    }

    return todo;

  }

}