// ignore_for_file: must_be_immutable, avoid_print

import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GradingSystem.dart';
import 'package:job_portal/Models/InstituteQualified.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Models/QualificationDetails.dart';
import 'package:job_portal/Models/Stream.dart';
import 'package:job_portal/Models/QualificationPost.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step4-ProfessionalDetails.dart';
import 'package:job_portal/Views/SignIn/Step5-KeySkills.dart';

class QualificationBlueCollar extends StatefulWidget {
   QualificationBlueCollar({Key key, this.uuid,this.token,this.experienceId}) : super(key: key);
  String uuid;
  String token;
  int experienceId;
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
                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: this. qualificationSearchCon,
                            decoration: InputDecoration(
                                hintText: 'Qualification'
                            )
                        ),
                        debounceDuration: Duration(milliseconds: 500),
                        suggestionsCallback: ApiServices.getQualification,
                        itemBuilder: (context, Qualification suggestions){
                          final quall = suggestions;
                          return ListTile(
                            title: Text(quall.qualName) ,
                          );
                        },
                        noItemsFoundBuilder: (context)=>Text(""),

                        onSuggestionSelected: (Qualification suggesstion){
                          // final skill = suggesstion;
                          qualificationSearchCon.text  = suggesstion.qualName;
                          highQualID = suggesstion.qualId;

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
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: this. courseSearchCont,
                                decoration: InputDecoration(
                                    hintText: 'Course'
                                )
                            ),
                            debounceDuration: Duration(milliseconds: 500),
                            suggestionsCallback: ApiServices.getCourse ,
                            itemBuilder: (context, Qualification suggestions){
                              final skill = suggestions;
                              return ListTile(
                                title: Text(skill.courseName) ,
                              );
                            },
                            noItemsFoundBuilder: (context)=>Text(""),

                            onSuggestionSelected: (Qualification suggesstion){
                              // final skill = suggesstion;
                              courseSearchCont.text  = suggesstion.courseName;
                              courseId = suggesstion.courseId;

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
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: this. streamSearchCont,
                                decoration: InputDecoration(
                                    hintText: 'Stream'
                                )
                            ),
                            debounceDuration: Duration(milliseconds: 500),
                            suggestionsCallback: ApiServices.getStream ,
                            itemBuilder: (context, Streams suggestions){
                              final skill = suggestions;
                              return ListTile(
                                title: Text(skill.streamName) ,
                              );
                            },
                            noItemsFoundBuilder: (context)=>Text(""),

                            onSuggestionSelected: (Streams suggesstion){
                              // final skill = suggesstion;
                              streamSearchCont.text  = suggesstion.streamName;
                              streamId = suggesstion.streamId;

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
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: this. instituteSearchCont,
                                decoration: InputDecoration(
                                    labelText: 'Institute'
                                )
                            ),
                            debounceDuration: Duration(milliseconds: 500),
                            suggestionsCallback: ApiServices.getInstitute ,
                            itemBuilder: (context, Institute suggestions){
                              final skill = suggestions;
                              return ListTile(
                                title: Text(skill.instituteName) ,
                              );
                            },
                            noItemsFoundBuilder: (context)=>Text(""),

                            onSuggestionSelected: (Institute suggesstion){
                              // final skill = suggesstion;
                              instituteSearchCont.text  = suggesstion.instituteName;

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
                        candidatequalUuid: widget.uuid,
                            candidatequalQualificationId: highQualID,
                            candidatequalCourseId: courseId,
                            candidatequalStreamId: streamId,
                            candidatequalCousetypeId: courseTypeGroupValue,
                            candidatequalInstituteName: instituteSearchCont.text,
                            candidatequalCompletionYear: myPassingYear.yearId,
                            candidatequalGradingsystemId: myGradingSystem.gradingsystemId,
                            candidatequalMarks: gradeCont.text);
                        final result =
                            await apiServices.PostQualification(qualifi: insert,token: widget.token);
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
                      widget.experienceId == 0 ? Navigator.of(context).push( MaterialPageRoute(
                                       builder: (context) => KeySkillsPage(uuid: widget.uuid,))) : Navigator.of(context).push(
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
