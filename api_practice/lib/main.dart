// ignore_for_file: unused_import

import 'package:api_practice/list_users_api_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainFile());
}

class MainFile extends StatelessWidget {
  const MainFile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey),
        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,
      home: ListUsersApiScreen(),
    );
  }
}
