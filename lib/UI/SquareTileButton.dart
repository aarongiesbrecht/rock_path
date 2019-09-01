import 'package:flutter/material.dart';

class SquareTileButton extends StatefulWidget {

  final List<bool> tileType;
  final VoidCallback onTap;

  SquareTileButton({Key key, this.tileType, this.onTap}): super(key: key);

  @override
  _SquareTileButtonState createState() => _SquareTileButtonState(tileType);
}

class _SquareTileButtonState extends State<SquareTileButton> {

  List<bool> tileType;
  Color color;
  _SquareTileButtonState(this.tileType);

  String currentType;

  @override
  void initState() {    
    for (int i; i<4; i++) {
      if (tileType[i]) {
        switch (i) {
          case 0:
            currentType = 'empty';
            break;
          case 1:
            currentType = 'wall';
            break;
          case 2:
            currentType = 'start';
            break;
          case 3:
            currentType = 'finish';
            break;
          default:
        }
      }
    }
    super.initState();
  }

  @override
  void didUpdateWidget(SquareTileButton oldWidget) {
    this.tileType = this.widget.tileType;
    super.didUpdateWidget(oldWidget);  
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      //color is a slightly darker shade if tile is full
      color: color,
      child: new InkWell(
        onTap: widget.onTap,
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
  bool get getEmpty => widget.tileType;
}
