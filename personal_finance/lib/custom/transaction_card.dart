import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personal_finance/providers/transactions.dart';
import 'transaction_item.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final double height;

  const TransactionCard(this.height);


  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  int _date = 16;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final providedTransactions = Provider.of<Transactions>(context);

    return Positioned(
      bottom: 0,
      left: mediaQuery.size.width * .03,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: mediaQuery.size.width * .94,
        height: mediaQuery.size.height * widget.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
          ),

        ),
        child: Column(
            children: <Widget>[
              Container(
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 12),
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                _date--;
                              });
                            },
                            child: const Icon(Icons.arrow_left),
                          ),
                          Text(
                            '$_date ${DateFormat('MMMM yyyy').format(DateTime.now())}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _date++;
                              });
                            },
                            child: const Icon(Icons.arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: providedTransactions.transactions.length,
                  itemBuilder: (context, i) {
                    return TransactionItem(providedTransactions.transactions[i]);
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
