import 'package:flutter/material.dart';
import 'package:timetracker/app/camp_incharge_screen/camp_builder.dart';
import 'package:timetracker/app/camp_incharge_screen/item_builder.dart';
import 'package:timetracker/app/camp_incharge_screen/view_volunteers.dart';

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
        actions: [
          RaisedButton(
            color: Colors.indigo,
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50.0),
              buildRaisedButton('ADD ITEM', 1),
              SizedBox(height: 20.0),
              buildRaisedButton('UPDATE ITEM', 1),
              SizedBox(height: 20.0),
              buildRaisedButton('DELETE ITEM', 0),
              SizedBox(height: 20.0),
              buildRaisedButton('ADD CAMP', 2),
              SizedBox(height: 20.0),
              buildRaisedButton('MODIFY CAMP', 2),
              SizedBox(height: 20.0),
              buildRaisedButton('DELETE CAMP', 0),
              SizedBox(height: 20.0),
              buildRaisedButton('VIEW REGISTERED VOLUNTEERS', 3),
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
            side: BorderSide(color: Colors.indigo)),
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(color: Colors.indigo),
        ),
        onPressed: () {
          if (val == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemBuilder()),
            );
          }
          if (val == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CampBuilder()),
            );
          }
          if (val == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewVolunteers()),
            );
          }
        });
  }
}
