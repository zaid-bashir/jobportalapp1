import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/Boards.dart';
import 'package:job_portal/Models/GradingSystem.dart';
import 'package:job_portal/Models/InstituteQualified.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Models/QualificationDetails.dart';
import 'package:job_portal/Models/SchoolMedium.dart';
import 'package:job_portal/Models/Stream.dart';
import 'package:job_portal/Models/qualification-post.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step4-ProfessionalDetails.dart';
import 'package:job_portal/Views/SignIn/Step5-KeySkills.dart';

class QualificationBlueCollar extends StatefulWidget {
  QualificationBlueCollar({Key key, this.uuid, this.token, this.experienceId})
      : super(key: key);
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
  String board = "";
  String mediumId = "";
  String courseId = "";
  String streamId = "";
  String instituteId = "";
  String yearID = "";

  bool visibleGrade = false;

  int courseTypeGroupValue = 0;

  GradingSystem myGradingSystem;

  PassingYear myPassingYear;

  bool isLoading = false;
  ApiServices apiServices = ApiServices();

  // ApiResponse<List<Institute>> _apiResponseInstitute;
  ApiResponse<List<GradingSystem>> _apiResponse;
  ApiResponse<List<PassingYear>> _apiResponse2;

  // ApiResponse<List<Qualification>> _apiResponsequalification;
  // ApiResponse<List<Qualification>> _apiResponsecourse;
  // ApiResponse<List<Streams>> _apiResponsestream;
  // ApiResponse<List<Boards>> _apiResponseBoards;

  TextEditingController profileCont = TextEditingController();
  TextEditingController gradeCont = TextEditingController();
  TextEditingController courseSearchCont = TextEditingController();
  TextEditingController streamSearchCont = TextEditingController();
  TextEditingController instituteSearchCont = TextEditingController();
  TextEditingController boardsSearchCont = TextEditingController();
  TextEditingController mediumSearchCont = TextEditingController();
  TextEditingController yearSearchCont = TextEditingController();
  TextEditingController headline = TextEditingController();

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

  bool isVisible = false;
  bool isVisible2 = true;

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
              child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

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
                      Text(
                        "Add your qualification details for us to match you with a perfect job",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }
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
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: Text(
                    //     "Profile Headline",
                    //     style: TextStyle(
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.bold,
                    //         fontFamily: "ProximaNova"),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: TextFormField(
                    //     controller: headline,
                    //     maxLines: 2,
                    //     decoration: InputDecoration(
                    //       labelText: "Profile Headline",
                    //       border: UnderlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                      child: TypeAheadFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Select Highest Qualification';
                          }
                        },
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: this.qualificationSearchCon,
                            decoration:
                                InputDecoration(hintText: 'Select Highest Qualification')),
                        debounceDuration: Duration(milliseconds: 500),
                        suggestionsCallback: ApiServices.getQualification,
                        itemBuilder: (context, Qualification suggestions) {
                          final quall = suggestions;
                          return ListTile(
                            title: Text(quall.qualName),
                          );
                        },
                        noItemsFoundBuilder: (context) => Text(""),
                        onSuggestionSelected: (Qualification suggesstion) {
                          // final skill = suggesstion;
                          qualificationSearchCon.text = suggesstion.qualName;
                          highQualID = suggesstion.qualId;
                          print(highQualID);
                          setState(() {
                            if (highQualID == "3" || highQualID == "2"||highQualID == "1") {
                              isVisible = true;
                              isVisible2 = false;
                            }else{
                              isVisible = false;
                              isVisible2 = true;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Select Board",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: const SizedBox(
                        height: 10,
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: TypeAheadFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Select Board';
                            }
                          },
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: this.boardsSearchCont,
                              decoration: InputDecoration(hintText: 'Select Board')),
                          debounceDuration: Duration(milliseconds: 500),
                          suggestionsCallback: ApiServices.getBoards,
                          itemBuilder: (context, Boards suggestions) {
                            final skill = suggestions;
                            return ListTile(
                              title: Text(skill.boardName),
                            );
                          },
                          noItemsFoundBuilder: (context) => Text(""),
                          onSuggestionSelected: (Boards suggesstion) {
                            // final skill = suggesstion;
                            boardsSearchCont.text = suggesstion.boardName;
                            board = suggesstion.boardId;
                          },
                        ),
                      ),
                    ),

                    Visibility(
                      visible: isVisible,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Select Medium",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: const SizedBox(
                        height: 10,
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: TypeAheadFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Select Medium';
                            }
                          },
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: mediumSearchCont,
                              decoration: const InputDecoration(hintText: 'Select Medium')),
                          debounceDuration: const Duration(milliseconds: 500),
                          suggestionsCallback: ApiServices.getMedium,
                          itemBuilder: (context, Medium suggestions) {
                            final skill = suggestions;
                            return ListTile(
                              title: Text(skill.schoolmediumName),
                            );
                          },
                          noItemsFoundBuilder: (context) => Text(""),
                          onSuggestionSelected: (Medium suggesstion) {
                            // final skill = suggesstion;
                            mediumSearchCont.text = suggesstion.schoolmediumName;
                            mediumId = suggesstion.schoolmediumId;
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible2,
                      child: const SizedBox(
                        height: 10,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible: isVisible2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Course",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova"),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisible2,
                          child: const SizedBox(
                            height: 10,
                          ),
                        ),
                        Visibility(
                          visible: isVisible2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TypeAheadFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Select Course';
                                }
                              },
                              textFieldConfiguration: TextFieldConfiguration(
                                  controller: this.courseSearchCont,
                                  decoration:
                                      InputDecoration(hintText: 'Select Course')),
                              debounceDuration: Duration(milliseconds: 500),
                              suggestionsCallback: ApiServices.getCourse,
                              itemBuilder: (context, Qualification suggestions) {
                                final skill = suggestions;
                                return ListTile(
                                  title: Text(skill.courseName),
                                );
                              },
                              noItemsFoundBuilder: (context) => Text(""),
                              onSuggestionSelected: (Qualification suggesstion) {
                                // final skill = suggesstion;
                                courseSearchCont.text = suggesstion.courseName;
                                courseId = suggesstion.courseId;
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisible2,
                          child: const SizedBox(
                            height: 10,
                          ),
                        ),
                        Visibility(
                          visible: isVisible2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Stream",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova"),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isVisible2,
                          child: const SizedBox(
                            height: 10,
                          ),
                        ),
                        Visibility(
                          visible: isVisible2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TypeAheadFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Select Stream';
                                }
                              },
                              textFieldConfiguration: TextFieldConfiguration(
                                  controller: this.streamSearchCont,
                                  decoration:
                                      InputDecoration(hintText: ' Select Stream')),
                              debounceDuration: Duration(milliseconds: 500),
                              suggestionsCallback: ApiServices.getStream,
                              itemBuilder: (context, Streams suggestions) {
                                final skill = suggestions;
                                return ListTile(
                                  title: Text(skill.streamName),
                                );
                              },
                              noItemsFoundBuilder: (context) => Text(""),
                              onSuggestionSelected: (Streams suggesstion) {
                                // final skill = suggesstion;
                                streamSearchCont.text = suggesstion.streamName;
                                streamId = suggesstion.streamId;
                              },
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
                          child: TypeAheadFormField(

                            textFieldConfiguration: TextFieldConfiguration(
                                controller: this.instituteSearchCont,
                                decoration:
                                    InputDecoration(hintText: 'Select Institute Qualified From')),
                            debounceDuration: Duration(milliseconds: 500),
                            suggestionsCallback: ApiServices.getInstitute,
                            itemBuilder: (context, Institute suggestions) {

                              final skill = suggestions;
                              return ListTile(
                                title: Text(skill.instituteName),
                              );
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Select Institute Qualified From';
                              }
                            },
                            noItemsFoundBuilder: (context) => Text(""),
                            onSuggestionSelected: (Institute suggesstion) {
                              // final skill = suggesstion;
                              instituteSearchCont.text =
                                  suggesstion.instituteName;
                            },
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
                          child: DropdownButtonFormField<PassingYear>(
                            hint: Text(
                              " Select Passing Year",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova"),
                            ),
                            value: myPassingYear,
                            onChanged: (PassingYear newValue) {
                              setState(() {
                                myPassingYear = newValue;
                              });
                            },
                            validator: (value) =>
                                value == null ? 'Select Passing Year' : null,
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
                            hint: Text(
                              " Select Grading Value",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova"),
                            ),
                            value: myGradingSystem,
                            onChanged: (GradingSystem newValue) {
                              setState(() {
                                myGradingSystem = newValue;

                              });
                            },
                            validator: (value) =>
                                value == null ? 'Select Grading System' : null,
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
                            maxLength: 4,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Grade Value";
                              } else {
                                return null;
                              }

                            },
                            controller: gradeCont,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: " Select Grade Value",
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
                            candidateHeadline: headline.text,
                            candidatequalBoardId : board,
                            candidatequalSchoolmediumId:mediumId,
                            candidatequalStreamId: streamId,
                            candidatequalCousetypeId: courseTypeGroupValue,
                            candidatequalInstituteName:
                                instituteSearchCont.text,
                            candidatequalCompletionYear: myPassingYear.yearId,
                            candidatequalGradingsystemId:
                                myGradingSystem.gradingsystemId,
                            candidatequalMarks: gradeCont.text);
                        final result = await apiServices.PostQualification(
                          qualifi: insert,
                        );
                        setState(() {
                          isLoading = false;
                        });
                        const title = "Done";
                        final text = result.error
                            ? (result.errorMessage ?? "An Error Occurred")
                            : "Successfully Created";
                        if (result.data) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KeySkillsPage(
                                        uuid: widget.uuid,
                                      )),
                              (route) => false);
                        } else {}
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
                      // widget.experienceId == 0 ?
                      // Navigator.of(context).push( MaterialPageRoute(
                      //                  builder: (context) => KeySkillsPage(uuid: widget.uuid,))) ;

                      // : Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //                  builder: (context) => WorkingProfession(uuid: widget.uuid,)));
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

  Widget _radioButtons(BuildContext context) {
    return FormField(builder: (state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              state.errorText ?? "",
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          )
        ],
      );
    }, validator: (value) {
      if (courseTypeGroupValue == 0) {
        return "Choose Course Type";
      }
      return null;
    });
  }
}
