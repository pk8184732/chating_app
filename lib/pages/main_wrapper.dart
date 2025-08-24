
import 'package:chating_app/pages/call_page.dart';
import 'package:chating_app/pages/saved_call_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    SavedCallPage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],

   bottomNavigationBar: BottomNavigationBar(
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.history), label: "Saved Calls"),
       ],
     currentIndex: _currentIndex,
     onTap: (index){
       setState(() {
         _currentIndex = index;
       });
     },
     // selectedItemColor: Colors.amber,
     // unselectedItemColor: Colors.grey,
     // showUnselectedLabels: true,

   ),

    );
  }
}
