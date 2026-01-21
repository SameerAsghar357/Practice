// ignore_for_file: unused_import

import 'package:covid_tracker/api_fetching_checking.dart';
import 'package:covid_tracker/countriesList.dart';
import 'package:covid_tracker/splashscreen.dart';
import 'package:covid_tracker/world_stats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          useMaterial3: false),
      home: const checkingScreen(),
    );
  }
}
