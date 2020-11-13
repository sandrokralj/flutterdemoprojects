import 'package:flutter/material.dart';

// P O R T R A I T
class HomeMobilePortrait extends StatefulWidget {
  HomeMobilePortrait({Key key}) : super(key: key);

  @override
  _HomeMobilePortraitState createState() => _HomeMobilePortraitState();
}

class _HomeMobilePortraitState extends State<HomeMobilePortrait> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _toDoList = [];
  final textController = TextEditingController();

  void addTextToList(){
    setState(() {
      _toDoList.insert(0, textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      body: Padding(
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
            SizedBox(height: 10,),
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
                          title: Text('${_toDoList[index]}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

//L A N D S C A P E
class HomeMobileLandscape extends StatefulWidget {
  HomeMobileLandscape({Key key}) : super(key: key);

  @override
  _HomeMobileLandscapeState createState() => _HomeMobileLandscapeState();
}

class _HomeMobileLandscapeState extends State<HomeMobileLandscape> {

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _toDoList = [];
  final textController = TextEditingController();

  void addTextToList(){
    setState(() {
      _toDoList.insert(0, textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
            ),
            Expanded(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'ToDo Item',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
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
                          title: Text('${_toDoList[index]}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
