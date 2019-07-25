// import 'package:flutter/material.dart';
// import 'package:flutter_sample_app/app_background.dart';
// import 'package:flutter_sample_app/pages/green_page.dart';
// import 'package:flutter_sample_app/pages/red_page.dart';
// import 'package:flutter_sample_app/pages/yellow_page.dart';
// import 'package:flutter_sample_app/shared_prefs.dart';

// var completedTaskKey = GlobalKey<State>();

// class CompletedTasks extends StatelessWidget {
//   CompletedTasks({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("Completed Tasks"),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: Stack(
//         children: <Widget>[
//           AppBackgroundPage(),
//           Column(
//             children: <Widget>[
//               ListView.builder(
//                 itemCount: greenPageKey.currentState.greenCompletedItems.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   if (greenPageKey.currentState.greenCompletedItems[index] ==
//                       'true') {
//                     return Column(
//                       children: <Widget>[
//                         Container(
//                           margin: const EdgeInsets.all(2.00),
//                           decoration: BoxDecoration(
//                               color: Colors.greenAccent,
//                               borderRadius: const BorderRadius.all(
//                                   const Radius.circular(5.0))),
//                           child: ListTile(
//                             title: Text(greenPageKey
//                                 .currentState.greenListItems[index]),
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     return Container();
//                   }
//                 },
//               ),
//               ListView.builder(
//                 itemCount:
//                     yellowPageKey.currentState.yellowCompletedItems.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   if (yellowPageKey.currentState.yellowCompletedItems[index] ==
//                       'true') {
//                     return Column(
//                       children: <Widget>[
//                         Container(
//                           margin: const EdgeInsets.all(2.00),
//                           decoration: BoxDecoration(
//                               color: Colors.yellowAccent,
//                               borderRadius: const BorderRadius.all(
//                                   const Radius.circular(5.0))),
//                           child: ListTile(
//                             title: Text(yellowPageKey
//                                 .currentState.yellowListItems[index]),
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     return Container();
//                   }
//                 },
//               ),
//               ListView.builder(
//                 itemCount: redPageKey.currentState.redCompletedItems.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   if (redPageKey.currentState.redCompletedItems[index] ==
//                       'true') {
//                     return Column(
//                       children: <Widget>[
//                         Container(
//                           margin: const EdgeInsets.all(2.00),
//                           decoration: BoxDecoration(
//                               color: Colors.redAccent,
//                               borderRadius: const BorderRadius.all(
//                                   const Radius.circular(5.0))),
//                           child: ListTile(
//                             title: Text(
//                                 redPageKey.currentState.redListItems[index]),
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     return Container();
//                   }
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
