import 'package:flutter/material.dart';
import 'package:responsive_architecture/viewmodels/home_view_model.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer.dart';
import 'package:responsive_architecture/widgets/base_model_widget.dart';

class HomeViewTablet extends BaseModelWidget<HomeViewModel> {
  final _formKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    var children = [
      //text field
      model.responsiveValues(context),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: _formKey,
          controller: model.textController,
          validator: (value) {
            if (value.isEmpty) {
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
      SizedBox(
        height: 10,
      ),
      // button add
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
          if (_formKey.currentState.validate()) {
            model.addTextToList();
          }
        },
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
                    title: Text(
                      '${model.toDoList[index]}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }),
      ),
      AppDrawer(),
    ];

    var childrenRow = [
      //text field
      model.responsiveValues(context),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            key: _formKey,
            controller: model.textController,
            validator: (value) {
              if (value.isEmpty) {
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
      SizedBox(
        height: 10,
      ),
      // button add
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
          if (_formKey.currentState.validate()) {
            model.addTextToList();
          }
        },
      ),
      // list todos
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
                    title: Text(
                      '${model.toDoList[index]}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }),
      ),
      AppDrawer(),
    ];
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        body: orientation == Orientation.portrait
            ? Column(
                children: children,
              )
            : Row(
                children: childrenRow.reversed.toList(),
              ));
  }
}
