import 'package:flutter/material.dart';
import 'package:rock_path/pages/landing_page.dart';
import '../utils/SquareMap.dart';

class SquareMapPage extends StatefulWidget {
  @override
  State createState() => new SquareMapPageState();
}

class SquareMapPageState extends State<SquareMapPage> {

  //appbar styles/title 
  final title = 'grid test';
  final TextStyle titleStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepPurple[100]);
  
  //create squaremap to contain SquareTileButtons
  final tileList = new SquareMap(108);

  //handles bottom nav bar onTap
  int _current = 0;
  void _onTap(int i){
    //return to title screen
    if (i == 0) {
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()));
      print('home!');
    //run squareMap's wipeMap
    }else if (i ==1) {
      this.setState(() {
        tileList.wipeMap();
      });
      print('wiped page!');
    }
    //update navbar's currently selected
    setState(() {
      _current = i;
    });  
  }

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
        body: GridView.count(
          crossAxisCount: 9,
          padding: const EdgeInsets.all(1),
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          children: tileList.list, 
        ),
        backgroundColor: Colors.deepPurple[500],
        //bottom navi bar -------------------------------
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepPurple[400],
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.undo),
              title: Text('wipe grid'),
            ),
          ],
          currentIndex: _current,
          selectedItemColor: Colors.deepPurple[200],
          onTap: _onTap,
        ),
      ),
    );
  }
}