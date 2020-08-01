import 'package:flutter/material.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Progress'),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
    );
  }
}
