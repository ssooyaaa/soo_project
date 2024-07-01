import 'package:csh_design/screen/index_screen.dart';
import 'package:csh_design/screen/screen2.dart';
import 'package:csh_design/screen/screen3.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  int bottomSelectedIdx = 0;


  List<Widget> pages = [
    IndexScreen(),
    Screen2(),
    Screen3(),
  ];

  void onItemTapped(int index){
    setState(() {
      bottomSelectedIdx= index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomSelectedIdx,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIdx,
        onTap: onItemTapped,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "홈"),

          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "공부추가"),

          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: "앱 정보"),
        ],
        backgroundColor: Color(0xffE8EAEA),
        selectedItemColor: Color(0xff2692F5),



      ),

    );
  }
}
