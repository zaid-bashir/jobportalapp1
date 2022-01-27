// import 'package:flutter/material.dart';

// class AcademicDetail extends StatefulWidget {
//   const AcademicDetail({Key key}) : super(key: key);

//   @override
//   _AcademicDetailState createState() => _AcademicDetailState();
// }

// class _AcademicDetailState extends State<AcademicDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: SingleChildScrollView(
//                 child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 10, right: 10, bottom: 10, top: 20),
//                     child: Column(children: [
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     icon: const Icon(Icons.arrow_back)),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text('Professional Details',
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "ProximaNova")),
//                         ],
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.only(
//                         top: 30,
//                       )),
//                       Padding(
//                           padding: const EdgeInsets.only(
//                               left: 22.0, right: 25.0, top: 20.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: const <Widget>[
//                                   Text(
//                                     'Academic Projects',
//                                     style: TextStyle(
//                                         fontSize: 15.0,
//                                         fontFamily: "ProximaNova",
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 25.0, right: 25.0, top: 2.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: const <Widget>[
//                             Flexible(
//                               child: TextField(
//                                 decoration: InputDecoration(hintText: ""),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.only(
//                               left: 22.0, right: 25.0, top: 20.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: const <Widget>[
//                                   Text(
//                                     'Professional Details',
//                                     style: TextStyle(
//                                         fontSize: 15.0,
//                                         fontFamily: "ProximaNova",
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 25.0, right: 25.0, top: 2.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: const <Widget>[
//                             Flexible(
//                               child: TextField(
//                                 decoration: InputDecoration(hintText: ""),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.only(
//                               left: 22.0, right: 25.0, top: 20.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: const <Widget>[
//                                   Text(
//                                     'Accomplishments',
//                                     style: TextStyle(
//                                         fontSize: 15.0,
//                                         fontFamily: "ProximaNova",
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 25.0, right: 25.0, top: 2.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: const <Widget>[
//                             Flexible(
//                               child: TextField(
//                                 decoration: InputDecoration(hintText: ""),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ])))));
//   }
// }
