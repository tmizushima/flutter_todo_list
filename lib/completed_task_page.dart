import 'package:flutter/material.dart';
import 'home_page.dart';

class CompletedTasks extends StatelessWidget {
  CompletedTasks({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Completed Tasks"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: completedItems.length,
          itemBuilder: (BuildContext context, int index) {
            if (completedItems[index]) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(listItems[index]),
                  ),
                  Divider(
                    height: 10.0,
                  ),
                ],
              );
            } else {
              return Center();
            }
          }),
    );
  }
}
