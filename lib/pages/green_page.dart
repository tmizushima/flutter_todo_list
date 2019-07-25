import 'package:flutter/material.dart';
import 'package:flutter_sample_app/home_page.dart';
import 'package:flutter_sample_app/shared_prefs.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

var greenPageKey = GlobalKey<_GreenPageState>();

class GreenPage extends StatefulWidget {
  final HomePage controller;
  const GreenPage({Key key, this.controller}) : super(key: key);

  @override
  _GreenPageState createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage> {
  List<String> greenListItems = [];
  List<String> greenCompletedItems = [];

  bool _validate = false;

  final TextEditingController eCtrl = TextEditingController();

  void _init() async {
    await SharePrefs.setInstance();
    greenListItems = SharePrefs.getGreenListItems();
    greenCompletedItems = SharePrefs.getGreenCompletedItems();
    setState(() {});
  }

  @override
  void initState() {
    _init();
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
                      greenCompletedItems.add('false');
                      greenListItems.add(text);
                      SharePrefs.setGreenCompletedItems(greenCompletedItems)
                          .then((_) {
                        setState(() {});
                      });
                      SharePrefs.setGreenListItems(greenListItems).then((_) {
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
                        greenCompletedItems.add('false');
                        greenListItems.add(eCtrl.text);
                        SharePrefs.setGreenListItems(greenListItems).then((_) {
                          setState(() {});
                        });
                        SharePrefs.setGreenCompletedItems(greenCompletedItems)
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
            itemCount: greenListItems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ObjectKey(greenListItems[index]),
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
                          Expanded(child: Text(greenListItems[index])),
                          Container(
                            width: 40,
                            child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.redAccent,
                                ),
                                onTap: () {
                                  greenListItems.removeAt(index);
                                  greenCompletedItems.removeAt(index);
                                  SharePrefs.setGreenListItems(greenListItems)
                                      .then((_) {
                                    setState(() {});
                                  });
                                  SharePrefs.setGreenCompletedItems(
                                          greenCompletedItems)
                                      .then((_) {
                                    setState(() {});
                                  });
                                }),
                          ),
                          Container(
                              width: 30,
                              child: InkWell(
                                child: Icon(
                                  (greenCompletedItems[index] == 'false')
                                      ? Icons.check_box_outline_blank
                                      : Icons.check_box,
                                  color: Colors.greenAccent,
                                ),
                                onTap: () {
                                  if (greenCompletedItems[index] == 'false') {
                                    greenCompletedItems[index] = 'true';
                                  } else {
                                    greenCompletedItems[index] = 'false';
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
                    (greenCompletedItems[index] == 'false')
                        ? IconSlideAction(
                            caption: 'Complete',
                            color: Colors.greenAccent,
                            icon: IconData(58826, fontFamily: 'MaterialIcons'),
                            onTap: () {
                              if (greenCompletedItems[index] == 'false') {
                                greenCompletedItems[index] = 'true';
                              } else {
                                greenCompletedItems[index] = 'false';
                              }
                              setState(() {});
                            },
                          )
                        : IconSlideAction(
                            caption: 'Undo',
                            color: Colors.grey,
                            icon: IconData(58826, fontFamily: 'MaterialIcons'),
                            onTap: () {
                              if (greenCompletedItems[index] == 'false') {
                                greenCompletedItems[index] = 'true';
                              } else {
                                greenCompletedItems[index] = 'false';
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
                        greenListItems.removeAt(index);
                        greenCompletedItems.removeAt(index);

                        SharePrefs.setGreenListItems(greenListItems).then((_) {
                          setState(() {});
                        });
                        SharePrefs.setGreenCompletedItems(greenCompletedItems)
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
