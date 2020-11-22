import 'package:flutter/material.dart';
import 'package:timetracker/services/auth.dart';

import 'admin_screen/wrapper.dart';
import 'camp_incharge_screen/wrapper.dart';
import 'landing_page.dart';
import 'root_body.dart';

class RootHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donation Box',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RootBody(),
      drawer: buildDrawer(context),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.indigo),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Donation Box',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              Text('v1.0',style: TextStyle(
                fontSize: 12,
                color: Colors.grey
              ),)
              ],
            ),
          ),
        ),
        ListTile(
          title: Text('Volunteer Login'),
          leading: Icon(Icons.account_circle),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (LandingPage(
                  auth: Auth(),
                )),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Admin Login (Beta)'),
          leading: Icon(Icons.account_circle),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (Wrapper()),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Camp InCharge Login (Beta)'),
          leading: Icon(Icons.account_circle),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (InchargeWrapper()),
              ),
            );
          },
        )
      ],
    ));
  }
}
