import 'package:flutter/material.dart';
import 'package:flutter_responsive_portfolio/widgets/social_info.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileInfo extends StatelessWidget {
  final height;
  final width;

  ProfileInfo({Key key, this.height, this.width}) : super(key: key);

  profileImage(context) => AnimatedContainer(
    duration: Duration(milliseconds: 1000),
    height: height,
    width: width,
    decoration: BoxDecoration(
      backgroundBlendMode: BlendMode.luminosity,
      color: Colors.lightBlue,
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    ),
  );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(
          color: Colors.blue
        ),
      ),
      Text(
        "Sandro\nSandor",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n"
            " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n"
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi. ",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () {},
            padding: EdgeInsets.all(10),
          ),
          SizedBox(width: 20,),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say HI!"),
            color: Colors.red,
            onPressed: () {},
            padding: EdgeInsets.all(10),
          ),
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileImage(context),
          profileData,
        ],
      ),
      mobile: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
          profileData
        ],
      ),
    );
  }
}
