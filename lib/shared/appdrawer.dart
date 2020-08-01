import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/screens/assignments/assignments.dart';
import 'package:spp_app/screens/calendar/calendar.dart';
import 'package:spp_app/screens/home/home.dart';
import 'package:spp_app/screens/notices/notices.dart';
import 'package:spp_app/screens/profile/profile.dart';
import 'package:spp_app/screens/progress/progress.dart';
import 'package:spp_app/screens/weeklyroutine/weeklyroutine.dart';
import 'package:spp_app/services/auth.dart';

class AppDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
            ),
            accountName: Text('Himadri'),
            accountEmail: Text('himadri.dares@gmail.com'),
            onDetailsPressed: () async {
              FirebaseUser user = await FirebaseAuth.instance.currentUser();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Profile(
                        uid: user.uid,
                      )));
            },
          ),
          ListTile(
            title: Text('Home'),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            },
          ),
          ListTile(
            title: Text('Weekly Routine'),
            trailing: Icon(Icons.home),
            onTap: () async {
              FirebaseUser user = await FirebaseAuth.instance.currentUser();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => WeeklyRoutine(
                        uid: user.uid,
                      )));
            },
          ),
          ListTile(
            title: Text('Assignments'),
            trailing: Icon(Icons.assignment),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Assignments()));
            },
          ),
          ListTile(
            title: Text('Calendar'),
            trailing: Icon(Icons.date_range),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Calendar()));
            },
          ),
          ListTile(
            title: Text('Notices'),
            trailing: Icon(Icons.announcement),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Notices()));
            },
          ),
          ListTile(
            title: Text('Progress'),
            trailing: Icon(Icons.grade),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Progress()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
