import 'package:flutter/material.dart';
import 'package:reuse/mapscreen.dart';
import 'package:reuse/recyclepage.dart';
import 'data/data.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = <Widget>[
    RecyclePage(),
    MainPage(),
    MapScreen()
    // Add more pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: 'Recycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          // Add more BottomNavigationBarItems as needed
        ],
      ),
    );
  }
}

