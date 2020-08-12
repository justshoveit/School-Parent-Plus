import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/screens/notices/noticedetails.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Notices extends StatefulWidget {
  final String uid;

  Notices({Key key, this.uid}) : super(key: key);
  @override
  _NoticesState createState() => _NoticesState(uid);
}

class _NoticesState extends State<Notices> {
  Future _data;
  final String uid;
  _NoticesState(this.uid);

  Future getNotices() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("notices").getDocuments();
    return qn.documents;
  }

  navigateToDetails(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NoticeDetails(post: post)));
  }

  @override
  void initState() {
    super.initState();
    _data = getNotices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notices'),
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
                          colors: [Color(0xffebac38), Color(0xffde4d2a)],
                          begin: Alignment.centerRight,
                          end: Alignment(-1.0, -1.0),
                        ),
                      ),
                      margin: EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(
                          snapshot.data[index].data["title"],
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
