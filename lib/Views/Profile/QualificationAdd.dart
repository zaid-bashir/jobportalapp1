import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/Boards.dart';
import 'package:job_portal/Models/GradingSystem.dart';
import 'package:job_portal/Models/InstituteQualified.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Models/QualificationDetails.dart';
import 'package:job_portal/Models/QualificationPopulate.dart';
import 'package:job_portal/Models/SchoolMedium.dart';
import 'package:job_portal/Models/Stream.dart';
import 'package:job_portal/Models/qualification-post.dart';
import 'package:job_portal/Services/ApiServices.dart';

class QualificationAdd extends StatefulWidget {
  QualificationAdd({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _QualificationAddState createState() => _QualificationAddState();
}

class _QualificationAddState extends State<QualificationAdd>
    with SingleTickerProviderStateMixin {
  AnimationController loadingController;

  bool get isEditing => widget.uuid != null;

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
  String board = "";
  String mediumId = "";

  bool isVisible = false;
  bool isVisible2 = true;

  int courseTypeGroupValue = 0;

  GradingSystem myGradingSystem;

  PassingYear myPassingYear;

  bool isLoading = false;
  bool isLoadingQualificationProfile = false;
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
  TextEditingController boardsSearchCont = TextEditingController();
  TextEditingController mediumSearchCont = TextEditingController();

  @override
  void initState() {
    check();
    getQualfy();
    print(highQualID);
    print(highQualID);
    print(highQualID);
    print(highQualID);
    print("-----------------");
    getQualfy();

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

  check() {
    if (highQualID == "3" || highQualID == "2" || highQualID == "1") {
      isVisible = true;
      isVisible2 = false;
    } else {
      isVisible = false;
      isVisible2 = true;
    }
  }

  String errorMessage;
  QualificationPopulate qualificationPopulate;

  getQualfy() {
    if (isEditing) {
      setState(() {
        isLoading = true;
      });
      apiServices.populateQualificationUpdate(widget.uuid).then((response) {
        setState(() {
          isLoading = false;
        });
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error Occurred";
        }
        qualificationPopulate = response.data;
        instituteSearchCont.text = qualificationPopulate.InstituteName;
        gradeCont.text = qualificationPopulate.CandidatequalMarks;
        qualificationSearchCon.text = qualificationPopulate.QualificationName;
        courseSearchCont.text = qualificationPopulate.CourseName;
        streamSearchCont.text = qualificationPopulate.StreamName;
        courseTypeGroupValue = qualificationPopulate.candidatequalCousetypeId;
        highQualID =
            qualificationPopulate.candidatequalQualificationId.toString();
        print(highQualID);
        print(highQualID);
        print(highQualID);
        print(highQualID);
        print(highQualID);
        print(highQualID);
        print(highQualID);
        print(highQualID);
        print(highQualID);
        print(highQualID);

        // isActive = student.studentActive == '1' ? true : false;
      });
      print(widget.uuid);
      print(widget.uuid);
      print(widget.uuid);
      // print(versionCont.text);
      // print(versionCont.text);
    }
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Qualification Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Add your Qualification for recruiters to check on you for potential jobs.",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "ProximaNova",
                      color: Colors.grey,
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                            return 'Select Qualification';
                          }
                        },
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: this.qualificationSearchCon,
                            decoration:
                                InputDecoration(hintText: 'Qualification')),
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

                          setState(() {
                            if (highQualID == "3" ||
                                highQualID == "2" ||
                                highQualID == "1") {
                              isVisible = true;
                              isVisible2 = false;
                            } else {
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
                              decoration: InputDecoration(hintText: 'boards')),
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
                              decoration:
                                  const InputDecoration(hintText: 'boards')),
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
                            mediumSearchCont.text =
                                suggesstion.schoolmediumName;
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
                                      InputDecoration(hintText: 'Course')),
                              debounceDuration: Duration(milliseconds: 500),
                              suggestionsCallback: ApiServices.getCourse,
                              itemBuilder:
                                  (context, Qualification suggestions) {
                                final skill = suggestions;
                                return ListTile(
                                  title: Text(skill.courseName),
                                );
                              },
                              noItemsFoundBuilder: (context) => Text(""),
                              onSuggestionSelected:
                                  (Qualification suggesstion) {
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
                                      InputDecoration(hintText: 'Stream')),
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Select Institute';
                              }
                            },
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: this.instituteSearchCont,
                                decoration:
                                    InputDecoration(labelText: 'Institute')),
                            debounceDuration: Duration(milliseconds: 500),
                            suggestionsCallback: ApiServices.getInstitute,
                            itemBuilder: (context, Institute suggestions) {
                              final skill = suggestions;
                              return ListTile(
                                title: Text(skill.instituteName),
                              );
                            },
                            noItemsFoundBuilder: (context) => Text(""),
                            onSuggestionSelected: (Institute suggesstion) {
                              // final skill = suggesstion;
                              instituteSearchCont.text =
                                  suggesstion.instituteName;
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
                            hint: Text(
                              "Select Year",
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
                                value == null ? 'Select Year' : null,
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
                              "Grading Value",
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
                                value == null ? 'Enter Grading Value' : null,
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
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                            ],
                            validator: (value) {
                              if (value.isEmpty) {
                                return " Enter Grade Value";
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GFButton(
                    onPressed: () async {
                      setState(() {
                        isLoadingQualificationProfile = true;
                      });
                      final insert = QualificationPost(
                          requestType: "delete",
                          candidatequalUuid: widget.uuid);

                      final result = await apiServices.qualificationAdd(insert);
                      setState(() {
                        isLoadingQualificationProfile = false;
                      });
                      if (result.data) {
                        print("-----------SUCCESS------------");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(children: const [
                            Icon(
                              Icons.done_outlined,
                            ),
                            SizedBox(width: 7),
                            Text("Successfully Deleted"),
                          ]),
                          backgroundColor: Colors.green,
                          duration: const Duration(milliseconds: 2500),
                        ));
                      } else {
                        print("-----------ERROR------------");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            children: const [
                              Icon(Icons.error),
                              SizedBox(width: 7),
                              Text("An Error Occured"),
                            ],
                          ),
                          backgroundColor: Colors.red,
                          duration: const Duration(milliseconds: 2500),
                        ));
                      }

                      Navigator.of(context).pop();
                    },
                    text: "Delete",
                    type: GFButtonType.solid,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GFButton(
                      onPressed: () async {
                        print("#############");
                        print("#############");
                        if (isEditing) {
                          if (formKey.currentState.validate()) {
                            print(highQualID);
                            print(myGradingSystem.gradingsystemId);
                            setState(() {
                              isLoading = true;
                            });
                            final insert = QualificationPost(
                                requestType: "update",
                                candidatequalUuid: widget.uuid,
                                candidatequalQualificationId: highQualID,
                                candidatequalCourseId: courseId,
                                candidatequalBoardId: board,
                                candidatequalSchoolmediumId: mediumId,
                                candidatequalStreamId: streamId,
                                candidatequalCousetypeId: courseTypeGroupValue,
                                candidatequalInstituteName:
                                    instituteSearchCont.text,
                                candidatequalCompletionYear:
                                    myPassingYear.yearId,
                                candidatequalGradingsystemId:
                                    myGradingSystem.gradingsystemId,
                                candidatequalMarks: gradeCont.text);
                            final result =
                                await apiServices.qualificationAdd(insert);
                            setState(() {
                              isLoading = false;
                            });
                            if (result.data) {
                              Navigator.pop(context);
                            }
                          }
                        } else {
                          if (formKey.currentState.validate()) {
                            print(highQualID);
                            print(myGradingSystem.gradingsystemId);
                            setState(() {
                              isLoading = true;
                            });
                            final insert = QualificationPost(
                                requestType: "add",
                                candidatequalQualificationId: highQualID,
                                candidatequalCourseId: courseId,
                                candidatequalSchoolmediumId: mediumId,
                                candidatequalBoardId: board,
                                candidatequalStreamId: streamId,
                                candidatequalCousetypeId: courseTypeGroupValue,
                                candidatequalInstituteName:
                                    instituteSearchCont.text,
                                candidatequalCompletionYear:
                                    myPassingYear.yearId,
                                candidatequalGradingsystemId:
                                    myGradingSystem.gradingsystemId,
                                candidatequalMarks: gradeCont.text);
                            final result =
                                await apiServices.qualificationAdd(insert);
                            setState(() {
                              isLoading = false;
                            });
                            if (result.data) {
                              Navigator.pop(context);
                            }
                          }
                        }
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context) => WorkingProfession(uuid: widget.uuid,)));
                      },
                      text: isEditing ? "Update" : "Add",
                      type: GFButtonType.solid,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioButtons(BuildContext context) {
    return FormField(builder: (state) {
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
              color: Theme.of(context).errorColor,
            ),
          )
        ],
      );
    }, validator: (value) {
      if (courseTypeGroupValue == 0) {
        return "Choose one of the option";
      }
      return null;
    });
  }
}
