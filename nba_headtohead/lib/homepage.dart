import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nba_headtohead/shared/constants.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> teams = ['LA Lakers', 'Miami Heat', 'LA Clippers', 'Boston Celtics', 'Denver Nuggets', 'Toronto Raptors'];
  final List<String> players = ['LeBron James', 'Jimmy Butler', 'Kawhi Leonard', 'Jayson Tatum', 'Nikola Jokic', 'Kyle Lowry'];

  String _currentTeam;
  String _currentPlayer;
  String _opposingPlayer;
  dynamic _points = 0.0;
  dynamic _pointsOpposing = 0.0;
  dynamic _matches;
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text(
          'Head To Head Comparison',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              DropdownButtonFormField(
                decoration: textInputDecoration,
              value: _currentPlayer,
              items: players.map((player) {
                return DropdownMenuItem(
                  value: player,
                  child: Text('$player'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                _currentPlayer = val;
                matchesPlayed();
                pointsScored();
              }),
            ),
            SizedBox(height: 20),
            Text(
              'Points: $_points',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Head to head matches: $_matches',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Points: $_points',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: textInputDecoration,
              value: _opposingPlayer,
              items: players.map((player) {
                return DropdownMenuItem(
                  value: player,
                  child: Text('$player'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                _opposingPlayer = val;
                matchesPlayed();
                pointsOpposingPlayer();

              }),
            ),
          ]),
      ),
      );
  }

  void matchesPlayed() {
    if(_currentPlayer == _opposingPlayer){
      _matches = 'They have not played a match against each other. ';
    }
    else{
      _matches = random.nextInt(100);
    }
  }

  void pointsScored() {
    if(_currentPlayer == _opposingPlayer){
      _points = 0;
    }
    else{
      _points = random.nextInt(100);
    }
  }

  void pointsOpposingPlayer() {
    if(_currentPlayer == _opposingPlayer){
      _points = 0;
    }
    else{
      _pointsOpposing = random.nextInt(100);
    }
  }
}
