import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance/providers/transactions.dart';
import 'header.dart';
import 'package:provider/provider.dart';

class NewTransaction extends StatelessWidget {
  final double opacity;
  final Function done;

  NewTransaction(this.opacity, this.done);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        color: Colors.white.withOpacity(opacity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              readOnly: false,
              initialValue: 'Name of the expense',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Title',
                border: OutlineInputBorder(),
                contentPadding:  EdgeInsets.all(12),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    readOnly: false,
                    initialValue: 'Input money',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      icon: Icon(Icons.attach_money),
                      contentPadding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: TextFormField(
                    readOnly: false,
                    initialValue: 'Enter category',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      icon: Icon(Icons.work),
                      contentPadding: const EdgeInsets.all(8),
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OutlineButton.icon(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.today),
                    label: Text(
                      DateFormat('MMMM dd, yyyy').format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                RaisedButton.icon(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onPressed: () {

                  },
                  icon: Icon(Icons.add, color: Colors.white,),
                  label: Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
