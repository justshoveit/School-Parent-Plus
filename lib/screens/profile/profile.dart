import 'package:flutter/material.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Profile extends StatefulWidget {
  final String uid;
  Profile({Key key, @required this.uid}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState(uid);
}

class _ProfileState extends State<Profile> {
  final String uid;
  _ProfileState(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
    );
  }
}
