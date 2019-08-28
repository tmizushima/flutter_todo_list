import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app_background.dart';

var completedTaskKey = GlobalKey<State>();

class CompletedTasks extends StatefulWidget {
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
  _CompletedTasksState createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
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
              widget.greenCompletedItems != null
                  ? ListView.builder(
                      itemCount: widget.greenCompletedItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (widget.greenCompletedItems[index] == 'true') {
                          return Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.all(2.00),
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0))),
                                child: ListTile(
                                  title: Text(widget.greenListItems[index]),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    )
                  : Container(
                      child: Text('noItems'),
                    ),
              widget.yellowCompletedItems != null
                  ? ListView.builder(
                      itemCount: widget.yellowCompletedItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (widget.yellowCompletedItems[index] == 'true') {
                          return Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.all(2.00),
                                decoration: BoxDecoration(
                                    color: Colors.yellowAccent,
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0))),
                                child: ListTile(
                                  title: Text(widget.yellowListItems[index]),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    )
                  : Container(
                      child: Text('noItems'),
                    ),
              widget.redCompletedItems != null
                  ? ListView.builder(
                      itemCount: widget.redCompletedItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (widget.redCompletedItems[index] == 'true') {
                          return Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.all(2.00),
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0))),
                                child: ListTile(
                                  title: Text(widget.redListItems[index]),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    )
                  : Container(
                      child: Text('noItems'),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
