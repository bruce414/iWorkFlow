import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iworkflow_todolist_app_vol1/home_page.dart';
import 'theme_page.dart';
import 'package:provider/provider.dart';
import 'tasks_model/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = IWorkFlowTheme.appTheme1blue();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        title: 'to-do-list',
        home: const InitialPage(),
      ),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 5), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/app_icon1.jpg'),
              ),
            ),
          )
      ),
    );
  }
  void openOnBoard() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage3()));
  }
}


