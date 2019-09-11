import 'package:flutter/material.dart';
import '../UI/TileMap.dart';
import 'dart:math';

class SquareMapPage extends StatefulWidget {
  @override
  State createState() => new SquareMapPageState();
}

class SquareMapPageState extends State<SquareMapPage> {

  //appbar styles/title 
  String title = 'current tile: wall';
  final TextStyle titleStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple[100]);
  int _current = 0;
  int selectedTile = 0;
  Color navBarColor = Colors.deepPurple[400];
  List<bool> currentType = [true, false, false, false];

  //paired with bottom nav bar
  void _onTap(int i){ 
    //pop page stack and retuen to title
    if (i == 0) {
      Navigator.pop(context);
      print('map erased, sent home');
    //wipes tiles to empty
    }else if (i == 1) {
      //TODO add
      setState(() {
      _current = i;
      });
    //swap current tile  
    }else if (i == 2) {
      //cycle through selected tiles for placement
      if (selectedTile < 2) {
        selectedTile++;
      }else {
        selectedTile = 0;
      }
      //update current tile type
      setState(() {
        switch (selectedTile) {
          case 0:
            title = 'current tile: wall';
            currentType = [false, true, false, false];
            break;
          case 1:
            title = 'current tile: start';
            currentType = [false, false, true, false];
            break;
          case 2:
            title = 'current tile finish';
            currentType = [false, false, false, true];
            break;
          default:
        }
        _current = i;
      });
      print(title);
    }
  }

  List<BottomNavigationBarItem> mainItems = [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.undo),
              title: Text('wipe grid'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              title: Text('swap selected'),
            ),
          ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'grid test',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title, style: titleStyle),
          backgroundColor: Colors.deepPurple[400],
        ),
        //scaffold body ---------------------------------
        body: TileMap(192, currentType),
        backgroundColor: Colors.deepPurple[500],
        //bottom navi bar -------------------------------
        bottomNavigationBar: BottomNavigationBar(
          items: mainItems,
          currentIndex: _current,
          backgroundColor: navBarColor,
          selectedItemColor: Colors.deepPurple[200],
          onTap: _onTap,
        ),
      ),
    );
  }
}