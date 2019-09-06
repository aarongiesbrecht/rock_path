import '../UI/TileMap.dart';

//randomly passes through the given maze adding each chosen tile to a stack
//when a dead end is reached the stack pops and the search continues, always
//avoiding tile
List<int> randomBackTrack(List<List<bool>> map) {

  /*
    the following need to be tracked in order to successfully
    navigate the map and return a list if indexes to travel through:
    - a list acting as a stack to track movment
    - an index to reference the start and finish tiles in the map
    - a working bool map to mark walls/visited spaces
  */
  List<int> path;
  int startIndex;
  int finishIndex;
  List<bool> workingMap;

}