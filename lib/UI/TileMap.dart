import 'package:flutter/material.dart';

import '../UI/SquareTileButton.dart';

class TileMap extends StatefulWidget{

  final int length;
  final List<bool> currentType;
  TileMap(this.length, this.currentType);

  @override
  _TileMapState createState() => _TileMapState(length, currentType);

}

class _TileMapState extends State<TileMap> {

  //constructor methods
  int length;
  List<List<bool>> map;
  //default type set to wall
  List<bool> currentType;

  _TileMapState(this.length, this.currentType);

  //keeps track of start/finish tiles to ensure there is only
  //ever one of each
  int startIndex;
  bool hasStart = false;
  int finishIndex;
  bool hasFinish = false;

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
    this.currentType = this.widget.currentType;
    super.didUpdateWidget(oldWidget);
  }

  //ontap method handed to tiles
  void onTap(int i) {
    //updates tiles type to currently selected type from above layer
    if (map[i] != this.currentType) {
      setState(() {
        map[i] = this.currentType;
      });
    } else {
      //instead of a tile keeping its state if there is no change
      //we set it to empty
      setState(() {
        map[i] = [true, false, false, false,];
      });
    }
    print('tapped tile: $i');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GridView.count(
        crossAxisCount: 9,
        padding: const EdgeInsets.all(1),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        //this mess is needed to map our tile data to a tile list while maintaining
        //individual tile indices
        children: this.map
          .asMap()
          .map((index, value) => 
            MapEntry<int, SquareTileButton>(index, SquareTileButton(value, () => 
              onTap(index), index)))
              .values.toList(),
        primary: false,
      ),
    );
  }

}