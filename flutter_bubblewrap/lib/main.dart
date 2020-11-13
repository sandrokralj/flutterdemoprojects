import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  bool isUnpressed = true;
  List<bool> pressedButtons = List<bool>();

  void pressedButton(int index) {
    setState(() {
      isPressed = !isPressed;
      isUnpressed = !isUnpressed;
      pressedButtons.add(isPressed);
    });
  }

  // void unpressButton(int index) {
  //   setState(() {
  //     isPressed.remove(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BubbleWrap'),
      ),
      body: NeumorphicBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  // ignore: unrelated_type_equality_checks
                  child: pressedButtons[index]
                      ? NeumorphicCheckbox(
                          value: isPressed,
                          style: NeumorphicCheckboxStyle(
                            boxShape: NeumorphicBoxShape.circle(),
                            selectedColor: Colors.grey[400],
                            unselectedDepth: 25
                          ),
                          onChanged: (value) {
                            pressedButton(index);
                          },
                        )
                      : NeumorphicCheckbox(
                          value: isPressed,
                          style: NeumorphicCheckboxStyle(
                            boxShape: NeumorphicBoxShape.circle(),
                            selectedColor: Colors.grey[800],
                              unselectedDepth: 25
                          ),
                          onChanged: (value) {
                            pressedButton(index);
                          },
                        ));
            },
          ),
        ),
      ),
    );
  }
}
