import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items = List<String>.generate(
          (30),
          (index) => 'Items ${index+1}'
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe to dismiss'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index){
          return Dismissible(
            key: Key(items[index]),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Item dismissed.'),
              ));
            },
            background: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    Text('Move to trash', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            child: ListTile(
              title: Text('${items[index]}'),
            ),
            // confirmDismiss: (DismissDirection direction) async {
            //   return await showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: const Text("Confirm"),
            //         content: const Text("Are you sure you wish to delete this item?"),
            //         actions: <Widget>[
            //           FlatButton(
            //               onPressed: () => Navigator.of(context).pop(true),
            //               child: const Text("DELETE")
            //           ),
            //           FlatButton(
            //             onPressed: () => Navigator.of(context).pop(false),
            //             child: const Text("CANCEL"),
            //           ),
            //         ],
            //       );
            //     },
            //   );
            // },
          );
        }
      ),
    );
  }
}
