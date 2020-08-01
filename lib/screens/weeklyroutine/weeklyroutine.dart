import 'package:flutter/material.dart';
import 'package:spp_app/shared/appdrawer.dart';

class WeeklyRoutine extends StatefulWidget {
  final String uid;
  WeeklyRoutine({Key key, @required this.uid}) : super(key: key);
  @override
  _WeeklyRoutineState createState() => _WeeklyRoutineState(uid);
}

class _WeeklyRoutineState extends State<WeeklyRoutine> {
  final String uid;
  _WeeklyRoutineState(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weekly Routine'),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
    );
  }
}
