import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

const Color lightBrown = Color.fromARGB(255, 205, 193, 180);
const Color darkBrown = Color.fromARGB(255, 187, 173, 160);
const Color tan = Color.fromARGB(255, 238, 228, 218);
const Color greyText = Color.fromARGB(255, 119, 110, 101);

const Map<int, Color> numTileColor = {
  2: tan,
  4: tan,
  8: Color.fromARGB(255, 242, 177, 121),
  16: Color.fromARGB(255, 245, 149, 99),
  32: Color.fromARGB(255, 246, 124, 95),
  64: const Color.fromARGB(255, 246, 95, 64),
  128: const Color.fromARGB(255, 235, 208, 117),
  256: const Color.fromARGB(255, 237, 203, 103),
  512: const Color.fromARGB(255, 236, 201, 85),
  1024: const Color.fromARGB(255, 229, 194, 90),
  2048: const Color.fromARGB(255, 232, 192, 70),
};


void main() {
  runApp(TwentyFortyEightApp());
}

class Tile{
  final int x;
  final int y;
  int val;

  Animation<double> animatedX;
  Animation<double> animatedY;
  Animation<int> animatedValue;
  Animation<double> scale;

  Tile(this.x, this.y, this.val){
    resetAnimations();
  }

  void resetAnimations(){
    animatedX = AlwaysStoppedAnimation(this.x.toDouble());
    animatedY = AlwaysStoppedAnimation(this.y.toDouble());
    animatedValue = AlwaysStoppedAnimation(this.val);
    scale = AlwaysStoppedAnimation(1.0);
  }

  void moveTo(Animation<double> parent, int x, int y) {
    animatedX = Tween(begin: this.x.toDouble(), end: x.toDouble())
        .animate(CurvedAnimation(parent: parent, curve: Interval(0, .5)));
    animatedY = Tween(begin: this.y.toDouble(), end: y.toDouble())
        .animate(CurvedAnimation(parent: parent, curve: Interval(0, .5)));
  }

  void bounce(Animation<double> parent){
    scale = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 1.0),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 1.0),
    ]).animate(CurvedAnimation(parent: parent, curve: Interval(.5, 1)));
  }

  void appear(Animation<double> parent) {
    scale = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: parent, curve: Interval(.5, 1)));
  }

  void changeNumber(Animation<double> parent, int newValue) {
    animatedValue = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(val), weight: .01),
      TweenSequenceItem(tween: ConstantTween(val), weight: .99),
    ]).animate(CurvedAnimation(parent: parent, curve: Interval(.5, 1)));
  }
}

class TwentyFortyEightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048',
      home: TwentyFortyEight(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TwentyFortyEight extends StatefulWidget {
  @override
  _TwentyFortyEightState createState() => _TwentyFortyEightState();
}

class _TwentyFortyEightState extends State<TwentyFortyEight> with TickerProviderStateMixin {
  AnimationController controller;

  List<List<Tile>> grid =
    List.generate(4, (y) => List.generate(4, (x) => Tile(x, y, 0)));
  List<Tile> toAdd = [];
  Iterable<Tile> get flattenedGrid => grid.expand((e) => e);
  Iterable<List<Tile>> get cols =>
      List.generate(4, (x) => List.generate(4, (y) => grid[y][x]));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        toAdd.forEach((element) {
          grid[element.y][element.x].val = element.val;
        });
        flattenedGrid.forEach((element) {
          element.resetAnimations();
        });
        toAdd.clear();
      }
    });


    grid[Random().nextInt(4)][Random().nextInt(4)].val = 2;
    grid[Random().nextInt(4)][Random().nextInt(4)].val = 2;
    grid[Random().nextInt(4)][Random().nextInt(4)].val = 8;
    grid[Random().nextInt(4)][Random().nextInt(4)].val = 16;

    flattenedGrid.forEach((element) => element.resetAnimations());
  }



  void addNewTile() {
    List<Tile> empty = flattenedGrid.where((e) => e.val == 0).toList();
    empty.shuffle();
    toAdd.add(Tile(empty.first.x, empty.first.y, 2)..appear(controller));
  }

  @override
  Widget build(BuildContext context) {
    double gridSize = MediaQuery.of(context).size.width - 16.0 * 2;
    double tileSize = (gridSize - 4.0 * 2) / 4;
    List<Widget> stackItems = [];
    stackItems.addAll(flattenedGrid.map((e) => Positioned(
        left: e.x * tileSize,
        top: e.y * tileSize,
        width: tileSize,
        height: tileSize,
        child: Center(
            child: Container(
              width: tileSize - 4.0 * 2,
              height: tileSize - 4.0 * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: lightBrown,
              ),
            )
        ),
      )));
    stackItems.addAll([flattenedGrid, toAdd].expand((e) => e).map((e) => AnimatedBuilder(
        animation:  controller, builder: (context, child) => e.animatedValue.value == 0
        ? SizedBox()
        : Positioned(
            left: e.animatedX.value * tileSize,
            top: e.animatedY.value * tileSize,
            width: tileSize,
            height: tileSize,
          child: Center(
            child: Container(
              width: (tileSize - 4.0 * 2) * e.scale.value,
              height: (tileSize - 4.0 * 2) * e.scale.value,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8.0),
                color: numTileColor[e.animatedValue.value],
              ),
              child: Center(
                child: Text(
                    '${e.animatedValue.value}',
                  style: TextStyle(
                    color: e.animatedValue.value <=4 ? greyText : Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
            ),
          )
      ),
    ))));


    return Scaffold(
      appBar: AppBar(
        title: Text(
            '2048',
          style: TextStyle(
            color: greyText,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        backgroundColor: tan,
        centerTitle: true,
      ),
      backgroundColor: tan,
      body: Center(

        child: Column(
          children: [
            // SizedBox(height: 20,),
            // RaisedButton(
            //     child: Text(
            //       'Restart',
            //       style: TextStyle(
            //         color: greyText,
            //       ),
            //     ),
            //     onPressed: () {
            //
            //     },
            // ),
            SizedBox(height: 20,),
            Container(
              width: gridSize,
              height: gridSize,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: darkBrown,
              ),
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  if(details.velocity.pixelsPerSecond.dy < -150 && canSwipeUp()){
                    //swipe up
                    doSwipe(swipeUp);
                  }
                  else if (details.velocity.pixelsPerSecond.dy > 150 && canSwipeDown()){
                    //swipe down
                    doSwipe(swipeDown);
                  }
                },
                onHorizontalDragEnd: (details) {
                  if(details.velocity.pixelsPerSecond.dx < -100 && canSwipeLeft()){
                    //swipe left
                    doSwipe(swipeLeft);
                  }
                  else if(details.velocity.pixelsPerSecond.dx > 100 && canSwipeRight()){
                    //swipe right
                    doSwipe(swipeRight);
                  }

                },
                child: Stack(
                  children: stackItems,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doSwipe(void Function() swipeFn) {
    setState(() {
      swipeFn();
      //add new tile
      addNewTile();
      controller.forward(from: 0);
    });
  }

  bool canSwipeLeft() => grid.any(canSwipe);
  bool canSwipeRight() => grid.map((e) => e.reversed.toList()).any(canSwipe);

  bool canSwipeUp() => cols.any(canSwipe);
  bool canSwipeDown() => cols.map((e) => e.reversed.toList()).any(canSwipe);





  bool canSwipe(List<Tile> tiles) {
    for(int i = 0; i < tiles.length; i++){
      if(tiles[i].val == 0){
        if(tiles.skip(i + 1).any((e) => e.val != 0)) {
          return true;
        }
      }
      else {
        Tile nextNonZero =
          tiles.skip(i + 1).firstWhere((element) => element.val != 0, orElse: () => null);
        if(nextNonZero != null && nextNonZero.val == tiles[i].val){
          return true;
        }
      }
    }
    return false;
  }

  void swipeLeft() => grid.forEach(mergeTiles);
  void swipeRight() => grid.map((e) => e.reversed.toList()).forEach(mergeTiles);
  void swipeUp() => cols.forEach(mergeTiles);
  void swipeDown() => cols.map((e) => e.reversed.toList()).forEach(mergeTiles);

  void mergeTiles(List<Tile> tiles) {
    for(int i = 0; i< tiles.length; i++){
      Iterable<Tile> toCheck =
          tiles.skip(i).skipWhile((value) => value.val == 0);
      if(toCheck.isNotEmpty) {
        Tile t = toCheck.first;
        Tile merge =
            toCheck.skip(1).firstWhere((t) => t.val !=0, orElse: () => null);
        if(merge != null && merge.val != t.val){
          merge = null;
        }
        if(tiles[i] != t || merge != null){
          int resultValue = t.val;
          // animate the tile at position t
          t.moveTo(controller, tiles[i].x, tiles[i].y);
          if(merge != null) {
            resultValue += merge.val;
            //move merge tile
            merge.moveTo(controller, tiles[i].x, tiles[i].y);
            merge.bounce(controller);
            merge.changeNumber(controller, resultValue);
            merge.val = 0;
            t.changeNumber(controller, 0);
          }
          t.val = 0;
          tiles[i].val = resultValue;
        }
      }
    }
  }
}
