import 'package:flutter/material.dart';
import 'package:flutter_sample_app/interface_page.dart';
import 'app_background.dart';
import 'completed_task_page.dart';

var homePageKey = GlobalKey<_HomePageState>();

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("To Do list App"),
        elevation: 0.7,
        backgroundColor: Colors.blueAccent,
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: 'blue'),
            Tab(text: 'yellow'),
            Tab(text: 'red'),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {});
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CompletedTasks(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          AppBackgroundPage(),
          // TabBarView(
          //   children: <Widget>[

          //   ],),
          InterfacePage(
            key: interfacePageKey,
          ),
        ],
      ),
    );
  }
}
