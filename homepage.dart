import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iworkflow_todolist_app_vol1/notifications_page.dart';
import 'package:iworkflow_todolist_app_vol1/settings_page.dart';
import 'package:iworkflow_todolist_app_vol1/tasks_model/taskspage.dart';
import 'package:iworkflow_todolist_app_vol1/theme_page.dart';

import 'calendarpage.dart';
import 'notifications_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: const HomePage1(),
    );
  }
}


class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  int bottomCountIndex = 0;

  int tasksCompleted = 9;

  final widthBetweenEachSizedBox = const SizedBox(width: 40.0);
  final heightBetweenEachItem = const SizedBox(height: 30.0);
  final sizedBoxBetweenEachProgressTab = const SizedBox(height: 20.0);

  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = true;

  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (int index) => setState(() {
            bottomCountIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {},
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
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.grade_outlined),
              ),
              label: 'Premium',
            ),
            //TODO BottomNavigationBarItems: Category, Timer, Calender...
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 100.0,
              backgroundColor: Colors.redAccent,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
                  },
                  icon: const Icon(Icons.notifications_active_outlined),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                  },
                  icon: const Icon(Icons.settings_outlined),
                ),
              ],
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(''),
                centerTitle: true,
                collapseMode: CollapseMode.pin,
                background: FlutterLogo(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40.0,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    elevation: 5.0,
                    color: Colors.blue,
                    child: GestureDetector(
                      child: ListTile(
                        leading: const Icon(
                          Icons.assignment,
                          color: Colors.white,
                        ),
                        title: Text(
                          'view tasks',
                          style: IWorkFlowTheme.lightTextTheme.headline3,
                        ),
                        trailing: Text(
                          'All tasks',
                          style: IWorkFlowTheme.lightTextTheme.headline2,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TasksPage()));
                      },
                    ),
                  ),
                  heightBetweenEachItem,
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Status',
                      style: IWorkFlowTheme.lightTextTheme.headline4,
                    ),
                  ),
                  heightBetweenEachItem,
                  Container(
                    margin: const EdgeInsets.only(left: 7.0, right: 7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.black12,
                    ),
                    child: TabBar(
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      tabs: const [
                        Tab(
                          text: 'Daily',
                        ),
                        Tab(
                          text: 'Weekly',
                        ),
                        Tab(
                          text: 'Monthly',
                        ),
                        Tab(
                          text: 'Quarterly',
                        ),
                        Tab(
                          text: 'Yearly',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1200.0,
                    child: TabBarView(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 150.0,
                          child: Column(
                            children: [
                              sizedBoxBetweenEachProgressTab,
                              const TabsForTrackingUsersProgress(tasksCompleted: 9),
                              sizedBoxBetweenEachProgressTab,
                              const TabsForTrackingUsersProgress(tasksCompleted: 9),
                              sizedBoxBetweenEachProgressTab,
                              const TabsForTrackingUsersProgress(tasksCompleted: 9),
                              sizedBoxBetweenEachProgressTab,
                              const TabsForTrackingUsersProgress(tasksCompleted: 9),
                              sizedBoxBetweenEachProgressTab,
                              const TabsForTrackingUsersProgress(tasksCompleted: 9),
                              sizedBoxBetweenEachProgressTab,
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    width: 230.0,
                                    color: Colors.blue,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$tasksCompleted tasks completed this week',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    width: 230.0,
                                    color: Colors.blue,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$tasksCompleted tasks completed this week',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    width: 230.0,
                                    color: Colors.blue,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$tasksCompleted tasks completed this week',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 200.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 13.0),
                                    width: 230.0,
                                    color: Colors.blue,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$tasksCompleted tasks completed this week',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 230.0,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabsForTrackingUsersProgress extends StatelessWidget {
  const TabsForTrackingUsersProgress({
    Key? key,
    required this.tasksCompleted,
  }) : super(key: key);

  final int tasksCompleted;
  final marginForContainers = const EdgeInsets.only(left: 10.0, right: 10.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          margin: marginForContainers,
          padding: const EdgeInsets.only(left: 13.0),
          height: 200.0,
          color: Colors.blue,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '$tasksCompleted tasks completed this week',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



