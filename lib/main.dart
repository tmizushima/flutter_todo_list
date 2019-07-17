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
          title: Text("Sample App"),
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Form(
          key: Key('tasks'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Things to do",
                  contentPadding: const EdgeInsets.only(
                      left: 19.0, bottom: 15.0, top: 15.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
                autofocus: false,
                autocorrect: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please type some text";
                  }
                  return null;
                },
              ),
              RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.7)),
                onPressed: () {
                  if (tasks.currentState.validate()) {
                    // Process data.
                  }
                },
                child: new SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: new IconButton(
                    padding: new EdgeInsets.symmetric(vertical: 10.0),
                    color: Colors.blueAccent,
                    hoverColor: Colors.white,
                    icon: Icon(
                      IconData(57669, fontFamily: 'MaterialIcons'),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: ListTile(
            title: Text("This is a first card"),
            trailing: IconButton(
              icon: Icon(alreadySaved
                  ? Icons.check_box_outline_blank
                  : Icons.check_box),
              onPressed: () {},
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {}
              });
            },
          ),
        ),
      ],
    );
  }
}
