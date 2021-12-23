import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class BlueCollar extends StatefulWidget {
  const BlueCollar({Key key}) : super(key: key);

  @override
  _BlueCollarState createState() => _BlueCollarState();
}

class _BlueCollarState extends State<BlueCollar> {
  List list = [
    "Textile Industry",
    "IT Industry",
    "Aviation Industry",
    "AutoMobile Industry"
  ];
  List lists = [
    "Bachelor's  in Business Management",
    "Bachelor's  in Computer Application",
    "Masters in Computer Application",
    "B.Tech"
  ];

  List insti = [
    "Kashmir University",
    "Jammu University",
    "Delhi University",
    "Mumbai University"
  ];

  bool isFresher = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Attach File From Phone",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova",
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "pdf,doc,png accepted",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProximaNova",
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'About',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Profile Summary',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const <Widget>[
                              Flexible(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Profile Summary"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 20.0, bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'Industry Type',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          "Preferred Industry",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova",
                              fontSize: 15),
                        ),
                      ),
                      GFSearchBar(
                        searchList: list,
                        searchQueryBuilder: (query, list) {
                          return list
                              .where((item) => item
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        },
                        overlaySearchListItemBuilder: (item) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              item,
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        },
                        onItemSelected: (item) {
                          setState(() {
                            print("$item");
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children:  <Widget>[
                          isFresher ?  Text(
                            'Education',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.bold),
                          ) : Text(
                            'Experience',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: isFresher ? Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Highest Education',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: GFSearchBar(
                                      searchList: lists,
                                      searchQueryBuilder: (query, lists) {
                                        return lists
                                            .where((item) => item
                                            .toLowerCase()
                                            .contains(query.toLowerCase()))
                                            .toList();
                                      },
                                      overlaySearchListItemBuilder: (item) {
                                        return Container(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            item,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        );
                                      },
                                      onItemSelected: (item) {
                                        setState(() {
                                          print("$item");
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Institute qualified from',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: GFSearchBar(
                                      searchList: insti,
                                      searchQueryBuilder: (query, insti) {
                                        return insti
                                            .where((item) => item
                                            .toLowerCase()
                                            .contains(query.toLowerCase()))
                                            .toList();
                                      },
                                      overlaySearchListItemBuilder: (item) {
                                        return Container(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            item,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        );
                                      },
                                      onItemSelected: (item) {
                                        setState(() {
                                          print("$item");
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                )
                : Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Previous Job Title',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Previous Job Title"),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Previous Job Role',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Previous Job Title"),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Tenure of last job',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "ProximaNova"),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Tenure of last job"),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Job Experience',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Job Experience"),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Previous Salary',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Previous Salary"),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //     padding:
              //         const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.max,
              //       children: <Widget>[
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           mainAxisSize: MainAxisSize.min,
              //           children: const <Widget>[
              //             Text(
              //               'Education',
              //               style: TextStyle(
              //                   fontSize: 18.0,
              //                   fontFamily: "ProximaNova",
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ],
              //     )),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 10,
              //   ),
              //   child: Card(
              //     elevation: 5,
              //     child: Padding(
              //       padding: const EdgeInsets.only(bottom: 15),
              //       child: Column(
              //         children: [
              //           Padding(
              //               padding: const EdgeInsets.only(
              //                   left: 25.0, right: 25.0, top: 20.0),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 children: <Widget>[
              //                   Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: const <Widget>[
              //                       Text(
              //                         'Highest Education',
              //                         style: TextStyle(
              //                             fontSize: 16.0,
              //                             fontFamily: "ProximaNova",
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               )),
              //           Padding(
              //               padding: const EdgeInsets.only(
              //                   left: 10.0, right: 10.0, top: 2.0),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 children: <Widget>[
              //                   Flexible(
              //                     child: GFSearchBar(
              //                       searchList: lists,
              //                       searchQueryBuilder: (query, lists) {
              //                         return lists
              //                             .where((item) => item
              //                                 .toLowerCase()
              //                                 .contains(query.toLowerCase()))
              //                             .toList();
              //                       },
              //                       overlaySearchListItemBuilder: (item) {
              //                         return Container(
              //                           padding: EdgeInsets.all(8),
              //                           child: Text(
              //                             item,
              //                             style: TextStyle(fontSize: 18),
              //                           ),
              //                         );
              //                       },
              //                       onItemSelected: (item) {
              //                         setState(() {
              //                           print("$item");
              //                         });
              //                       },
              //                     ),
              //                   ),
              //                 ],
              //               )),
              //           Padding(
              //               padding: const EdgeInsets.only(
              //                 left: 25.0,
              //                 right: 25.0,
              //               ),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 children: <Widget>[
              //                   Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: const <Widget>[
              //                       Text(
              //                         'Institute qualified from',
              //                         style: TextStyle(
              //                             fontSize: 16.0,
              //                             fontFamily: "ProximaNova",
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               )),
              //           Padding(
              //               padding: const EdgeInsets.only(
              //                   left: 10.0, right: 10.0, top: 2.0),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 children: <Widget>[
              //                   Flexible(
              //                     child: GFSearchBar(
              //                       searchList: insti,
              //                       searchQueryBuilder: (query, insti) {
              //                         return insti
              //                             .where((item) => item
              //                                 .toLowerCase()
              //                                 .contains(query.toLowerCase()))
              //                             .toList();
              //                       },
              //                       overlaySearchListItemBuilder: (item) {
              //                         return Container(
              //                           padding: EdgeInsets.all(8),
              //                           child: Text(
              //                             item,
              //                             style: TextStyle(fontSize: 18),
              //                           ),
              //                         );
              //                       },
              //                       onItemSelected: (item) {
              //                         setState(() {
              //                           print("$item");
              //                         });
              //                       },
              //                     ),
              //                   ),
              //                 ],
              //               )),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
