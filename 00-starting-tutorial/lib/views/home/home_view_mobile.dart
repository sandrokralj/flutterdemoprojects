import 'package:flutter/material.dart';
import 'package:responsive_architecture/viewmodels/home_view_model.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer.dart';
import 'package:responsive_architecture/widgets/base_model_widget.dart';
import '';
// contains the widgets that will be used for mobile layout of home
// portrait and landscape

class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            //drawer icon
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
          ),
          model.responsiveValues(context),
          //textfield todos
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: _formKey,
              controller: model.textController,
              validator: (value) {
                if(value.isEmpty)
                  {
                    return 'Enter some text';
                  }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'To Do Item',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          //button add
          Center(
            child: RaisedButton(
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
                if(_formKey.currentState.validate()) {
                  model.addTextToList();
                }
              },
            ),
          ),
          //list todos
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: model.toDoList.length,
                itemBuilder: (context, index) {
                  int counter = 0;
                  final toDoItem = model.toDoList[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      color: Colors.lightBlue,
                      child: ListTile(
                        title: Text('${model.toDoList[index]}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  final _formKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppDrawer(),
          model.responsiveValues(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: _formKey,
                controller: model.textController,
                validator: (value) {
                  if(value.isEmpty)
                  {
                    return 'Enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'To Do Item',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: ButtonTheme(
              minWidth: 90,
              buttonColor: Colors.grey[400],
              child: RaisedButton(
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
                  if(_formKey.currentState.validate()) {
                    model.addTextToList();
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: model.toDoList.length,
                itemBuilder: (context, index) {
                  int counter = 0;
                  final toDoItem = model.toDoList[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      color: Colors.lightBlue,
                      child: ListTile(
                        title: Text('${model.toDoList[index]}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
