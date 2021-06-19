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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {TaskScreen.routeName: (ctx) => TaskScreen()},
      ),
      create: (ctx) => Tasks(),
    );
  }
}
