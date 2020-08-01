import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoticeDetails extends StatefulWidget {
  final DocumentSnapshot post;
  NoticeDetails({this.post});

  @override
  _NoticeDetailsState createState() => _NoticeDetailsState();
}

class _NoticeDetailsState extends State<NoticeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.post.data['title']),
        elevation: 0.0,
      ),
      body: Container(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.post.data['title'],
                  style: TextStyle(
                    fontSize: 45.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.post.data['description'],
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.post.data['date'],
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* Card(
          child: ListTile(
            title: Text(
              widget.post.data['title'],
            ),
            subtitle: Text(widget.post.data['description']),
            trailing: Text(widget.post.data['date'.toString()]),
          ),
        ), */
