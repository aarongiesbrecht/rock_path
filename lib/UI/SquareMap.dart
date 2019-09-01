import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../UI/SquareTileButton.dart';

class TileMap extends StatefulWidget{

  final int length;
  TileMap({Key key, this.length}): super(key: key);

  @override
  _TileMapState createState() => _TileMapState(length);

}

class _TileMapState extends State<TileMap> {

  int length;
  List<Map<String, bool>> map; 

  _TileMapState(this.length);

  @override
  void initState() {
    //add TileMap creation
    super.initState();
  }

  @override
  void didUpdateWidget(TileMap oldWidget) {
    //add update method
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GridView.count(
        crossAxisCount: 9,
        padding: const EdgeInsets.all(1),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        children: ,
        primary: false,
      ),
    );
  }

}