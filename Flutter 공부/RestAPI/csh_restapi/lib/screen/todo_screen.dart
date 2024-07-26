import 'dart:convert';

import 'package:csh_restapi/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {

  int todoIdx = 0;

  TodoScreen({
    required this.todoIdx
  });

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TextStyle ts = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<TodoModel>(context, listen: false).getTodo(widget.todoIdx);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('TODO 상세보기'),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [


            Consumer<TodoModel>(builder: (context, todoModel, child){
              return Column(
                children: [
                  Text('userId : ${todoModel.todo.userId}', style: ts,),
                  Text('id : ${todoModel.todo.id}', style: ts,),
                  Text('title : ${todoModel.todo.title}', style: ts,),
                  Text('completed : ${todoModel.todo.completed ? '완료' : '미완료'}', style: ts,),

                ],
              );
            }),



            ElevatedButton(
                onPressed: () {
                  //Provider.of<TodoModel>(context, listen: false).getTodo(1);
                },
                child: Text('TODO 조회'),
            ),
          ],
        ),
      ),
    );
  }
}
