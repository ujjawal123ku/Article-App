import 'package:blog/homepage.dart';
import 'package:blog/pages/chat.dart';
import 'package:blog/pages/blog/profile.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    homepage(),
    ProfileView(),
    ChatPage(),
    ChatPage(),
  ];
  int curIndex=0;
  void onTap(int index){
    setState(() {
      curIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[curIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade50,
        onTap: onTap,
        currentIndex: curIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person"),
        ],

      ),
    );
  }
}
