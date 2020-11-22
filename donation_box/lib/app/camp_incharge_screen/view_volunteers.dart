import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewVolunteers extends StatelessWidget {
  final databaseReference = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Volunteers'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Volunteers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading data...!! Please Wait!!');
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot vol = snapshot.data.documents[index];
              return Card(
                child: ListTile(
                  title: Text('Name : ${vol['Name']}'),
                  subtitle: Row(
                    children: [
                      Text('Contact No : ${vol['Phone']}'),
                      FlatButton(
                          onPressed:()=> _deleteVolunteer(vol['User ID']),
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.indigo),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _deleteVolunteer(String id) {
    try {
      databaseReference.collection('Volunteers').document(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
