import 'package:flutter/material.dart';

import './SquareMapPage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.deepPurple[400],
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SquareMapPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('rock', style: new TextStyle(color: Colors.deepPurple[100], fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text('path', style: new TextStyle(color: Colors.deepPurple[100], fontSize: 50.0, fontWeight: FontWeight.bold)),
          ],       
        ),
      ),     
    );
  }
}