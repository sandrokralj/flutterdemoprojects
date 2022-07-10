import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'new_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.amber : null,

      ),
      home: HomePage(),
      // routes: <String, WidgetBuilder>{
      //   '/newpage': (BuildContext context) => NewPage("New Page"),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer App'),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android?5.0:0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Sandro Kralj'),
              accountEmail: Text('good@good.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('S', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),

              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('S', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ),
              ],

            ),
            ListTile(
              title: Text('Page One'),
              trailing: Icon(Icons.email),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NewPage('Page One')
                  )
                );
              },
            ),
            ListTile(
              title: Text('Page Two'),
              trailing: Icon(Icons.agriculture),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NewPage('Page Two')
                )
                );
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
