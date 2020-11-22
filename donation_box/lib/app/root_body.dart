import 'package:flutter/material.dart';
import 'package:timetracker/app/camp_items.dart';


class RootBody extends StatefulWidget {
  RootBody({Key key}) : super(key: key);

  @override
  _RootBodyState createState() => _RootBodyState();
}

class _RootBodyState extends State<RootBody> {
  String dropdownValueDistrict = 'Kottayam';
  String dropdownValueCamp = 'Changanacherry';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 500,
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(8),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildRowDistrict(),
                buildRowCamp(),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (CampItems()),
                      ),
                    );
                  },
                  child: Text('Done'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row buildRowDistrict() {
    return Row(
      children: [
        FlatButton(
          color: Colors.white,
          child: Text(
            'District :  ',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          onPressed: null,
        ),
        DropdownButton<String>(
          value: dropdownValueDistrict,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValueDistrict = newValue;
            });
          },
          items: <String>['Kottayam']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Row buildRowCamp() {
    return Row(
      children: [
        FlatButton(
          color: Colors.white,
          child: Text(
            'Camp :  ',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          onPressed: null,
        ),
        DropdownButton<String>(
          value: dropdownValueCamp,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValueCamp = newValue;
            });
          },
          items: <String>['Changanacherry', 'Pala', 'Vaikom', 'Ettumanoor']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
