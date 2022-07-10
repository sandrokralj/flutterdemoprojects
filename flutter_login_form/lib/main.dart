import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: FormPage(),
    );
  }
}


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();

      performLogin();
    }
  }

  void performLogin(){
    final snackBar = SnackBar(
      content: Text('Email: $_email, and password: $_password')
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (val) => !val.contains('@')?'Invalid Email':null,
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                validator: (val) => val.length<6?'Password too short':null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              SizedBox(height: 20),
              RaisedButton(
                  child: Text('Login'),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
