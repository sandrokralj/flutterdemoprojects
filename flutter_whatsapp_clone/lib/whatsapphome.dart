import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/pages/calls.dart';
import 'package:flutter_whatsapp_clone/pages/camera.dart';
import 'package:flutter_whatsapp_clone/pages/chat.dart';
import 'package:flutter_whatsapp_clone/pages/status.dart';

class WhatsAppHome extends StatefulWidget {

  var cameras;
  WhatsAppHome(this.cameras);

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: 'CHATS',),
            Tab(text: 'STATUS',),
            Tab(text: 'CALLS',)
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5),),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(widget.cameras),
          ChatScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.message, color: Colors.white,),
        onPressed: () {
          print('Open chats');
        },
      ),
    );
  }
}
