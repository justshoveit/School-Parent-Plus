import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/screens/feedback/feedback.dart';
import 'package:spp_app/screens/notices/notices.dart';
import 'package:spp_app/screens/profile/profile.dart';
import 'package:spp_app/screens/progress/progress.dart';
import 'package:spp_app/screens/weeklyroutine/weeklyroutine.dart';
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
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff0129ba), Color(0xff1e63da)],
              ),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 90.0, 0.0, 0.0),
                  child: Text(
                    'School Name Here',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    FirebaseUser user =
                        await FirebaseAuth.instance.currentUser();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Profile(
                          uid: user.uid,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 325.0, top: 55.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5, // changes position of shadow
                          ),
                        ],
                      ),
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.person,
                        size: 25.0,
                        color: Color(0xff0129ba),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Notices())),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 200.0,
                      width: 175.0,
                      decoration: BoxDecoration(
                          color: Color(0xfffec01d),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(children: <Widget>[
                              Opacity(
                                opacity: 0.3,
                                child: Container(
                                  height: 75.0,
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13.0, top: 13.0),
                                child: Icon(
                                  Icons.assessment,
                                  color: Colors.white,
                                  size: 50.0,
                                ),
                              ),
                            ]),
                            Padding(
                              padding: EdgeInsets.only(top: 25.0, left: 32.5),
                              child: Text(
                                'Notices',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  FirebaseUser user = await FirebaseAuth.instance.currentUser();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Progress(
                            uid: user.uid,
                          )));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 200.0,
                      width: 175.0,
                      decoration: BoxDecoration(
                          color: Color(0xffe55934),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(children: <Widget>[
                              Opacity(
                                opacity: 0.3,
                                child: Container(
                                  height: 75.0,
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13.0, top: 13.0),
                                child: Icon(
                                  Icons.grade,
                                  color: Colors.white,
                                  size: 50.0,
                                ),
                              ),
                            ]),
                            Padding(
                              padding: EdgeInsets.only(top: 25.0, left: 22.5),
                              child: Text(
                                'Progress',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  FirebaseUser user = await FirebaseAuth.instance.currentUser();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Feedbacks(
                            uid: user.uid,
                          )));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 200.0,
                      width: 175.0,
                      decoration: BoxDecoration(
                          color: Color(0xff731963),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(children: <Widget>[
                              Opacity(
                                opacity: 0.3,
                                child: Container(
                                  height: 75.0,
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13.0, top: 13.0),
                                child: Icon(
                                  Icons.feedback,
                                  color: Colors.white,
                                  size: 50.0,
                                ),
                              ),
                            ]),
                            Padding(
                              padding: EdgeInsets.only(top: 25.0, left: 15.0),
                              child: Text(
                                'Feedbacks',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => WeeklyRoutine())),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 200.0,
                      width: 175.0,
                      decoration: BoxDecoration(
                          color: Color(0xff6fbd13),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(children: <Widget>[
                              Opacity(
                                opacity: 0.3,
                                child: Container(
                                  height: 75.0,
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13.0, top: 13.0),
                                child: Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                  size: 50.0,
                                ),
                              ),
                            ]),
                            Padding(
                              padding: EdgeInsets.only(top: 25.0, left: 25.0),
                              child: Text(
                                'Weekly Routine',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
