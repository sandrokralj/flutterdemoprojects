import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = 'https://swapi.dev/api/people/';
  List data;

  @override
  void initState() {

    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      //encode the url
      Uri.encodeFull(url),
      // only accept json response
      headers: {'Accept': 'application/json'},
    );
    print(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['results'];
    });

    return 'Success';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve JSON via HTTP Get'),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      child: Text(
                        data[index]['name']
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
