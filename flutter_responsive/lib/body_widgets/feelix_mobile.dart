import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/constants/constants.dart';
import 'package:flutter_responsive/feelixprofile/profile_page.dart';

class FeelixMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: Constants().isPortrait(context) ? 1 : 2,
          childAspectRatio: Constants().aspectRatioHomePage(context),
          children: [
            Flex(
                mainAxisSize: MainAxisSize.min,
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: Constants().flexSize(context),
                            child: GestureDetector(
                              onTap: () {
                                print('show profile');
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 1),
                                      pageBuilder: (_, __, ___) =>
                                          ProfilePage(),
                                    ));
                              },
                              child: Hero(
                                tag: 'profile',
                                child: CircleAvatar(
                                  radius: Constants().radius(context),
                                  backgroundColor: Colors.amber[200],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'David',
                              style: TextStyle(
                                  fontSize: Constants().fontSize(context),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                  letterSpacing: 2),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
            Flex(
              mainAxisSize: MainAxisSize.min,
              direction: Axis.horizontal,
              crossAxisAlignment: Constants().crossAxisAlignment(context),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: Constants().aspectRatioHomeButtons(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            onPressed: () {
                              print('planning');
                            },
                            color: Colors.green[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 16, 8),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: Constants().iconSize(context),
                                  ),
                                ),
                                Text(
                                  'Planning',
                                  style: TextStyle(
                                      fontSize: Constants().fontSize(context), color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            onPressed: () {
                              print('happiness');
                            },
                            color: Colors.green[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 16, 8),
                                  child: Icon(
                                    Icons.folder_special,
                                    color: Colors.white,
                                    size: Constants().iconSize(context),
                                  ),
                                ),
                                Text(
                                  'Happiness',
                                  style: TextStyle(
                                      fontSize: Constants().fontSize(context), color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            onPressed: () {
                              print('members');
                            },
                            color: Colors.green[500],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 16, 8),
                                  child: Icon(
                                    Icons.people,
                                    color: Colors.white,
                                    size: Constants().iconSize(context),
                                  ),
                                ),
                                Text(
                                  'Members',
                                  style: TextStyle(
                                      fontSize: Constants().fontSize(context), color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ]),
    );
  }
}
