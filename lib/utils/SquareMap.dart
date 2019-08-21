import 'package:rock_path/pages/SquareMapPage.dart';

import '../UI/SquareTileButton.dart';

class SquareMap {
  final int length;
  List<SquareTileButton> _map;

  SquareMap(this.length){
    _map = List.generate(length, (i) => new SquareTileButton(i, true, () => _onTap(i)));
  }

  //pull current widget flip "state" and reprint
  void _onTap(int i) {
  bool _current = !_map[i].getEmpty;
  _map[i] = new SquareTileButton(i, _current, () => _onTap(i));
  print('$i set to $_current');
  }

  void wipeMap(){
    bool _current;
    for (int i = 0; i < _map.length; i++) {
      _current = _map[i].getEmpty;
      if (!_current) {
        _map[i] = new SquareTileButton(i, true, () => _onTap(i));
      }
    }
  }

  //returns entire map
  List get list => _map;
  //returns bool state of specific cell
  bool getEmpty(int i) {
    return _map[i].getEmpty;
  }
}  