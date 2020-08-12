import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/screens/assignments/assignmentdetails.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Assignments extends StatefulWidget {
  final String uid;

  Assignments({Key key, this.uid}) : super(key: key);
  @override
  _AssignmentsState createState() => _AssignmentsState(uid);
}

class _AssignmentsState extends State<Assignments> {
  Future _data;
  final String uid;
  _AssignmentsState(this.uid);

  Future getAssignments() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("assignments").getDocuments();
    return qn.documents;
  }

  navigateToDetails(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AssignmentDetails(post: post)));
  }

  @override
  void initState() {
    super.initState();
    _data = getAssignments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Assignments'),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: FutureBuilder(
            future: _data,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xff0129ba),
                        borderRadius: BorderRadius.circular(5.0),
                        gradient: LinearGradient(
                          colors: [Color(0xff1e63da), Color(0xff0129ba)],
                          begin: Alignment.centerRight,
                          end: Alignment(-1.0, -1.0),
                        ),
                      ),
                      margin: EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(
                          snapshot.data[index].data["subject"],
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onTap: () => navigateToDetails(snapshot.data[index]),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
