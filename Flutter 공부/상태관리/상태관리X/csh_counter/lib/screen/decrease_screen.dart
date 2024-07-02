import 'package:flutter/material.dart';

class DecreaseScreen extends StatefulWidget {
  int number = 0;

  DecreaseScreen({
    required this.number
  });

  @override
  State<DecreaseScreen> createState() => _DecreaseScreenState();
}

class _DecreaseScreenState extends State<DecreaseScreen> {

  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        Navigator.pop(context, _counter);

        return true;
      },

      child: Scaffold(

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
              Text('${_counter}', style: TextStyle(fontSize: 30),),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
            setState(() {
              _counter--;
            });

          },
          child: Icon(Icons.exposure_minus_1),
        ),
      ),
    );
  }
}
