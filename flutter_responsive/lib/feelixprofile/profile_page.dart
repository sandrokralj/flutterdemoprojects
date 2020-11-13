import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/constants/constants.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'David',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Constants().fontSizeProfilePage(context)),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: Constants().isPortrait(context) ? 1 : 2,
          childAspectRatio: Constants().aspectRatioProfile(context),
          children: [
            Flex(
                mainAxisSize: MainAxisSize.min,
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ContainerDetails(
                            info: 'First Name: ',
                            infoData: 'David',
                            colors: Colors.green,
                          ),
                        ),
                        Expanded(
                          child: ContainerDetails(
                            info: 'Last Name: ',
                            infoData: 'Hume',
                            colors: Colors.green[900],
                          ),
                        ),
                        Expanded(
                          child: ContainerDetails(
                            info: 'Birthday: ',
                            infoData: '7 May 1711',
                            colors: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
            Flex(
              mainAxisSize: MainAxisSize.min,
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Photo: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constants().fontSizeProfilePage(context),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: 'profile',
                              child: CircleAvatar(
                                backgroundColor: Colors.amber[200],
                                radius: Constants().profilePageAvatarRadius(context),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green[900],
                              radius: Constants().profilePageSmallAvatarRadius(context),
                              child: Icon(
                                Icons.camera_alt,
                                size: Constants().cameraIconSize(context),
                                color: Colors.white,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}

class ContainerDetails extends StatelessWidget {
  final String info;
  final String infoData;
  final Color colors;
  const ContainerDetails({
    Key key,
    this.info,
    this.infoData,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: colors,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              info,
              style: TextStyle(
                  fontSize: Constants().fontSizeProfilePage(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5),
            ),
            Text(
              infoData,
              style: TextStyle(
                  fontSize: Constants().fontSizeProfilePage(context), color: Colors.white, letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
