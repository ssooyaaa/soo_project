import 'package:csh_restapi/model/todo_model.dart';
import 'package:csh_restapi/screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../vo/todo.dart';



class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoModel>(context, listen: false).getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Consumer<TodoModel>(builder: (context, todoModel, child){
            return SingleChildScrollView(
              child: Column(
                children: todoModel.todos.map((t)=>TodoBox(todo: t,)).toList(),
              ),
            );
          },),
        ),
      ),
    );
  }
}


class TodoBox extends StatelessWidget {

  Todo todo = Todo();

  TodoBox({
    required this.todo
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TodoScreen(abc: todo,),
          ),
        );
      },

      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('userId : ${todo.userId}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('title : ${todo.title}', overflow: TextOverflow.ellipsis,)
                  ),
                  SizedBox(width: 20,),
                  Text('${todo.completed ? '완료':'미완료'}', style: TextStyle(color: todo.completed? Colors.blue:Colors.red), ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}

