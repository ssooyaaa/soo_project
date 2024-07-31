import 'dart:convert';

import 'package:csh_restapi/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../vo/todo.dart';

class TodoScreen extends StatefulWidget {

  Todo abc;

  TodoScreen({
    required this.abc
  });

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TextStyle ts = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  bool _loading = true;

  void init() async{

    await Provider.of<TodoModel>(context, listen: false).getTodo(widget.abc.id);
    //await Future.delayed(Duration(milliseconds: 1200));
    print('데이터 조회 끝');

    setState(() {
      _loading = false;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(
        title: Text('${widget.abc.title}'),
      ),

      body: LoadingOverlay(
        color: Colors.black,
        isLoading: _loading,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
        
        
              Consumer<TodoModel>(builder: (context, todoModel, child){

                // Widget w;
                //
                // if(todoModel.todo.id==0){
                //   //todo 아직 받아온 데이터 없음
                //   w = Center(child: Text('로딩중'),);
                // }else{
                //   //todo 데이터 존재
                //   w = Container(
                //     width: double.infinity,
                //
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text('userId : ${todoModel.todo.userId}', style: ts,),
                //         Text('id : ${todoModel.todo.id}', style: ts,),
                //         Text('title : ${todoModel.todo.title}', style: ts,),
                //         Text('completed : ${todoModel.todo.completed ? '완료' : '미완료'}', style: ts,),
                //
                //       ],
                //     ),
                //   );
                // }
                //
                //
                // return w;

                return

                    todoModel.todo.id != 0 ?
                    Container(
                      width: double.infinity,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('userId : ${todoModel.todo.userId}', style: ts,),
                          Text('id : ${todoModel.todo.id}', style: ts,),
                          Text('title : ${todoModel.todo.title}', style: ts,),
                          Text('completed : ${todoModel.todo.completed ? '완료' : '미완료'}', style: ts,),

                        ],
                      ),
                    ) :
                    Text('로딩중');
              }),
        
        
            ],
          ),
        ),
      ),
    );
  }
}
