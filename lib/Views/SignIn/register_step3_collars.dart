// ignore_for_file: prefer_const_constructors, avoid_print, missing_required_param, avoid_unnecessary_containers

import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Views/SignIn/professional_details1-step5.dart';

class QualificationBlueCollar extends StatefulWidget {
  const QualificationBlueCollar({Key key}) : super(key: key);

  @override
  _QualificationBlueCollarState createState() =>
      _QualificationBlueCollarState();
}

class _QualificationBlueCollarState extends State<QualificationBlueCollar>
    with SingleTickerProviderStateMixin {
  AnimationController loadingController;

  File _file;
  PlatformFile _platformFile;

  selectFile() async {
    final file = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'docx']);

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  var highestQualificationSelect = "";
  var courseSelect = "";
  var streamSelect = "";
  var instituteQualifiedFromSelect = "";

  List<String> highestQualification = [
    "PG",
    "UG",
    "HSE 10+2",
    "Matriculation 10th",
    "Below 10th"
  ];
  List<String> course = [
    "MBA",
    "M.Tech",
    "BBA",
    "B.Tech",
    "MCA",
    "BCA",
  ];
  List<String> stream = [
    "Finance",
    "Operations",
    "Computer Science",
    "Civil Enginering",
    "Mechanical",
    "Human Resource",
  ];

  int courseTypeGroupValue = 0;

  List<String> instituteQualifiedFrom = [
    "University Of Kashmir",
    "SSM College Of Enginering",
    "Cluster University",
    "Central University",
    "IUST",
  ];

  String myGradingSystem = "CGPA";

  List<String> gradingSystem = [
    "CGPA",
    "Percentile",
    "Grades",
    "Score",
  ];

  String myPassingYear = "1971";

  List<String> myPassingYearList = [
    "1971",
    "1972",
    "1973",
    "1974",
    "1975",
    "1976",
    "1977",
    "1978",
    "1979",
    "1980"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "Qualification Details",
                  style: TextStyle(fontSize: 20,fontFamily: "ProximaNova" ,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Upload Resume",
              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                selectFile();
              },
              child: Card(
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
                            "pdf,docx",
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
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Profile Summary",
                    style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "Profile Summary",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Highest Qualification",
                    style:TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: DropdownSearch<String>(
                      dropdownSearchDecoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      mode: Mode.DIALOG,
                      showSearchBox: true,
                      showSelectedItems: true,
                      items: highestQualification,
                      // label: "Menu mode",
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (item) {
                        setState(() {
                          highestQualificationSelect = item;
                        });
                      },
                      selectedItem: highestQualificationSelect,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                !(highestQualificationSelect == "" ||
                        highestQualificationSelect == "Below 10th")
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Course",
                              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: DropdownSearch<String>(
                                dropdownSearchDecoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                mode: Mode.DIALOG,
                                showSearchBox: true,
                                showSelectedItems: true,
                                items: course,
                                // label: "Menu mode",
                                popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: (item) {
                                  setState(() {
                                    courseSelect = item;
                                  });
                                },
                                selectedItem: courseSelect,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Stream",
                              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: DropdownSearch<String>(
                                dropdownSearchDecoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                mode: Mode.DIALOG,
                                showSearchBox: true,
                                showSelectedItems: true,
                                items: stream,
                                // label: "Menu mode",
                                popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: (item) {
                                  setState(() {
                                    streamSelect = item;
                                  });
                                },
                                selectedItem: streamSelect,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Course Type",
                              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      GFRadio(
                                        size: 20,
                                        activeBorderColor: Color(0xff2972ff),
                                        value: 0,
                                        groupValue: courseTypeGroupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            courseTypeGroupValue = value;
                                          });
                                        },
                                        inactiveIcon: null,
                                        radioColor: Color(0xff2972ff),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      const Text(
                                        "Full Time",
                                        style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      GFRadio(
                                        size: 20,
                                        value: 1,
                                        groupValue: courseTypeGroupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            courseTypeGroupValue = value;
                                          });
                                        },
                                        inactiveIcon: null,
                                        activeBorderColor: Color(0xff2972ff),
                                        radioColor: Color(0xff2972ff),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      const Text(
                                        "Correspondance",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      GFRadio(
                                        size: 20,
                                        activeBorderColor: Color(0xff2972ff),
                                        value: 2,
                                        groupValue: courseTypeGroupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            courseTypeGroupValue = value;
                                          });
                                        },
                                        inactiveIcon: null,
                                        radioColor: Color(0xff2972ff),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      const Text(
                                        "Distance",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      GFRadio(
                                        size: 20,
                                        activeBorderColor: Color(0xff2972ff),
                                        value: 3,
                                        groupValue: courseTypeGroupValue,
                                        onChanged: (value) {
                                          setState(() {
                                            courseTypeGroupValue = value;
                                          });
                                        },
                                        inactiveIcon: null,
                                        radioColor: Color(0xff2972ff),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      const Text(
                                        "Online",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Institute Qualified From",
                              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: DropdownSearch<String>(
                                dropdownSearchDecoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                mode: Mode.DIALOG,
                                showSearchBox: true,
                                showSelectedItems: true,
                                items: instituteQualifiedFrom,
                                // label: "Menu mode",
                                popupItemDisabled: (String s) =>
                                    s.startsWith('I'),
                                onChanged: (item) {
                                  setState(() {
                                    instituteQualifiedFromSelect = item;
                                  });
                                },
                                selectedItem: instituteQualifiedFromSelect,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Passing Year",
                              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    value: myPassingYear,
                                    onChanged: (newValue) {
                                      setState(() {
                                        myGradingSystem = newValue;
                                      });
                                    },
                                    items: myPassingYearList
                                        .map(
                                          (value) => DropdownMenuItem(
                                              value: value, child: Text(value)),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Grading System",
                              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    value: myGradingSystem,
                                    onChanged: (newValue) {
                                      setState(() {
                                        myGradingSystem = newValue;
                                      });
                                    },
                                    items: gradingSystem
                                        .map(
                                          (value) => DropdownMenuItem(
                                              value: value, child: Text(value)),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Grade Value",
                              style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Grade Value",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GFButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WorkingProfession(),),);
                  },
                  text: "Next",
                  type: GFButtonType.solid,
                )),
          ),
        ],
      ),
    );
  }
}
