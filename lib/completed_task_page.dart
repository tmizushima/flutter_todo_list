import 'package:flutter/material.dart';
import 'package:flutter_sample_app/input_field_tasks.dart';

var completedTaskPageKey = new GlobalKey<_CompletedTaskPageState>();

class CompletedTaskPage extends StatefulWidget {
  List<String> listItems;
  List<bool> completedItems;
  CompletedTaskPage({Key key, this.listItems, this.completedItems})
      : super(key: key);

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
          itemCount: InputFieldTasks.listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return new Column(
              children: <Widget>[
                new Divider(
                  height: 10.0,
                ),
                new ListTile(
                  title: Text(inputFieldTasksKey.currentState.listItems[index]),
                )
              ],
            );
          }),
    );
  }
}
