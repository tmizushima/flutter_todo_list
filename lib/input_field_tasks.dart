import 'package:flutter/material.dart';

class InputFieldTasks extends StatefulWidget {
  @override
  _InputFieldTasksState createState() => _InputFieldTasksState();
}

class _InputFieldTasksState extends State<InputFieldTasks> {
  bool _validate = false;
  List<List<String>> list = [[]];
  List<String> listItems = [];
  List<bool> completedItems = [];
  final TextEditingController eCtrl = new TextEditingController();

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
                    setState(() {
                      if (text.isEmpty) {
                        _validate = true;
                      } else {
                        completedItems.add(false);
                        _validate = false;
                        listItems.add(text);
                        eCtrl.clear();
                      }
                    });
                  },
                ),
              ),
              Container(
                height: 70,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.7)),
                  onPressed: () {},
                  color: Colors.blueAccent,
                  child: new IconButton(
                    padding: new EdgeInsets.symmetric(vertical: 10.0),
                    color: Colors.white,
                    hoverColor: Colors.white,
                    icon: Icon(
                      IconData(57669, fontFamily: 'MaterialIcons'),
                    ),
                    onPressed: () {
                      setState(() {
                        if (eCtrl.text.isEmpty) {
                          _validate = true;
                        } else {
                          completedItems.add(false);
                          _validate = false;
                          listItems.add(eCtrl.text);
                          eCtrl.clear();
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: new ListView.builder(
            itemCount: listItems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(child: Text(listItems[index])),
                      Container(
                        width: 40,
                        child: InkWell(
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.redAccent,
                            ),
                            onTap: () {
                              listItems.removeAt(index);
                              completedItems.removeAt(index);
                              setState(() {});
                            }),
                      ),
                      Container(
                          width: 30,
                          child: InkWell(
                            child: Icon(
                              (completedItems[index] == false)
                                  ? Icons.check_box_outline_blank
                                  : Icons.check_box,
                              color: Colors.greenAccent,
                            ),
                            onTap: () {
                              if (completedItems[index] == false) {
                                completedItems[index] = true;
                              } else {
                                completedItems[index] = false;
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
              );
            },
          ),
        ),
      ],
    );
  }
}
