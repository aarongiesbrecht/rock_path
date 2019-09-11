import 'package:flutter/material.dart';

class SquareTileButton extends StatefulWidget {

  final List<bool> tileType;
  final VoidCallback onTap;
  final int index;
  final bool isPath;

  SquareTileButton( @required this.tileType, @required this.onTap, @required this.index, @required this.isPath);

  @override
  _SquareTileButtonState createState() => _SquareTileButtonState(tileType, onTap, index, isPath);
}

class _SquareTileButtonState extends State<SquareTileButton> {

  bool isPath;
  List<bool> tileType;
  final VoidCallback onTap;
  final int index;
  Color color;
  _SquareTileButtonState(this.tileType, this.onTap, this.index, this.isPath);

  String currentType;

  @override
  void initState() {    
    updateTile();
    super.initState();
  }

  @override
  void didUpdateWidget(SquareTileButton oldWidget) {
    this.tileType = this.widget.tileType;
    updateTile();
    super.didUpdateWidget(oldWidget);  
  }

  //checks current tiletype and updates tiles current type and color
  void updateTile() {
    for (int i = 0; i<4; i++) {
      if (tileType[i]) {
        switch (i) {
          case 0:
            currentType = 'empty';
            color = Colors.deepPurple[100];
            break;
          case 1:
            currentType = 'wall';
            color = Colors.deepPurple[300];
            break;
          case 2:
            currentType = 'start';
            color = Colors.greenAccent[100];
            break;
          case 3:
            currentType = 'finish';
            color = Colors.red;
            break;
          default:
        }
      }
    }
    if (isPath) {
      color = Colors.red[900];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      //color is a slightly darker shade if tile is full
      color: color,
      child: new GestureDetector(
        onTap: () => onTap(),
        onDoubleTap: () => print('tile $index type: $currentType'),
        child: new Center(
          child: new Container(
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.deepPurple[500], width: 2.0)
            ),
          ),
        ),
      )
    );
  }
  String get getType => currentType;
  void setCurrentType(List<bool> newType) {
    tileType = newType;
    updateTile();
  }
}
