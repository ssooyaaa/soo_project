import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {


  TextEditingController formController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6UqZQszP6GO3dR18ghivU4TiXxWvvgA-CGA&usqp=CAU', 
                    width:deviceWidth*0.5, 
                    fit: BoxFit.cover,
                  )
              ),
          
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('컬럼1'),
              ),
          
              SizedBox(height: 20,),
          
              Text('컬럼2'),
              Text('컬럼3'),
          
              Row(
          
                mainAxisAlignment: MainAxisAlignment.center,
          
                children: [
                  Text('로우1'),
          
                  SizedBox(width:20,),
                  Text('로우2'),
                  Text('로우3'),
                ],
              ),
          
              TextFormField(
                  controller: formController,
              ),

              ElevatedButton(
                  onPressed: (){
                      print(formController.text);
                  },
                  child: Text('입력받기'),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
