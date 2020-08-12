import 'package:flutter/material.dart';
import 'package:spp_app/models/events.dart';
import 'package:spp_app/screens/calendar/viewevent.dart';
import 'package:spp_app/services/event_helper.dart';
import 'package:spp_app/shared/appdrawer.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final String uid;

  Calendar({Key key, this.uid}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState(uid);
}

class _CalendarState extends State<Calendar> {
  final String uid;
  _CalendarState(this.uid);
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _events = {};
    _selectedEvents = [];
  }

  Map<DateTime, List<dynamic>> _groupEvents(List<EventModel> allEvents) {
    Map<DateTime, List<dynamic>> data = {};
    allEvents.forEach((event) {
      DateTime date = DateTime(
          event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendar'),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<EventModel>>(
          stream: eventDBS.streamList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<EventModel> allEvents = snapshot.data;
              if (allEvents.isNotEmpty) {
                _events = _groupEvents(allEvents);
              } else {
                _events = {};
                _selectedEvents = [];
              }
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TableCalendar(
                    events: _events,
                    calendarController: _calendarController,
                    calendarStyle: CalendarStyle(
                      selectedColor: Color(0xff0129ba),
                      todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonShowsNext: false,
                    ),
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    onDaySelected: (date, events) {
                      setState(() {
                        _selectedEvents = events;
                      });
                    },
                  ),
                  ..._selectedEvents.map((event) => ListTile(
                        title: Text(
                          event.title,
                          style: TextStyle(fontSize: 20.0),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EventDetailsPage(
                                        event: event,
                                      )));
                        },
                      )),
                ],
              ),
            );
          }),
    );
  }
}
