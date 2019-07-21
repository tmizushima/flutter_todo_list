import 'package:flutter/material.dart';
import 'home_page.dart';

class CompletedTasks extends StatelessWidget {
  CompletedTasks({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Tasks"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: homePageKey.currentState.completedItems.length,
          itemBuilder: (BuildContext context, int index) {
            if (homePageKey.currentState.completedItems[index] == 'true') {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(homePageKey.currentState.listItems[index]),
                  ),
                  Divider(
                    height: 10.0,
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
