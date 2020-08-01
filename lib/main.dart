import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_app/models/user.dart';
import 'package:spp_app/screens/wrapper.dart';
import 'package:spp_app/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          fontFamily: 'ProximaNova',
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
