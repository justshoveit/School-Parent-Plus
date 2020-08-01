import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/screens/notices/noticedetails.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Notices extends StatefulWidget {
  @override
  _NoticesState createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  Future _data;

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
                    return ListTile(
                      title: Text(
                        snapshot.data[index].data["title"],
                        style: TextStyle(fontSize: 30.0),
                      ),
                      onTap: () => navigateToDetails(snapshot.data[index]),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
