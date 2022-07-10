import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dota_heroes/hero_page.dart';
import 'package:http/http.dart' as http;
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = 'https://api.opendota.com/api/heroStats';
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {'Accept': 'application/json'},
    );
    print(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson;
    });

    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Dota 2 Heroes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data == null ? 1 : data.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.grey[800], Colors.red[900]]
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: InkWell(
                    child: Container(
                      child: Text(
                        data[index]['localized_name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HeroPage(
                            data[index]['localized_name'],
                            data[index]['img'],
                            data[index]['primary_attr'],
                            data[index]['attack_type'],
                            data[index]['base_health'],
                            data[index]['base_mana'],
                        ),
                      ));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
