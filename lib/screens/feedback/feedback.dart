import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Feedbacks extends StatefulWidget {
  final String uid;

  Feedbacks({Key key, @required this.uid}) : super(key: key);

  @override
  _FeedbacksState createState() => _FeedbacksState(uid);
}

class _FeedbacksState extends State<Feedbacks> {
  final String uid;
  _FeedbacksState(this.uid);

  var taskcollections = Firestore.instance.collection('students');
  String task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Feedbacks"),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: taskcollections
            .document(uid)
            .collection('feedback')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0129ba),
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                        colors: [Color(0xff1e63da), Color(0xff0129ba)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0),
                      ),
                    ),
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          ds['title'],
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          ds['feedback'],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
