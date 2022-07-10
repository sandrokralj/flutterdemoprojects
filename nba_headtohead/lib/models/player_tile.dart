import 'package:nba_headtohead/homepage.dart';
import 'package:flutter/material.dart';
import 'players.dart';

class PlayerTile extends StatelessWidget {

  final Players players;
  PlayerTile({this.players});

  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(''),
        ),
      ),
    );
  }
}
