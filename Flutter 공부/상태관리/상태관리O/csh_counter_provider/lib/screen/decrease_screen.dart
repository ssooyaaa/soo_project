import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/counter_model.dart';



class DecreaseScreen extends StatefulWidget {


  @override
  State<DecreaseScreen> createState() => _DecreaseScreenState();
}

class _DecreaseScreenState extends State<DecreaseScreen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('숫자 감소'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Consumer<CounterModel>(builder: (context, counterModel, child){
              return Text('${counterModel.counter}', style: TextStyle(fontSize: 30),);
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){
          Provider.of<CounterModel>(context, listen: false).decreaseCounter();
        },
        child: Icon(Icons.exposure_minus_1),
      ),
    );
  }
}
