import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/Tasks.dart';
import 'package:todo/screens/HomeScreen.dart';
import 'package:todo/screens/TaskScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'AN TODO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {TaskScreen.routeName: (ctx) => TaskScreen()},
      ),
      create: (ctx) => Tasks(),
    );
  }
}
