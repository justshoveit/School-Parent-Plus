import 'package:flutter/material.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({Key key, this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(uid);
}

class _HomeState extends State<Home> {
  final String uid;
  _HomeState(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
    );
  }
}
