import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  double number1 = 0;
  double number2 = 0;
  double sum = 0;

  final TextEditingController t1 = new TextEditingController(text: '0');
  final TextEditingController t2 = new TextEditingController(text: '0');


  void addNumbers() {
    setState(() {
      number1 = double.parse(t1.text);
      number2 = double.parse(t2.text);
      sum = number1 + number2;

    });
  }
  void substractNumbers() {
    setState(() {
      number1 = double.parse(t1.text);
      number2 = double.parse(t2.text);
      sum = number1 - number2;

    });
  }
  void multiplyNumbers() {
    setState(() {
      number1 = double.parse(t1.text);
      number2 = double.parse(t2.text);
      sum = number1 * number2;

    });
  }
  void divideNumbers() {
    setState(() {
      number1 = double.parse(t1.text);
      number2 = double.parse(t2.text);
      sum = number1 / number2;

    });
  }

  void clear() {
    setState(() {
      number1 = 0;
      number2 = 0;
      t1.text = '0';
      t2.text = '0';
      sum = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Result: $sum',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 60),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter number',

              ),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter number',
              ),
              controller: t2,
            ),

            Padding(
              padding: EdgeInsets.only(top: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text('+'),
                  color: Colors.blue[100],
                  onPressed: () {
                    addNumbers();
                  },
                ),
                SizedBox(width: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text('-'),
                  color: Colors.blue[100],
                  onPressed: () {
                    substractNumbers();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text('*'),
                  color: Colors.blue[100],
                  onPressed: () {
                    multiplyNumbers();
                  },
                ),
                SizedBox(width: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text('/'),
                  color: Colors.blue[100],
                  onPressed: () {
                    divideNumbers();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text('Clear'),
                  color: Colors.blue[100],
                  onPressed: () {
                    clear();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
