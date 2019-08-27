import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app_background.dart';
import 'package:flutter_sample_app/pages/green_page.dart';
import 'package:flutter_sample_app/pages/red_page.dart';
import 'package:flutter_sample_app/pages/yellow_page.dart';
import 'package:flutter_sample_app/shared_prefs.dart';

var completedTaskKey = GlobalKey<State>();

class CompletedTasks extends StatelessWidget {
  final List<String> greenListItems;
  final List<String> yellowListItems;
  final List<String> redListItems;

  final List<String> greenCompletedItems;
  final List<String> redCompletedItems;
  final List<String> yellowCompletedItems;

  CompletedTasks(
      {Key key,
      this.redListItems,
      this.redCompletedItems,
      this.greenListItems,
      this.greenCompletedItems,
      this.yellowListItems,
      this.yellowCompletedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Completed Tasks"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: <Widget>[
          AppBackgroundPage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ListView.builder(
                itemCount: greenCompletedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  if (greenCompletedItems[index] == 'true') {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(2.00),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(5.0))),
                          child: ListTile(
                            title: Text(greenListItems[index]),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              ListView.builder(
                itemCount: yellowCompletedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  if (yellowCompletedItems[index] == 'true') {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(2.00),
                          decoration: BoxDecoration(
                              color: Colors.yellowAccent,
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(5.0))),
                          child: ListTile(
                            title: Text(yellowListItems[index]),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              ListView.builder(
                itemCount: redCompletedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  if (redCompletedItems[index] == 'true') {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(2.00),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(5.0))),
                          child: ListTile(
                            title: Text(redListItems[index]),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
