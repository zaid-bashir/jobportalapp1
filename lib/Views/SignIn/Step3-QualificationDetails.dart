// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GradingSystem.dart';
import 'package:job_portal/Models/InstituteQualified.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Models/QualificationDetails.dart';
import 'package:job_portal/Models/Stream.dart';
import 'package:job_portal/Models/qualification-post.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step4-ProfessionalDetails.dart';
import 'package:job_portal/Views/SignIn/Step5-KeySkills.dart';

class QualificationBlueCollar extends StatefulWidget {
   QualificationBlueCollar({Key key, this.uuid}) : super(key: key);
  String uuid;
  int experienceValue;
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

  TextEditingController qualificationSearchCon = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var highestQualificationSelect;
  var courseSelect;
  var streamSelect;
  var instituteQualifiedFromSelect;
  String queries;
  String myInstitute;
  String highQual;
  String Courses;
  String Stream;
  String highQualID = "";
  String courseId = "";
  String streamId = "";
  String instituteId = "";
  String yearID = "";

  int courseTypeGroupValue = 0;

  GradingSystem myGradingSystem;

  PassingYear myPassingYear;

  bool isLoading = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<List<Institute>> _apiResponseInstitute;

  ApiResponse<List<GradingSystem>> _apiResponse;
  ApiResponse<List<PassingYear>> _apiResponse2;
  ApiResponse<List<Qualification>> _apiResponsequalification;
  ApiResponse<List<Qualification>> _apiResponsecourse;
  ApiResponse<List<Streams>> _apiResponsestream;

  TextEditingController profileCont = TextEditingController();
  TextEditingController gradeCont = TextEditingController();
  TextEditingController courseSearchCont = TextEditingController();
  TextEditingController streamSearchCont = TextEditingController();
  TextEditingController instituteSearchCont = TextEditingController();
  TextEditingController yearSearchCont = TextEditingController();

  @override
  void initState() {
    fetchInstitute(query: "");
    fetchHighestQualification(query: "");
    fetchCourses(query: "");
    fetchStream(query: "");
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

  fetchStream({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponsestream = await apiServices.getStream(query: query);
    setState(() {
      isLoading = false;
    });
  }

  fetchCourses({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponsecourse = await apiServices.getCourse(query: query);
    setState(() {
      isLoading = false;
    });
  }

  fetchHighestQualification({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponsequalification =
        await apiServices.getQualification(query: query);
    setState(() {
      isLoading = false;
    });
  }

  List<String> getStream() {
    List<Streams> stream = _apiResponsestream.data;
    List<String> streamItems = [];
    for (int i = 0; i < stream.length; i++) {
      streamItems.add(stream[i].streamName);
    }
    return streamItems;
  }

  List<String> getData() {
    List<Qualification> data = _apiResponsequalification.data;
    List<String> dataItems = [];
    for (int i = 0; i < data.length; i++) {
      dataItems.add(data[i].qualName);
    }
    return dataItems;
  }

  List<String> getCourses() {
    List<Qualification> Courses = _apiResponsecourse.data;
    List<String> courseItems = [];
    for (int i = 0; i < Courses.length; i++) {
      courseItems.add(Courses[i].courseName);
    }
    return courseItems;
  }

  // institute qualified
  fetchInstitute({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseInstitute = await apiServices.getInstitute(query: query);
    setState(() {
      isLoading = false;
    });
  }

  List<String> parseInstitute() {
    List<Institute> institute = _apiResponseInstitute.data;
    List<String> dataItems = [];
    for (int i = 0; i < institute.length; i++) {
      dataItems.add(institute[i].instituteName);
    }
    return dataItems;
  }

  String query;
  String querys;
  String queryss;
  String querysss;

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
      body: Form(
        key: formKey,
        child: ListView(
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
                      padding: const EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          selectFile();
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 2.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
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
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "File should be 2MB",
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
                      child: DropdownSearch<Qualification>(
                        dropdownSearchDecoration: InputDecoration(
                            border: UnderlineInputBorder(
                            )
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Please Select Qualification";
                          }
                          return null;
                        },
                        mode: Mode.DIALOG,
                        items: isLoading
                            ? Qualification()
                            : _apiResponsequalification.data,
                        itemAsString: (Qualification obj) {
                          return obj.qualName;
                        },
                        onFind: (val) async {
                          setState(() {
                            query = val;
                          });
                          return _apiResponsequalification.data;
                        },
                        hint: "Select Highest Qualification",
                        onChanged: (value) {
                          qualificationSearchCon.text = value.qualId.toString();
                          highQualID = value.qualId;
                          print(value.qualId);
                        },
                        showSearchBox: true,
                        popupItemBuilder:
                            (context, Qualification item, bool isSelected) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(item.qualName),
                              ),
                            ),
                          );
                        },
                      ),
                      // FindDropdown(
                      //   searchBoxDecoration: InputDecoration(
                      //     border: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //   ),
                      //   items: getData(),
                      //   searchHint: "Highest Qualification",
                      //   onFind: (val) async {
                      //     setState(() {
                      //       query = val;
                      //     });
                      //     await fetchHighestQualification(query: query);
                      //     getData();
                      //     return [""];
                      //   },
                      //   onChanged: (item) {
                      //     setState(() {
                      //       highQual = item;
                      //     });
                      //   },
                      // ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
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
                          child: DropdownSearch<Qualification>(
                            dropdownSearchDecoration: InputDecoration(
                                border: UnderlineInputBorder(
                                )
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "Please Select Course";
                              }
                              return null;
                            },
                            mode: Mode.DIALOG,
                            items: isLoading
                                ? [Qualification()]
                                : _apiResponsecourse.data,
                            itemAsString: (Qualification obj) {
                              return obj.courseName;
                            },
                            onFind: (val) async {
                              setState(() {
                                querys = val;
                              });
                              return _apiResponsecourse.data;
                            },
                            hint: "Select Course",
                            onChanged: (value) {
                              courseSearchCont.text = value.qualId.toString();
                              courseId = value.courseId;
                              print(value.courseId);
                            },
                            showSearchBox: true,
                            popupItemBuilder:
                                (context, Qualification item, bool isSelected) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(item.courseName),
                                  ),
                                ),
                              );
                            },
                          ),
                          // FindDropdown(
                          //   searchBoxDecoration: InputDecoration(
                          //     border: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //   ),
                          //   items: getCourses(),
                          //   searchHint: "Course",
                          //   onFind: (val) async {
                          //     setState(() {
                          //       querys = val;
                          //     });
                          //     await fetchCourses(query: querys);
                          //     getCourses();
                          //     return [""];
                          //   },
                          //   onChanged: (item) {
                          //     setState(() {
                          //       Courses = item;
                          //     });
                          //   },
                          // ),
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
                          child: DropdownSearch<Streams>(
                            dropdownSearchDecoration: InputDecoration(
                                border: UnderlineInputBorder(
                                )
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "Please Select Stream";
                              }
                              return null;
                            },
                            mode: Mode.DIALOG,
                            items:
                                isLoading ? Streams() : _apiResponsestream.data,
                            itemAsString: (Streams obj) {
                              return obj.streamName;
                            },
                            onFind: (val) async {
                              setState(() {
                                queryss = val;
                              });
                              return _apiResponsestream.data;
                            },
                            hint: "Select Streams",
                            onChanged: (value) {
                              streamSearchCont.text = value.streamId.toString();
                              streamId = value.streamId;
                              print(value.streamId);
                            },
                            showSearchBox: true,
                            popupItemBuilder:
                                (context, Streams item, bool isSelected) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(item.streamName),
                                  ),
                                ),
                              );
                            },
                          ),
                          // FindDropdown(
                          //   searchBoxDecoration: InputDecoration(
                          //     border: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //   ),
                          //   items: getStream(),
                          //   searchHint: "Streams",
                          //   onFind: (val) async {
                          //     setState(() {
                          //       queryss = val;
                          //     });
                          //     await fetchStream(query: queryss);
                          //
                          //     getStream();
                          //     return [""];
                          //   },
                          //   onChanged: (item) {
                          //     setState(() {
                          //       Stream = item;
                          //     });
                          //   },
                          // ),
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
                              _radioButtons(context),
                              // Row(
                              //   children: [
                              //     Radio(
                              //
                              //       // size: 20,
                              //       // activeBorderColor: Color(0xff2972ff),
                              //       value: 1,
                              //       groupValue: courseTypeGroupValue,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           courseTypeGroupValue = value;
                              //         });
                              //       },
                              //       // inactiveIcon: null,
                              //       // radioColor: Color(0xff2972ff),
                              //     ),
                              //     const SizedBox(
                              //       width: 7,
                              //     ),
                              //     const Text(
                              //       "Full Time",
                              //       style: TextStyle(
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.bold,
                              //           fontFamily: "ProximaNova"),
                              //     ),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 7,
                              // ),
                              // Row(
                              //   children: [
                              //     GFRadio(
                              //       size: 20,
                              //       value: 2,
                              //       groupValue: courseTypeGroupValue,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           courseTypeGroupValue = value;
                              //         });
                              //       },
                              //       inactiveIcon: null,
                              //       activeBorderColor: Color(0xff2972ff),
                              //       radioColor: Color(0xff2972ff),
                              //     ),
                              //     const SizedBox(
                              //       width: 7,
                              //     ),
                              //     const Text(
                              //       "Correspondance",
                              //       style: TextStyle(
                              //         fontFamily: "ProximaNova",
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 1.5,
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 7,
                              // ),
                              // Row(
                              //   children: [
                              //     GFRadio(
                              //       size: 20,
                              //       activeBorderColor: Color(0xff2972ff),
                              //       value: 3,
                              //       groupValue: courseTypeGroupValue,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           courseTypeGroupValue = value;
                              //         });
                              //       },
                              //       inactiveIcon: null,
                              //       radioColor: Color(0xff2972ff),
                              //     ),
                              //     const SizedBox(
                              //       width: 7,
                              //     ),
                              //     const Text(
                              //       "Distance",
                              //       style: TextStyle(
                              //         fontFamily: "ProximaNova",
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 1.5,
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 7,
                              // ),
                              // Row(
                              //   children: [
                              //     GFRadio(
                              //       size: 20,
                              //       activeBorderColor: Color(0xff2972ff),
                              //       value: 4,
                              //       groupValue: courseTypeGroupValue,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           courseTypeGroupValue = value;
                              //         });
                              //       },
                              //       inactiveIcon: null,
                              //       radioColor: Color(0xff2972ff),
                              //     ),
                              //     const SizedBox(
                              //       width: 7,
                              //     ),
                              //     const Text(
                              //       "Online",
                              //       style: TextStyle(
                              //         fontFamily: "ProximaNova",
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 1.5,
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: DropdownSearch<Institute>(
                            dropdownSearchDecoration: InputDecoration(
                                border: UnderlineInputBorder(

                                )
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "Please Select Institute";
                              }
                              return null;
                            },
                            mode: Mode.DIALOG,
                            items: isLoading
                                ? Institute()
                                : _apiResponseInstitute.data,
                            itemAsString: (Institute obj) {
                              return obj.instituteName;
                            },
                            onFind: (val) async {
                              setState(() {
                                querysss = val;
                              });
                              return _apiResponseInstitute.data;
                            },
                            hint: "Select Institute",
                            onChanged: (value) {
                              instituteSearchCont.text =
                                  value.instituteId.toString();
                              instituteId = value.instituteId;
                              print(value.instituteId);
                            },
                            showSearchBox: true,
                            popupItemBuilder:
                                (context, Institute item, bool isSelected) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(item.instituteName),
                                  ),
                                ),
                              );
                            },
                          ),
                          // FindDropdown(
                          //   searchBoxDecoration: const InputDecoration(
                          //     border: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //   ),
                          //   items: parseInstitute(),
                          //   searchHint: "Institute Name",
                          //   onFind: (val) async {
                          //     setState(() {
                          //       queries = val;
                          //     });
                          //     await fetchInstitute(query: queries);
                          //     parseInstitute();
                          //     return [""];
                          //   },
                          //   onChanged: (item) {
                          //     setState(() {
                          //       myInstitute = item;
                          //     });
                          //   },
                          // ),
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
                          child: DropdownButtonFormField<PassingYear>(
                            hint: Text("Select Year",style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),),
                            value: myPassingYear,
                            onChanged: (PassingYear newValue) {
                              setState(() {
                                myPassingYear = newValue;
                              });
                            },
                            validator: (value) =>
                            value == null ? 'Please fill Year' : null,
                            items: _apiResponse2.data.map((PassingYear user) {
                              return DropdownMenuItem<PassingYear>(
                                value: user,
                                child: Text(
                                  user.yearName,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
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
                          child: DropdownButtonFormField<GradingSystem>(

                            hint: Text("Grading Value",style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),),
                            value: myGradingSystem,
                            onChanged: (GradingSystem newValue) {
                              setState(() {
                                myGradingSystem = newValue;
                              });
                            },
                            validator: (value) =>
                            value == null ? 'Please fill Grading Value' : null,
                            items: _apiResponse.data.map((GradingSystem user) {
                              return DropdownMenuItem<GradingSystem>(
                                value: user,
                                child: Text(
                                  user.gradingsystemName,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Grade Value";
                              } else {
                                return null;
                              }
                            },
                            controller: gradeCont,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Grade Value",
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: GFButton(
                    onPressed: () async {
                      print("#############");
                      print(widget.uuid);
                      print("#############");
                      if (formKey.currentState.validate()) {
                        print(yearID);
                        print(myGradingSystem.gradingsystemId);
                        setState(() {
                          isLoading = true;
                        });
                        final insert = QualificationPost(
                            candidateUuid: widget.uuid,
                            candidatequalQualificationId: int.parse(highQualID),
                            candidatequalCourseId: int.parse(courseId),
                            candidatequalStreamId: int.parse(streamId),
                            candidatequalCousetypeId: courseTypeGroupValue,
                            candidatequalInstituteId: int.parse(instituteId),
                            candidatequalCompletionYear: int.parse(myPassingYear.yearId),
                            candidatequalGradingsystemId: int.parse(myGradingSystem.gradingsystemId),
                            candidatequalMarks: int.parse(gradeCont.text));
                        final result =
                            await apiServices.PostQualification(insert);
                        setState(() {
                          isLoading = false;
                        });
                        const title = "Done";
                        final text = result.error
                            ? (result.errorMessage ?? "An Error Occurred")
                            : "Successfully Created";
                        // showDialog(
                        //   context: context,
                        //   builder: (_) => AlertDialog(
                        //     title: const Text(title),
                        //     content: Text(text),
                        //     actions: [
                        //       ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //           child: const Text("OK"))
                        //     ],
                        //   ),
                        // ).then((data) {
                        //   if (result.data) {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => KeySkillsPage(uuid: widget.uuid,)));
                        //   }
                        // });
                      }
                      Navigator.of(context).push(
                          MaterialPageRoute(
                                       builder: (context) => WorkingProfession(uuid: widget.uuid,)));

                    },
                    text: "Next",
                    type: GFButtonType.solid,
                  )),
            ),
          ],
        ),
      ),
    );
  }
  Widget _radioButtons (BuildContext context){
  return FormField(builder: (state){
    return Column(
      children: [
        Row(
          children: [
            GFRadio(
              size: 20,
              inactiveIcon: null,
              activeBorderColor: Color(0xff2972ff),
              radioColor: Color(0xff2972ff),
              value: 1,
              groupValue: courseTypeGroupValue,
              onChanged: (value) {
                setState(() {
                  courseTypeGroupValue = value;
                });
              },
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
              value: 2,
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
              value: 4,
              groupValue: courseTypeGroupValue,
              onChanged: (value) {
                setState(() {
                  courseTypeGroupValue = value;
                });
              },
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
        Text(
          state.errorText ?? "",
          style: TextStyle(
            color:Theme.of(context).errorColor,
          ),
        )
      ],
    );
  },
  validator: (value){
    if(courseTypeGroupValue == 0) {
      return "Choose one of the option";
    }
    return null;
  }
  );
  }
}
