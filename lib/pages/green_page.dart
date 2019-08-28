import 'package:flutter/material.dart';
import 'package:flutter_sample_app/home_page.dart';
import 'package:flutter_sample_app/shared_prefs.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

var greenPageKey = GlobalKey<_GreenPageState>();

class GreenPage extends StatefulWidget {
  final HomePage controller;
  final greenListItems;
  final greenCompletedItems;

  const GreenPage(
      {Key key, this.controller, this.greenListItems, this.greenCompletedItems})
      : super(key: key);

  @override
  _GreenPageState createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage> {
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
                      widget.greenCompletedItems.add('false');
                      widget.greenListItems.add(text);
                      SharePrefs.setGreenCompletedItems(
                              widget.greenCompletedItems)
                          .then((_) {
                        setState(() {});
                      });
                      SharePrefs.setGreenListItems(widget.greenListItems)
                          .then((_) {
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
                        widget.greenCompletedItems.add('false');
                        widget.greenListItems.add(eCtrl.text);
                        SharePrefs.setGreenListItems(widget.greenListItems)
                            .then((_) {
                          setState(() {});
                        });
                        SharePrefs.setGreenCompletedItems(
                                widget.greenCompletedItems)
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
            itemCount: widget.greenListItems.length ?? 0,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ObjectKey(widget.greenListItems[index]),
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
                          Expanded(child: Text(widget.greenListItems[index])),
                          Container(
                            width: 40,
                            child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.redAccent,
                                ),
                                onTap: () {
                                  widget.greenListItems.removeAt(index);
                                  widget.greenCompletedItems.removeAt(index);
                                  SharePrefs.setGreenListItems(
                                          widget.greenListItems)
                                      .then((_) {
                                    setState(() {});
                                  });
                                  SharePrefs.setGreenCompletedItems(
                                          widget.greenCompletedItems)
                                      .then((_) {
                                    setState(() {});
                                  });
                                }),
                          ),
                          Container(
                              width: 30,
                              child: InkWell(
                                child: Icon(
                                  (widget.greenCompletedItems[index] == 'false')
                                      ? Icons.check_box_outline_blank
                                      : Icons.check_box,
                                  color: Colors.greenAccent,
                                ),
                                onTap: () {
                                  if (widget.greenCompletedItems[index] ==
                                      'false') {
                                    widget.greenCompletedItems[index] = 'true';
                                  } else {
                                    widget.greenCompletedItems[index] = 'false';
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
                    (widget.greenCompletedItems[index] == 'false')
                        ? IconSlideAction(
                            caption: 'Complete',
                            color: Colors.greenAccent,
                            icon: IconData(58826, fontFamily: 'MaterialIcons'),
                            onTap: () {
                              if (widget.greenCompletedItems[index] ==
                                  'false') {
                                widget.greenCompletedItems[index] = 'true';
                              } else {
                                widget.greenCompletedItems[index] = 'false';
                              }
                              setState(() {});
                            },
                          )
                        : IconSlideAction(
                            caption: 'Undo',
                            color: Colors.grey,
                            icon: IconData(58826, fontFamily: 'MaterialIcons'),
                            onTap: () {
                              if (widget.greenCompletedItems[index] ==
                                  'false') {
                                widget.greenCompletedItems[index] = 'true';
                              } else {
                                widget.greenCompletedItems[index] = 'false';
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
                        widget.greenListItems.removeAt(index);
                        widget.greenCompletedItems.removeAt(index);

                        SharePrefs.setGreenListItems(widget.greenListItems)
                            .then((_) {
                          setState(() {});
                        });
                        SharePrefs.setGreenCompletedItems(
                                widget.greenCompletedItems)
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
