import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_app/models/user.dart';
import 'package:spp_app/screens/authenticate/authenticate.dart';
import 'package:spp_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return home or authenticate
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
