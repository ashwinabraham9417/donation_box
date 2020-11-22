import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VolunteerBody extends StatelessWidget {
  final databaseReference = Firestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  void createRecord(BuildContext context) async {
    final user = await _firebaseAuth.currentUser();
    print("User ID IS: ${user.uid}");
    await databaseReference
        .collection("Volunteers")
        .document(user.uid)
        .setData({
      'User ID': '${user.uid}',
      'Name': '${nameController.text}',
      'Phone': '${phoneController.text}'
    });
    print('Content added');
  }

  void deleteData() async {
    final user = await _firebaseAuth.currentUser();
    print('test');
    try {
      databaseReference.collection('Volunteers').document(user.uid).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone'),
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                color: Colors.indigo,
                child: Text(
                  'Register / Update',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  createRecord(context);

                  final snackBar1 = SnackBar(
                    content: Text('Registered Successfully'),
                  );
                  Scaffold.of(context).showSnackBar(snackBar1);
                }),
            RaisedButton(
              color: Colors.indigo,
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                final snackBar2 =
                    SnackBar(content: Text('Volunteer Has been Deleted'));
                deleteData();
                Scaffold.of(context).showSnackBar(snackBar2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
