import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app_background.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("To Do list App"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Stack(
          children: <Widget>[
            AppBackgroundPage(),
            InputFieldTasks(),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////
class InputFieldTasks extends StatefulWidget {
  InputFieldTasks({Key key}) : super(key: key);

  @override
  _InputFieldTasksState createState() => _InputFieldTasksState();
}

class _InputFieldTasksState extends State<InputFieldTasks> {
  final tasks = GlobalKey<FormState>();
  bool isChecked = false;
  //validate if the text field is null
  bool _validate = false;

  final List<String> listItems = [];
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
                    if (text.isEmpty) {
                      _validate = true;
                    } else {
                      _validate = false;
                      listItems.add(text);
                      eCtrl.clear();
                      setState(() {});
                    }
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
                              setState(() {});
                            }),
                      ),
                      Container(
                          width: 30,
                          child: InkWell(
                            onTap: () {
                              isChecked = !isChecked;
                              setState(() {});
                            },
                            child: Icon(
                              isChecked
                                  ? Icons.check_box_outline_blank
                                  : Icons.check_box,
                              color: Colors.greenAccent,
                            ),
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
