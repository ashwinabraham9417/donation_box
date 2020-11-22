import 'package:flutter/material.dart';
class AddButtonBuild extends StatelessWidget {
  final nameController= TextEditingController();
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
              buildTextField('Enter Name'),
              SizedBox(height: 10.0,),
              buildTextField('Enter Phone'),
              SizedBox(height: 10.0,),
              RaisedButton(onPressed: (){},child: Text('Register/Update'),)

            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(String text) {
    return TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: text
          ),

        );
  }
}

