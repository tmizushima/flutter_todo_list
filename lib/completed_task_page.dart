import 'package:flutter/material.dart';
import 'package:flutter_sample_app/input_field_tasks.dart';

class CompletedTaskPage extends StatefulWidget {
  final InputFieldTasks listItems, completedItems;

  CompletedTaskPage({this.listItems, this.completedItems});

  @override
  _CompletedTaskPageState createState() => _CompletedTaskPageState();
}

class _CompletedTaskPageState extends State<CompletedTaskPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Completed Tasks"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new ListView.builder(
        itemCount: this.widget.listItems.length,
        itemBuilder: (context, i) => new Column(
          children: <Widget>[
            new Divider(
              height: 10.0,
            ),
            new ListTile()
          ],
        ),
      ),
    );
  }
}
