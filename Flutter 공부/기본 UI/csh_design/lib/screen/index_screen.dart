import 'package:csh_design/screen/detail_screen.dart';
import 'package:flutter/material.dart';


class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {


  String nowType='플러터';
  double imageSize=60;
  String mainText='Flutter 디자인';
  Color textColor=Colors.black;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: double.infinity,
        
          child: Column(
            children: [


              SizedBox(height: 40,),

              //todo:상단 프로필
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                          mainText,
                          style: TextStyle(color: textColor, fontSize: 17, fontWeight: FontWeight.bold),),
                      Text(
                          'UI, 상태 변화관리 시작하기',
                          style: TextStyle(color: Color(0xffB2BABB)),),
                    ],
                  ),
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://dthezntil550i.cloudfront.net/ps/latest/ps2201272314365330022817814/1280_960/56cf6ec5-7084-48e1-a543-79b1d5908eab.png',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              //todo Radio 버튼
              Row(
                children: [
                  TypeRadio(
                    text: '플러터',
                    isSelected: nowType=='플러터'? true:false,
                    onSelect: (){
                      setState(() {
                        nowType='플러터';
                        imageSize=60;
                        mainText='Flutter 디자인';
                        textColor=Colors.black;
                      });
                    },
                  ),
                  TypeRadio(
                    text: '스프링',
                    isSelected: nowType=='스프링'? true:false,
                    onSelect: (){
                      setState(() {
                        nowType='스프링';
                        imageSize=70;
                        mainText='Flutter 스프링';
                        textColor=Colors.red;
                      });
                    },
                  ),
                  TypeRadio(
                    text: 'DB',
                    isSelected: nowType=='DB'? true:false,
                    onSelect: (){
                      setState(() {
                        nowType='DB';
                        imageSize=80;
                        mainText='Flutter DB';
                        textColor=Colors.blue;
                      });
                    },
                  ),
                  TypeRadio(
                    text: '서버',
                    isSelected: nowType=='서버'? true:false,
                    onSelect: (){
                      setState(() {
                        nowType='서버';
                        imageSize=90;
                        mainText='Flutter 서버';
                        textColor=Colors.green;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 15,),

              //todo 리스트
              Expanded(

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                      buildBox(context),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),


    );
  }
}


Widget buildBox(BuildContext ctx){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 14),
    color: Colors.white,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('플러터 강의 오픈', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: 4,),
            Text('플러터 신규강의 오픈(수강생모집)'),
          ],
        ),
        OutlinedButton(
            onPressed: (){
              //todo 스크린 이동
              Navigator.push(
                ctx,
                MaterialPageRoute(builder: (context) => const DetailScreen()),
              );
            },
            child: Text('신청', style: TextStyle(fontWeight: FontWeight.bold),),
        ),


      ],
    ),

  );
}


class TypeRadio extends StatelessWidget {

  String text;
  bool isSelected;
  Function onSelect;

  TypeRadio({
    required this.text,
    required this.isSelected,
    required this.onSelect
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        onSelect();
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        child: Text(text, style: TextStyle(color: isSelected? Colors.white : Colors.purple, fontWeight: FontWeight.bold),),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 1),
          color: isSelected? Colors.purple : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
