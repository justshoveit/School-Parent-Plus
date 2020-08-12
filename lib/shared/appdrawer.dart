import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/screens/assignments/assignments.dart';
import 'package:spp_app/screens/authenticate/authenticate.dart';
import 'package:spp_app/screens/calendar/calendar.dart';
import 'package:spp_app/screens/feedback/feedback.dart';
import 'package:spp_app/screens/home/home.dart';
import 'package:spp_app/screens/notices/notices.dart';
import 'package:spp_app/screens/profile/profile.dart';
import 'package:spp_app/screens/progress/progress.dart';
import 'package:spp_app/screens/weeklyroutine/weeklyroutine.dart';

class AppDrawer extends StatefulWidget {
  final String uid;

  AppDrawer({Key key, this.uid}) : super(key: key);
  @override
  _AppDrawerState createState() => _AppDrawerState(uid);
}

class _AppDrawerState extends State<AppDrawer> {
  final String uid;
  _AppDrawerState(this.uid);

  var studentCollections = Firestore.instance.collection('students');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xff0129ba),
              ),
            ),
            accountName: Text("${user?.displayName}"),
            accountEmail: Text("${user?.email}"),
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
            trailing: Icon(Icons.schedule),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => WeeklyRoutine()));
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
            trailing: Icon(Icons.assessment),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Notices()));
            },
          ),
          ListTile(
            title: Text('Progress'),
            trailing: Icon(Icons.grade),
            onTap: () async {
              FirebaseUser user = await FirebaseAuth.instance.currentUser();
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Progress(
                        uid: user.uid,
                      )));
            },
          ),
          ListTile(
            title: Text('Feedbacks'),
            trailing: Icon(Icons.feedback),
            onTap: () async {
              FirebaseUser user = await FirebaseAuth.instance.currentUser();
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Feedbacks(
                        uid: user.uid,
                      )));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () async {
              await _auth.signOut();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Authenticate()));
            },
          ),
        ],
      ),
    );
  }
}
