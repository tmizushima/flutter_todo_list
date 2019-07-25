import 'package:flutter/material.dart';
import 'package:flutter_sample_app/pages/green_page.dart';
import 'package:flutter_sample_app/pages/red_page.dart';
import 'package:flutter_sample_app/pages/yellow_page.dart';
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
    controller = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("To Do list App"),
        elevation: 0.7,
        backgroundColor: Colors.blueAccent,
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              child: Icon(
                Icons.crop_square,
                color: Colors.greenAccent,
              ),
            ),
            Tab(
              child: Icon(
                Icons.crop_square,
                color: Colors.yellowAccent,
              ),
            ),
            Tab(
              child: Icon(
                Icons.crop_square,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.list),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => CompletedTasks(
        //             key: completedTaskKey,
        //           ),
        //         ),
        //       );
        //       setState(() {});
        //     },
        //   ),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          AppBackgroundPage(),
          TabBarView(
            controller: controller,
            children: <Widget>[
              Container(
                child: GreenPage(
                  key: greenPageKey,
                ),
              ),
              Container(
                child: YellowPage(
                  key: yellowPageKey,
                ),
              ),
              Container(
                child: RedPage(
                  key: redPageKey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
