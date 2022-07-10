import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoApp'),
      ),
      body: _cryptoWidget(

      ),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, index){
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency, color);
            },
          ),
        ),
      ]),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color){
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
          currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange){
    TextSpan priceTextWidget = new TextSpan(text: '\$$priceUSD\n',
    style: TextStyle(color: Colors.black));
    String percentageChangeText = '1 hour: $percentageChange%';
    TextSpan percentageChangeTextWidget;
    if(double.parse(percentageChange) >0){
      percentageChangeTextWidget = TextSpan(text: percentageChangeText,
      style: TextStyle(color: Colors.green));
    }
    else{
      percentageChangeTextWidget = TextSpan(text: percentageChangeText,
          style: TextStyle(color: Colors.red));
    }

    return RichText(
      text: TextSpan(
        children: [priceTextWidget, percentageChangeTextWidget],
      ),
    );
  }
}
