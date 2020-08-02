import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spp_app/shared/appdrawer.dart';

class Progress extends StatefulWidget {
  final String uid;

  Progress({Key key, @required this.uid}) : super(key: key);

  @override
  _ProgressState createState() => _ProgressState(uid);
}

class _ProgressState extends State<Progress> {
  final String uid;
  _ProgressState(this.uid);

  var studentCollections = Firestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Progress'),
          elevation: 0.0,
        ),
        drawer: AppDrawer(),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FirstTermResult(studentCollections: studentCollections, uid: uid),
            SecondTermResult(studentCollections: studentCollections, uid: uid),
            ThirdTermResult(studentCollections: studentCollections, uid: uid),
          ],
        ));
  }
}

class FirstTermResult extends StatelessWidget {
  const FirstTermResult({
    Key key,
    @required this.studentCollections,
    @required this.uid,
  }) : super(key: key);

  final CollectionReference studentCollections;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 18.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Color(0xff5a348b),
          gradient: LinearGradient(
              colors: [Color(0xff7e57c2), Color(0xff4527a0)],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0)), //Gradient
        ),
        child: Align(
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream: studentCollections
                .document(uid)
                .collection('firstTerm')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    return SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 25.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'First Terminal Result',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              DataTable(columns: <DataColumn>[
                                DataColumn(
                                    label: Text(
                                  "Subject",
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Grade',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Result',
                                  style: TextStyle(fontSize: 15.0),
                                )),
                              ], rows: <DataRow>[
                                DataRow(cells: <DataCell>[
                                  DataCell(Text('English')),
                                  DataCell(Text(ds['english'])),
                                  DataCell(Text('Pass')),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(Text('Nepali')),
                                  DataCell(Text(ds['nepali'])),
                                  DataCell(Text('Pass')),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(Text('Mathematics')),
                                  DataCell(Text(ds['maths'])),
                                  DataCell(Text('Pass')),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(Text('Science')),
                                  DataCell(Text(ds['science'])),
                                  DataCell(Text('Pass')),
                                ]),
                              ]),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Final Grade',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Text(
                                    ds['finalgrade'],
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ));
                  },
                );
              } else if (snapshot.hasError) {
                return CircularProgressIndicator();
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class SecondTermResult extends StatelessWidget {
  const SecondTermResult({
    Key key,
    @required this.studentCollections,
    @required this.uid,
  }) : super(key: key);

  final CollectionReference studentCollections;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 18.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Color(0xff5a348b),
          gradient: LinearGradient(
              colors: [Color(0xffebac38), Color(0xffde4d2a)],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0)), //Gradient
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: studentCollections
              .document(uid)
              .collection('secondTerm')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.documents[index];
                  return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 25.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Second Terminal Result',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DataTable(columns: <DataColumn>[
                              DataColumn(
                                  label: Text(
                                "Subject",
                                style: TextStyle(fontSize: 15.0),
                              )),
                              DataColumn(
                                  label: Text(
                                'Grade',
                                style: TextStyle(fontSize: 15.0),
                              )),
                              DataColumn(
                                  label: Text(
                                'Result',
                                style: TextStyle(fontSize: 15.0),
                              )),
                            ], rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(Text('English')),
                                DataCell(Text(ds['english'])),
                                DataCell(Text('Pass')),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Nepali')),
                                DataCell(Text(ds['nepali'])),
                                DataCell(Text('Pass')),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Mathematics')),
                                DataCell(Text(ds['maths'])),
                                DataCell(Text('Pass')),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Science')),
                                DataCell(Text(ds['science'])),
                                DataCell(Text('Pass')),
                              ]),
                            ]),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Final Grade',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Text(
                                  ds['finalgrade'],
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ));
                },
              );
            } else if (snapshot.hasError) {
              return CircularProgressIndicator();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class ThirdTermResult extends StatelessWidget {
  const ThirdTermResult({
    Key key,
    @required this.studentCollections,
    @required this.uid,
  }) : super(key: key);

  final CollectionReference studentCollections;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 18.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Color(0xff5a348b),
          gradient: LinearGradient(
              colors: [Color(0xffe57373), Color(0xffc62828)],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0)), //Gradient
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: studentCollections
              .document(uid)
              .collection('thirdTerm')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.documents[index];
                  return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 25.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Third Terminal Result',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DataTable(columns: <DataColumn>[
                              DataColumn(
                                  label: Text(
                                "Subject",
                                style: TextStyle(fontSize: 15.0),
                              )),
                              DataColumn(
                                  label: Text(
                                'Grade',
                                style: TextStyle(fontSize: 15.0),
                              )),
                              DataColumn(
                                  label: Text(
                                'Result',
                                style: TextStyle(fontSize: 15.0),
                              )),
                            ], rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(Text('English')),
                                DataCell(Text(ds['english'])),
                                DataCell(Text('Pass')),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Nepali')),
                                DataCell(Text(ds['nepali'])),
                                DataCell(Text('Pass')),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Mathematics')),
                                DataCell(Text(ds['maths'])),
                                DataCell(Text('Pass')),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('Science')),
                                DataCell(Text(ds['science'])),
                                DataCell(Text('Pass')),
                              ]),
                            ]),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Final Grade',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Text(
                                  ds['finalgrade'],
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ));
                },
              );
            } else if (snapshot.hasError) {
              return CircularProgressIndicator();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
