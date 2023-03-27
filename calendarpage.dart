import 'package:flutter/material.dart';
import 'package:iworkflow_todolist_app_vol1/homepage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'home_page.dart';
import 'homepage.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  int bottomCountIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index) => setState(() {
          bottomCountIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage3()));
              },
              icon: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.timer_outlined),
            ),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarPage()));
              },
              icon: const Icon(Icons.calendar_today_outlined),
            ),
            label: 'Calendar',
          ),
          //TODO BottomNavigationBarItems: Category, Timer, Calender...
        ],
      ),
    );
  }
}

