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
  final bool alreadySaved = true;
  final List<String> listItems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.7), color: Colors.white),
          margin: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: eCtrl,
                  onSubmitted: (text) {
                    listItems.add(text);
                    eCtrl.clear();
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Things to do",
                    contentPadding: const EdgeInsets.only(
                        left: 25.0, bottom: 15.0, top: 15.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                  autofocus: false,
                  autocorrect: true,
                ),
              ),
              Container(
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
                      listItems.add(eCtrl.text);
                      eCtrl.clear();
                      setState(() {});
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
                        child: GestureDetector(
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.redAccent,
                            ),
                            onTap: () {
                              print("Removed");
                            }),
                      ),
                      Container(
                        width: 30,
                        child: GestureDetector(
                            child: Icon(Icons.check_box_outline_blank),
                            onTap: () {
                              print("Checked");
                            }),
                      ),
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
