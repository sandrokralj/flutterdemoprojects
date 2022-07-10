import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class Transaction {
  final int id;
  final String title;
  final double value;
  final String category;
  final IconData iconData;
  final Color color;
  final databaseReference = FirebaseDatabase.instance.reference();


  Transaction({
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.category,
    @required this.iconData,
    @required this.color
  });

  void createTransactionRecord(){
    databaseReference.child('$id').set({
      'title': title,
      'value': value,
      'category': category,
      'iconData': iconData,
      'color': color,
    });
  }
}

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(
        id: 1,
        title: 'Dinner',
        value: 123.5,
        category: 'Meals',
        iconData: Icons.fastfood,
        color: Color(0xffe8505b)
    ),
    Transaction(
        id: 2,
        title: 'Brithday present',
        value: 49.99,
        category: 'Gifts',
        iconData: Icons.card_giftcard,
        color: Color(0xfffe91ca)
    ),
    Transaction(
        id: 3,
        title: 'PC game',
        value: 25.4,
        category: 'Gaming',
        iconData: Icons.gamepad,
        color: Color(0xfff6d743)
    ),
    Transaction(
        id: 4,
        title: 'Softwares',
        value: 149.99,
        category: 'Business',
        iconData: Icons.work,
        color: Color(0xff40bad5)
    ),
    Transaction(
        id: 5,
        title: 'Books',
        value: 34.99,
        category: 'Entertainment',
        iconData: Icons.casino,
        color: Color(0xfff57b51)
    ),
    Transaction(
        id: 6,
        title: 'Breakfast',
        value: 12.99,
        category: 'Meals',
        iconData: Icons.fastfood,
        color: Color(0xffe8505b)
    ),
  ];


  List<Transaction> get transactions {
    return _transactions;
  }

}