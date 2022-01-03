
import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GradingSystem.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step5-ProfessionalDetails.dart';

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


  var highestQualificationSelect = "";
  var courseSelect = "";
  var streamSelect = "";
  var instituteQualifiedFromSelect = "";




  int courseTypeGroupValue = 0;

  List<String> instituteQualifiedFrom = [
    "University Of Kashmir",
    "SSM College Of Enginering",
    "Cluster University",
    "Central University",
    "IUST",
  ];

  String myGradingSystem;



  String myPassingYear;


  ApiServices apiServices = ApiServices();

  ApiResponse<List<GradingSystem>> _apiResponse;
  ApiResponse<List<PassingYear>> _apiResponse2;
  @override
  void initState() {
    fetchPassingYear();
    fetchGradingSystem();
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {});
    });

    super.initState();
  }

  bool isLoading = false;
  fetchGradingSystem() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getGradingSystem();
    setState(() {
      isLoading = false;
    });
  }
  fetchPassingYear() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse2 = await apiServices.getPassingYear();
    setState(() {
      isLoading = false;
    });
  }


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
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Upload Resume",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                  ),
                  const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    selectFile();
                  },
                  child: Row(
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
              
                ],
              ),
            ),
          ),
          
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
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
                      "Profile Headline",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: "Profile Headline",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
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
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownSearch<String>(
                      hint: "Select Qualification",
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownSearch<String>(
                                hint: "Select Course",
                                dropdownSearchDecoration:
                                    const InputDecoration(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Stream",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownSearch<String>(
                                hint: "Select Stream",
                                dropdownSearchDecoration:
                                    const InputDecoration(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Course Type",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                        style: TextStyle(
                                            fontSize: 15,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Institute Qualified From",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownSearch<String>(
                                hint: "Select Institute",
                                dropdownSearchDecoration:
                                    const InputDecoration(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Passing Year",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    hint: Text("Select Year"),
                                    value: myPassingYear,
                                    onChanged: (newValue) {
                                      setState(() {
                                        myPassingYear = newValue;
                                      });
                                    },
                                      items: isLoading
                                      ? ["Please Wait"]
                                          .map(
                                            (value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                  fontFamily:
                                                  "ProximaNova"),
                                            )),
                                      )
                                          .toList():
                                      _apiResponse2.data
                                        .map(
                                          (data) => DropdownMenuItem(
                                              value: data.yearId,
                                              child: Text(data.yearName)),
                                        )
                                        .toList(),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    hint: Text("Select Grading System"),
                                    value: myGradingSystem,
                                    onChanged: (newValue) {
                                      setState(() {
                                        myGradingSystem = newValue;
                                      });
                                    },
                                            items: isLoading
                                        ? ["Please Wait"]
                                            .map(
                                              (value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    fontFamily:
                                                    "ProximaNova"),
                                              )),
                                        )
                                            .toList()
                                            :
                                    _apiResponse.data
                                        .map(
                                          (data) => DropdownMenuItem(
                                              value: data.gradingsystemId,
                                              child: Text(data.gradingsystemName)),
                                        )
                                        .toList(),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GFButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WorkingProfession(),
                      ),
                    );
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
