import 'package:flutter/material.dart';
import '../UI/TileMap.dart';

class SquareMapPage extends StatefulWidget {
  @override
  State createState() => new SquareMapPageState();
}

class SquareMapPageState extends State<SquareMapPage> {

  //appbar styles/title 
  final title = 'grid test';
  final TextStyle titleStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple[100]);

  bool currentBar = true;
  int _current = 0;
  List<bool> currentType = [true, false, false, false];

  //paired with bottom nav bar
  void _onTap(int i){
    //if primary menu selected
    if (currentBar) {
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
      //swap menu to secondaryMenu  
      }else if (i == 2) {
        setState(() {
          currentBar = false;
          _current = 0;
        });
      }
    //if secondary menu selected 
    }else {
      //toggle wall placement
      if (i == 0) {
        
      //toggle start placement
      } else if (i == 1) {

      //toggle finish placement
      } else if (i == 2) {

      //swap to primary menu
      } else if (i == 3) {
        setState(() {
          currentBar = true;
          _current = 0;
        });
      }
    }      //update navbar's currently selected
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
              title: Text('swap menu'),
            ),
          ];

  List<BottomNavigationBarItem> secondaryItems = [
            BottomNavigationBarItem(
              icon: Icon(Icons.crop_square),
              title: Text('wall'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.outlined_flag),
              title: Text('start'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag),
              title: Text('end'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              title: Text('swap menu'),
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
        body: TileMap(108, currentType),
        backgroundColor: Colors.deepPurple[500],
        //bottom navi bar -------------------------------
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple[400],
          items: currentBar ? mainItems: secondaryItems,
          currentIndex: _current,
          selectedItemColor: Colors.deepPurple[200],
          onTap: _onTap,
        ),
      ),
    );
  }
}