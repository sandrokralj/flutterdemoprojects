import 'package:flutter/material.dart';

class HomeViewTablet extends StatefulWidget {
  const HomeViewTablet({Key key}) : super(key: key);
  @override
  _HomeViewTabletState createState() => _HomeViewTabletState();
}

class _HomeViewTabletState extends State<HomeViewTablet> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _toDoList = [];
  final textController = TextEditingController();

  void addTextToList() {
    setState(() {
      _toDoList.insert(0, textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
              ),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'ToDo Item',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'ADD',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  addTextToList();
                  textController.clear();
                },
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _toDoList.length,
                    itemBuilder: (context, index) {
                      int counter = 0;
                      final toDoItem = _toDoList[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          color: Colors.lightBlue,
                          child: ListTile(
                            title: Text(
                              '${_toDoList[index]}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      )
    ];
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Column(children: children),
    );
  }
}
