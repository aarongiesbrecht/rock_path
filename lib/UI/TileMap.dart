import 'package:flutter/material.dart';
import 'dart:math';

import '../UI/SquareTileButton.dart';

class TileMap extends StatefulWidget{

  final int length;
  final List<bool> currentType;
  final bool traverse;
  TileMap(this.length, this.currentType, this.traverse);

  @override
  _TileMapState createState() => _TileMapState(length, currentType, traverse);

}

class _TileMapState extends State<TileMap> {

  //constructor methods
  int length;
  bool traverse;
  List<List<bool>> map;
  //default type set to wall
  List<bool> currentType;

  _TileMapState(this.length, this.currentType, this.traverse);

  //keeps track of start/finish tiles to ensure there is only
  //ever one of each
  int startIndex = 1000; //default value to represent null
  bool hasStart = false;
  List<bool> startPreset = [false, false, true, false];
  int finishIndex = 1000;
  bool hasFinish = false;
  List<bool> finishPreset = [false, false, false, true];

  //initializes the map using default tile type passed from above
  @override
  void initState() {
    map = List.generate(length, (i) => currentType);
    currentType = [false, true, false, false];
    super.initState();
  }

  //called upon constructor update
  @override
  void didUpdateWidget(TileMap oldWidget) {
    //if above state flipped traverse bool
    if (this.traverse != this.widget.traverse){
      this.traverse = this.widget.traverse;
      pathing();
    }else {
      //if update was no a pathing call, call normal update
      this.currentType = this.widget.currentType;
      super.didUpdateWidget(oldWidget);
    }
  }

  //ontap method handed to tiles
  void onTap(int i) {
    //updates tiles type to currently selected type from above layer
    if (map[i] != this.currentType) {
      //if the current tile being replaced was a start/finish we want to 
      //remove the corresponding index so that a nonstart/finish tile does
      //not get removed incorrectly later on
      if (i == startIndex) {
        startIndex = 1000;
      }else if (i == finishIndex) {
        finishIndex = 1000;
      }
      setState(() {
        map[i] = this.currentType;
      });
      //start and finish tiles require extra handling
      if (this.currentType[2]) {
        hasStart = true;
        handleEndPoints(i, 'start');
      }else if (this.currentType[3]) {
        hasFinish = true;
        handleEndPoints(i, 'finish');
      }

    }else {
      //instead of a tile keeping its state if there is no change
      //we set it to empty
      if (i == startIndex) {
        hasStart = false;
        startIndex = 1000;
      }else if (i == finishIndex) {
        hasFinish = false;
        finishIndex = 1000;
      }
      setState(() {
        map[i] = [true, false, false, false];
      });
    }
    print('tapped tile: $i');
  }

  //ensures only one start/finish exists at a time
  void handleEndPoints(int i, String type) {
    //handle start points
    if (hasStart && type == 'start') {
      setState(() {
        if (startIndex != 1000) {
          map[startIndex] = [true, false, false, false];
        }
        startIndex = i;
      });
      print('a start was replaced');
      //finish points
    } else if (hasFinish && type == 'finish') {
      setState(() {
        if (finishIndex != 1000) {
          map[finishIndex] = [true, false, false, false];
        }
      });
      finishIndex = i;
      print('a finish was replaced');
    }

    //handle end points

  }

  void pathing() {
    print('pathing run');
    //preset path tiletype
    List<bool> path = [false, false, false, false];
    //init path
    List<int> workingPath = [startIndex];
    List<List<bool>> workingMap;
    List<bool> pathRow = [false,false,false,false,false,false,
      false,false,false,false,false,false];
    workingMap = List.generate(16, (i) => pathRow);
    //make grid from map tp make for easier pathing
    for (int i = 0; i<length; i++) {
      workingMap[1~/12][i%12] = map[i][0];
    }
    print('map created');
    for ( int i = 0; i < 16; i++) {
      print(workingMap[i]);
    }
    

    //dir list for easier pathing
    List<int> directions = [0,1,2,3];

    //main loop, continues as long as there are available paths
    while (workingPath.isNotEmpty) {
      //cycle directions in random order
      break;//tmp
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GridView.count(
        crossAxisCount: 12,
        padding: const EdgeInsets.all(0.5),
        mainAxisSpacing: 0.5,
        crossAxisSpacing: 0.5,
        primary: false,
        //this mess is needed to map our tile data to a tile list while maintaining
        //individual tile indices
        children: this.map
          .asMap()
          .map((index, value) => 
            MapEntry<int, SquareTileButton>(index, SquareTileButton(value, () => 
              onTap(index), index)))
              .values.toList(),
      ),
    );
  }
}