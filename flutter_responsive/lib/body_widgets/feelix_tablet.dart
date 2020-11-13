import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeelixTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var iconSize = getValueForScreenType<double>(
      context: context,
      tablet: isPortrait ? 70 : 80,
      mobile: isPortrait ? 32 : 50,
    );
    var fontSize = getValueForScreenType<double>(
      context: context,
      tablet: isPortrait
          ? ScreenUtil().setSp(38, allowFontScalingSelf: true)
          : ScreenUtil().setSp(40, allowFontScalingSelf: true),
      mobile: isPortrait
          ? ScreenUtil().setSp(32, allowFontScalingSelf: true)
          : ScreenUtil().setSp(36, allowFontScalingSelf: true),
    );

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: isPortrait ? 1 : 2,
          childAspectRatio: isPortrait ? 1.6 : 0.9,
          children: [
            Flex(
                mainAxisSize: MainAxisSize.min,
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: isPortrait ? 8 : 10,
                            child: GestureDetector(
                              onTap: () {
                                print('show profile');
                              },
                              child: CircleAvatar(
                                radius: isPortrait ? 175 : 200,
                                backgroundColor: Colors.amber[200],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'David',
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                  letterSpacing: 2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
            Flex(
                mainAxisSize: MainAxisSize.min,
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
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
                                    size: 70,
                                  ),
                                ),
                                Text(
                                  'Planning',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
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
                                    size: 70,
                                  ),
                                ),
                                Text(
                                  'Happiness',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
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
                                    size: 70,
                                  ),
                                ),
                                Text(
                                  'Members',
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ]),
    );
  }
}
