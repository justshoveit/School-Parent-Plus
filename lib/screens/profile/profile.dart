import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  var studentCollections = Firestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: studentCollections
            .document(uid)
            .collection('student')
            .orderBy('name')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        ds['photo'],
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            'Name:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            ds['name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            'Address:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            ds['address'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            'Guardian Name:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            ds['guardianname'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            'Contact Info:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            ds['contact'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Grade: ",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            ds['class'],
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            ds['section'],
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return CircularProgressIndicator();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
