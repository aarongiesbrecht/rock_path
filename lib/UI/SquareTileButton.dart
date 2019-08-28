import 'package:flutter/material.dart';
import '../pages/SquareMapPage.dart';

class SquareTileButton extends StatelessWidget {

  final int _index;
  final bool _isEmpty;
  final VoidCallback _onTap;

  SquareTileButton(this._index, this._isEmpty, this._onTap);

  //expandable square button with purple infill and a dark border
  @override
  Widget build(BuildContext context) {
    return new Material(
      //color is a slightly darker shade if tile is full
      color: _isEmpty == true ? Colors.deepPurple[100] : Colors.deepPurple[300],
      child: new InkWell(
        onTap: _onTap,
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

  int get getIndex => _index;

  bool get getEmpty => _isEmpty;

}
