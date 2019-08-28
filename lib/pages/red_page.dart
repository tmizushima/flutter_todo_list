import 'package:flutter/material.dart';
import 'package:flutter_sample_app/home_page.dart';
import 'package:flutter_sample_app/shared_prefs.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

var redPageKey = GlobalKey<_RedPageState>();

class RedPage extends StatefulWidget {
  final HomePage controller;
  final redListItems;
  final redCompletedItems;
  const RedPage(
      {Key key, this.controller, this.redListItems, this.redCompletedItems})
      : super(key: key);

  @override
  _RedPageState createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  bool _validate = false;

  final TextEditingController eCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    eCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.7), color: Colors.white),
          margin: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: eCtrl,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Things to do",
                    errorText: _validate ? 'The input is empty.' : null,
                    contentPadding: const EdgeInsets.only(
                        left: 25.0, bottom: 15.0, top: 15.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                  autocorrect: true,
                  onSubmitted: (text) {
                    if (text.isEmpty) {
                      _validate = true;
                      setState(() {});
                    } else {
                      _validate = false;
                      widget.redCompletedItems.add('false');
                      widget.redListItems.add(text);
                      SharePrefs.setRedCompletedItems(widget.redCompletedItems)
                          .then((_) {
                        setState(() {});
                      });
                      SharePrefs.setRedListItems(widget.redListItems).then((_) {
                        setState(() {});
                      });
                      eCtrl.clear();
                    }
                  },
                ),
              ),
              Container(
                height: 70,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.7)),
                  onPressed: () {},
                  color: Colors.blueAccent,
                  child: IconButton(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    color: Colors.white,
                    hoverColor: Colors.white,
                    icon: Icon(
                      IconData(57669, fontFamily: 'MaterialIcons'),
                    ),
                    onPressed: () {
                      if (eCtrl.text.isEmpty) {
                        _validate = true;
                        setState(() {});
                      } else {
                        _validate = false;
                        widget.redCompletedItems.add('false');
                        widget.redListItems.add(eCtrl.text);
                        SharePrefs.setRedListItems(widget.redListItems)
                            .then((_) {
                          setState(() {});
                        });
                        SharePrefs.setRedCompletedItems(
                                widget.redCompletedItems)
                            .then((_) {
                          setState(() {});
                        });
                        eCtrl.clear();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.redListItems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ObjectKey(widget.redListItems[index]),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Container(
                    margin: const EdgeInsets.all(2.00),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(5.0))),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(child: Text(widget.redListItems[index])),
                          Container(
                            width: 40,
                            child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.redAccent,
                                ),
                                onTap: () {
                                  widget.redListItems.removeAt(index);
                                  widget.redCompletedItems.removeAt(index);
                                  SharePrefs.setRedListItems(
                                          widget.redListItems)
                                      .then((_) {
                                    setState(() {});
                                  });
                                  SharePrefs.setRedCompletedItems(
                                          widget.redCompletedItems)
                                      .then((_) {
                                    setState(() {});
                                  });
                                }),
                          ),
                          Container(
                              width: 30,
                              child: InkWell(
                                child: Icon(
                                  (widget.redCompletedItems[index] == 'false')
                                      ? Icons.check_box_outline_blank
                                      : Icons.check_box,
                                  color: Colors.greenAccent,
                                ),
                                onTap: () {
                                  if (widget.redCompletedItems[index] ==
                                      'false') {
                                    widget.redCompletedItems[index] = 'true';
                                  } else {
                                    widget.redCompletedItems[index] = 'false';
                                  }
                                  setState(() {});
                                },
                              )),
                        ],
                      ),
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  ),
                  actions: <Widget>[
                    (widget.redCompletedItems[index] == 'false')
                        ? IconSlideAction(
                            caption: 'Complete',
                            color: Colors.greenAccent,
                            icon: IconData(58826, fontFamily: 'MaterialIcons'),
                            onTap: () {
                              if (widget.redCompletedItems[index] == 'false') {
                                widget.redCompletedItems[index] = 'true';
                              } else {
                                widget.redCompletedItems[index] = 'false';
                              }
                              setState(() {});
                            },
                          )
                        : IconSlideAction(
                            caption: 'Undo',
                            color: Colors.grey,
                            icon: IconData(58826, fontFamily: 'MaterialIcons'),
                            onTap: () {
                              if (widget.redCompletedItems[index] == 'false') {
                                widget.redCompletedItems[index] = 'true';
                              } else {
                                widget.redCompletedItems[index] = 'false';
                              }
                              setState(() {});
                            },
                          )
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        widget.redListItems.removeAt(index);
                        widget.redCompletedItems.removeAt(index);

                        SharePrefs.setRedListItems(widget.redListItems)
                            .then((_) {
                          setState(() {});
                        });
                        SharePrefs.setRedCompletedItems(
                                widget.redCompletedItems)
                            .then((_) {
                          setState(() {});
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
