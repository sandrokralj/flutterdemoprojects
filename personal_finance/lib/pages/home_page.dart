import 'package:flutter/material.dart';
import 'package:personal_finance/custom/header.dart';
import 'package:personal_finance/custom/transaction_card.dart';
import 'package:personal_finance/custom/new_transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  double _height = .5;
  double _opacity = .9;

  void _addTransaction() {
    setState(() {
      _height = .1;
      _opacity = 1;

    });
  }

  void _done() {
    setState(() {
      _height = .5;
      _opacity = .9;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          //implement drawer
          icon: const Icon(Icons.short_text),
          onPressed: () {

          },
        ),
        centerTitle: true,
        title: const Text(
          'Personal Finance',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            //implement profile
              icon: const Icon(Icons.person_outline),
              onPressed: () {
              },
          ),
        ],
      ),
      body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Header(_addTransaction),
                NewTransaction(
                    _opacity,
                    _done,
                ),
              ],
            ),
            TransactionCard(_height),
          ]),
    );
  }
}
