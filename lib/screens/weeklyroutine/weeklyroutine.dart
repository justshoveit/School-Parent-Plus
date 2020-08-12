import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spp_app/shared/appdrawer.dart';

class WeeklyRoutine extends StatefulWidget {
  WeeklyRoutine({Key key}) : super(key: key);
  @override
  _WeeklyRoutineState createState() => _WeeklyRoutineState();
}

class _WeeklyRoutineState extends State<WeeklyRoutine> {
  var routines = Firestore.instance.collection('weeklyroutine');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Weekly Routine'),
          elevation: 0.0,
        ),
        drawer: AppDrawer(),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Sunday(routines: routines),
            Monday(routines: routines),
            Tuesday(routines: routines),
            Wednesday(routines: routines),
            Thursday(routines: routines),
            Friday(routines: routines),
          ],
        ));
  }
}

class Sunday extends StatelessWidget {
  const Sunday({
    Key key,
    @required this.routines,
  }) : super(key: key);

  final CollectionReference routines;

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
            end: Alignment(-1.0, -1.0),
          ), //Gradient
        ),
        child: Align(
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                routines.document('class1').collection('sunday').snapshots(),
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
                                'Timetable for Sunday',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Text(
                                  'Period',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'First',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['1st'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        'Second',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        ds['2nd'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Third',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['3rd'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fourth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['4th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fifth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['5th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Sixth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['6th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Seventh',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['7th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Eighth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['8th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
        ),
      ),
    );
  }
}

class Monday extends StatelessWidget {
  const Monday({
    Key key,
    @required this.routines,
  }) : super(key: key);

  final CollectionReference routines;

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
            colors: [Color(0xff5c6bc0), Color(0xff283593)],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0),
          ), //Gradient
        ),
        child: Align(
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                routines.document('class1').collection('monday').snapshots(),
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
                                'Timetable for Monday',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Text(
                                  'Period',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'First',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['1st'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        'Second',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        ds['2nd'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Third',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['3rd'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fourth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['4th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fifth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['5th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Sixth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['6th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Seventh',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['7th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Eighth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['8th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
        ),
      ),
    );
  }
}

class Tuesday extends StatelessWidget {
  const Tuesday({
    Key key,
    @required this.routines,
  }) : super(key: key);

  final CollectionReference routines;

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
            colors: [Color(0xff42a5f5), Color(0xff1565c0)],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0),
          ), //Gradient
        ),
        child: Align(
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                routines.document('class1').collection('tuesday').snapshots(),
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
                                'Timetable for Tuesday',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Text(
                                  'Period',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'First',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['1st'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        'Second',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        ds['2nd'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Third',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['3rd'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fourth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['4th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fifth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['5th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Sixth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['6th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Seventh',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['7th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Eighth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['8th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
        ),
      ),
    );
  }
}

class Wednesday extends StatelessWidget {
  const Wednesday({
    Key key,
    @required this.routines,
  }) : super(key: key);

  final CollectionReference routines;

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
            colors: [Color(0xfffdd835), Color(0xfff57f17)],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0),
          ), //Gradient
        ),
        child: Align(
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                routines.document('class1').collection('wednesday').snapshots(),
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
                                'Timetable for Wednesday',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Text(
                                  'Period',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'First',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['1st'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        'Second',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        ds['2nd'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Third',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['3rd'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fourth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['4th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fifth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['5th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Sixth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['6th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Seventh',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['7th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Eighth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['8th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
        ),
      ),
    );
  }
}

class Thursday extends StatelessWidget {
  const Thursday({
    Key key,
    @required this.routines,
  }) : super(key: key);

  final CollectionReference routines;

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
            colors: [Color(0xffffb74d), Color(0xffe65100)],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0),
          ), //Gradient
        ),
        child: Align(
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                routines.document('class1').collection('thursday').snapshots(),
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
                                'Timetable for Thursday',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Text(
                                  'Period',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'First',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['1st'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        'Second',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        ds['2nd'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Third',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['3rd'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fourth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['4th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fifth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['5th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Sixth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['6th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Seventh',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['7th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Eighth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['8th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
        ),
      ),
    );
  }
}

class Friday extends StatelessWidget {
  const Friday({
    Key key,
    @required this.routines,
  }) : super(key: key);

  final CollectionReference routines;

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
            colors: [Color(0xffe57373), Color(0xffb71c1c)],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0),
          ), //Gradient
        ),
        child: Align(
          alignment: Alignment.center,
          child: StreamBuilder<QuerySnapshot>(
            stream:
                routines.document('class1').collection('friday').snapshots(),
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
                                'Timetable for Friday',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                    label: Text(
                                  'Period',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Subject',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                )),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'First',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['1st'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        'Second',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        ds['2nd'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Third',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['3rd'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fourth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['4th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Fifth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['5th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Sixth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['6th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Seventh',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['7th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(
                                      'Eighth',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    DataCell(Text(
                                      ds['8th'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
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
        ),
      ),
    );
  }
}
