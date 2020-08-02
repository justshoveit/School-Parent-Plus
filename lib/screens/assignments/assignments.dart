import 'package:flutter/material.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Assignments extends StatefulWidget {
  final String uid;

  Assignments({Key key, this.uid}) : super(key: key);
  @override
  _AssignmentsState createState() => _AssignmentsState(uid);
}

class _AssignmentsState extends State<Assignments> {
  final String uid;
  _AssignmentsState(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Assignments'),
          elevation: 0.0,
        ),
        drawer: AppDrawer());
  }
}
