import 'package:flutter/material.dart';
class ItemBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(

        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildTextField('Enter Product Name'),
              SizedBox(height: 10.0,),
              buildTextField('Enter Quantity'),
              SizedBox(height: 10.0,),
              RaisedButton(onPressed: (){},child: Text('Create/Update'),)

            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(String text) {
    return TextField(
       decoration: InputDecoration(
          labelText: text
      ),

    );
  }
}

