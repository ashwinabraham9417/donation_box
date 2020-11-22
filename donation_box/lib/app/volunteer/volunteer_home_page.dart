
import 'package:flutter/material.dart';
import 'package:timetracker/app/volunteer/volunteer_homepage_body.dart';
import 'package:timetracker/common_widgets/platform_alert_dialogue.dart';
import 'package:timetracker/services/auth.dart';

// ignore: must_be_immutable
class VolunteerHomePage extends StatelessWidget {
  VolunteerHomePage({@required this.auth,this.vol});
  final AuthBase auth;
  final User vol;


  Future<void> _signOut() async {
    try {

      await auth.signOut();
      } catch (e) {
      print(e.toString());
    }
  }
Future<void> _confirmSignOut(BuildContext context)async{
    final didRequestSignOut = await PlatformAlertDialogue(
      title: 'Log Out',
      content: 'Are you sure that you want to log out ?',
      defaultActionText: 'Logout',
      cancelActionText: 'Cancel',
    ).show(context);
    if(didRequestSignOut == true){
      _signOut();
    }
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        actions: [

          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onPressed:()=> _confirmSignOut(context),
          )
        ],
      ),
      body: VolunteerBody(

      ),
    );
  }
}
