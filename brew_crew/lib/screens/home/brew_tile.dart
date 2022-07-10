import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/home.dart';

class BrewTile extends StatelessWidget {

  final Brew brew;
  BrewTile({this.brew});


  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm(),
        );
      });
    }

    // void something() {
    //   if(ListTile().title == brew.name) {
    //     ListTile(onTap: () => _showSettingsPanel());
    //   }
    //   else { print('Somethings wrong');}
    // }

    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          onTap: () => _showSettingsPanel(),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s) with ${brew.milk} milk.'),
        ),
      ),
    );
  }
}
