import 'package:flutter/material.dart';
import 'package:justfactsinhindi/db/helper.dart';
import 'package:justfactsinhindi/welcome.dart';
DBHelper dbHelper = DBHelper();
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Facts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Welcome(),
    );
  }
}
