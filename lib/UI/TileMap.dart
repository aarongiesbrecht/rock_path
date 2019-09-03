import 'package:flutter/material.dart';

import '../UI/SquareTileButton.dart';

class TileMap extends StatefulWidget{

  final int length;
  List<bool> currentType;
  TileMap(this.length, this.currentType);

  @override
  _TileMapState createState() => _TileMapState(length, currentType);

}

class _TileMapState extends State<TileMap> {

  int length;
  List<List<bool>> map;
  //default type set to wall
  List<bool> currentType;

  _TileMapState(this.length, this.currentType);

  @override
  void initState() {
    initMap();
    super.initState();
  }

  @override
  void didUpdateWidget(TileMap oldWidget) {
    //add update method
    super.didUpdateWidget(oldWidget);
  }

  //blank data map made with a preset tile
  void initMap() {
    List<bool> presetTile = [true, false, false, false];
    map = List.generate(length, (i) => presetTile);
  }

  //ontap method handed to tiles
  void onTap(int i) {
    setState(() {
      map[i] = currentType;
    });
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