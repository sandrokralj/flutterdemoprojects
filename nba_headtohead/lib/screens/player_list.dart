import 'package:flutter/material.dart';
import 'package:nba_headtohead/models/players.dart';
import 'package:provider/provider.dart';

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {

    final players = Provider.of<List<Players>>(context) ?? [];

    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return ;
      },
    );
  }
}
