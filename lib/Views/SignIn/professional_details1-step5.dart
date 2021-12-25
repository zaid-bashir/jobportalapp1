import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:getwidget/getwidget.dart';

class WorkingProfession extends StatefulWidget {
  const WorkingProfession({Key key}) : super(key: key);

  @override
  _WorkingProfessionState createState() => _WorkingProfessionState();
}

class _WorkingProfessionState extends State<WorkingProfession> {
  int groupValue = 0;
  List lists = [
    "ClustTech Pvt Ltd",
    "Zumr Pvt Ltd",
    "Accenture",
    "Microsoft"
    "Google"
  ];
  List list = [
    "IT-software",
    "Education/training",
    "IT- hardware/Training",
    "Internet/ E- commerce"
  ];
  List list3 = [
    "MAnufacturing",
    "BPO/Call Center",
    "IT-Hardware/ Networking",
    "E-Learning"
  ];

  bool isFresher = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.only(left: 3.0),
      child: Column(children: [
        ListTile(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: Text('Professional Details',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProximaNova")),
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
                    // Text(
                    //   'Industry Type',
                    //   style: TextStyle(
                    //       fontSize: 18.0,
                    //       fontFamily: "ProximaNova",
                    //       fontWeight: FontWeight.bold),
                    // ),
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
                    "Current/ Previous Company Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova",
                        fontSize: 15),
                  ),
                ),
                GFSearchBar(
                  searchList: lists,
                  searchQueryBuilder: (query, list) {
                    return lists
                        .where((item) =>
                            item.toLowerCase().contains(query.toLowerCase()))
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
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 20.0, bottom: 10),
            child: Row(
              children: [
                GFRadio(
                  value: 2,
                  size: GFSize.SMALL,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: GFColors.SUCCESS,
                  radioColor: GFColors.SUCCESS,
                ),
                SizedBox(
                  width: 17,

                ),
                Text("yes") ,
                SizedBox(
                  width: 17,

                ),
                GFRadio(
                  value: 2,
                  size: GFSize.SMALL,
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                  inactiveIcon: null,
                  activeBorderColor: GFColors.SUCCESS,
                  radioColor: GFColors.SUCCESS,
                ),
                SizedBox(
                  width: 17,

                ),
                Text("No") ,

              ],
            )),
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
                    // Text(
                    //   'Industry Type',
                    //   style: TextStyle(
                    //       fontSize: 18.0,
                    //       fontFamily: "ProximaNova",
                    //       fontWeight: FontWeight.bold),
                    // ),
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
                    "Current/ Previous Designation",
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
                        .where((item) =>
                            item.toLowerCase().contains(query.toLowerCase()))
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
                                'Current/ Previous Salary',
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
                                hintText: "Current/ Previous Salary"),
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
                    // Text(
                    //   'Industry Type',
                    //   style: TextStyle(
                    //       fontSize: 18.0,
                    //       fontFamily: "ProximaNova",
                    //       fontWeight: FontWeight.bold),
                    // ),
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
                    "Industry",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova",
                        fontSize: 15),
                  ),
                ),
                GFSearchBar(
                  searchList: list3,
                  searchQueryBuilder: (query, list) {
                    return list3
                        .where((item) =>
                            item.toLowerCase().contains(query.toLowerCase()))
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
      ]),
    )));
  }
}
