import 'package:flutter/material.dart';

import 'app_background.dart';
import 'completed_task_page.dart';
import 'input_field_tasks.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("To Do list App"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                print(inputFieldTasksKey.currentState.listItems);
              });
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return new CompletedTaskPage();
                }),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          AppBackgroundPage(),
          InputFieldTasks(),
        ],
      ),
    );
  }
}
