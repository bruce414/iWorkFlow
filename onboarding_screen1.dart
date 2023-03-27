import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iworkflow_todolist_app_vol1/homepage.dart';
import 'package:iworkflow_todolist_app_vol1/tasks_model/taskspage.dart';

import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  _OnBoardingScreen2State createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {

  final textMargin = const EdgeInsets.only(left: 30.0, right: 30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: [
          Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Placeholder(
                  fallbackWidth: 50.0,
                  fallbackHeight: 250.0,
                ),
                Container(
                  margin: textMargin,
                  child: const Text(
                    'IWorkflow is an easy to use, and a fast tool to help you to achieve your daily golds and better accomplishment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.5,
                    ),
                  ),
                ),
                Container(
                  margin: textMargin,
                  child: const ListTile(
                    title: Text(
                      'Start your journey with IWorkflow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.orange,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(
                'Tasks page',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
