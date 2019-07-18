import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app_background.dart';
import 'input_field_tasks.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("To Do list App"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Stack(
          children: <Widget>[
            AppBackgroundPage(),
            InputFieldTasks(),
          ],
        ),
      ),
    );
  }
}
