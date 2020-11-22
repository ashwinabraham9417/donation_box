import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampItems extends StatelessWidget {
  Widget _buildBody(String _item, int _qty) {

    return Container(
      color: Colors.white,
      height: 30,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(_item),
          Text(_qty.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camp Details'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBody('Bread', 25),
          _buildBody('Jam', 10),
          _buildBody('Paracetamol', 100),
          _buildBody('Blanket', 15),
          SizedBox(
            height: 10.0,
          ),
          Text('Camp Contact No: xxxxxxxxxx'),
          SizedBox(
            height: 10.0,
          ),
          Text('Total Inmates : xxxx '),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(onPressed: (){}, child: Text('Open in Map')),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
