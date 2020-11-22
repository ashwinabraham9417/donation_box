import 'package:flutter/material.dart';

import 'add_button_build.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text('Home'),
      ),
      body: Container(

        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50.0),
              buildRaisedButton('ADD camp in-charge', 1),
              SizedBox(height: 20.0),
              buildRaisedButton('UPDATE camp in-charge', 1),
              SizedBox(height: 20.0),
              buildRaisedButton('DELETE camp in-charge', 2),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton buildRaisedButton(String text, int val) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.indigo)
        ),
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(color: Colors.indigo),
        ),
        onPressed: () {
          if (val == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddButtonBuild()),
            );
          }

        });
  }
}
