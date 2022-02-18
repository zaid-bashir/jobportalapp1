// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field, unnecessary_string_interpolations, avoid_print, prefer_const_constructors_in_immutables, must_be_immutable, avoid_unnecessary_containers, unused_local_variable
// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field, unnecessary_string_interpolations, avoid_print, prefer_const_constructors_in_immutables, must_be_immutable, avoid_unnecessary_containers, unused_local_variable

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/BasicDetailsPost.dart';
import 'package:job_portal/Models/BasicInfoPopulate.dart';
import 'package:job_portal/Models/CurerntLocation.dart';
import 'package:job_portal/Models/GetTitle.dart';
import 'package:job_portal/Models/JobRole.dart';


import 'package:job_portal/Models/custumradiomodel.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdateBasicDetails extends StatefulWidget {
  UpdateBasicDetails({Key key,this.fName,this.mName,this.lName,this.email,this.exp,this.jobrole,this.phone,this.gender, }) : super(key: key);
  String fName;
  String mName;
  String lName;
  String phone;
  String email;
  String gender;
  String  exp;
  String  jobrole;
  FToast fToast;
  // OnChangeCallback onChanged;

  @override

  _UpdateBasicDetailsState createState() => _UpdateBasicDetailsState();
}
// typedef OnChangeCallback =  Function(dynamic value);
class _UpdateBasicDetailsState extends State<UpdateBasicDetails> {
  //Get SharedPreference Bucket
  //===========================
  bool isVisible = false;
  SharedPreferences pref;

  //Shared Preference Variables
  //===========================

  String sharedPrefUuid = "";
  int sharedPrefCandidateId = 0;
  String sharedPrefCandidateName = "";
  String sharedPrefCandidateEmail = "";
  String sharedPrefCandidateMobile = "";

  //Shared Preference Keys
  //======================

  String keyUuid = "keyUuid";
  String keyCandiadateId = "keyCandiadateId";
  String keyCandidateName = "keyCandidateName";
  String keyCandidateEmail = "keyCandidateEmail";
  String keyCandiadteMobile = "keyCandiadteMobile";

  //GetTtile Instance
  //=================
  GetTitle selectedUser;

  //Global Form Key
  //===============
  var formKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  //Controllers for TextField
  //=========================
  TextEditingController fnameController = TextEditingController();
  TextEditingController mnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController jobCategorySearchCon = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController email2Controller = TextEditingController();

  //RadioButtons
  //============
  CustumRadioButtons button;
  int genderRadioId;


  getDetails(){
    setState(() {
      isLoading = true;
    });
    fnameController.text = widget.fName;
    mnameController.text = widget.mName;
    lnameController.text= widget.lName;
    emailController.text = widget.email;
    numberController.text = widget.phone;


    // button.value= 1;
// jobCategorySearchCon = widget.onChanged(value);
    setState(() {
      isLoading = false;
    });
  }





  final List<CustumRadioButtons> genderItems = [
    CustumRadioButtons(value: 1, text: "Male"),
    CustumRadioButtons(value: 2, text: "Female"),
    CustumRadioButtons(value: 3, text: "Others"),
  ];

  String genderRadioadioValue = "";

  final List<CustumRadioButtons> experienceItems = [
    CustumRadioButtons(value: 1, text: "Yes"),
    CustumRadioButtons(value: 2, text: "No"),
  ];
  int experienceRadioId = 0;
  String experienceRadioValue = "";

  //ID's for Fields
  //===============
  String titleID = "";
  String genderID = "";
  String jobRoleID = "";
  String cityID = "";
  int totalExp = 0;
  Map<String,dynamic> response;

  //Normal Fiels Variables
  //======================
  String myjobrole = "";
  String query;
  String myLocation = "";
  bool _isLoading = false;
  int experienceGroupValue = 0;
  String dropdownValue;
  String mySelection;
  String mySelectionYear;
  String mySelectionMonth;
  bool isLoadingJobCategory = false;
  bool isLoadingCurrentLocation = false;
  bool isLoading = false;

  //Service Object
  //==============
  ApiServices apiServices = ApiServices();

  //ApiResponse Generic Objects
  //===========================
  ApiResponse<List<GetTitle>> _apiResponse;
  ApiResponse<List<JobCategory>> _apiResponseJobCategory;
  ApiResponse<List<CurrentLocation>> _apiResponseCurrentLocation;
  ApiResponse<List<BasicDetialModel>> _apiResponseBasicDetail;

  @override
  void initState() {
    getDetails();
    super.initState();
    initSharedPreference();
    fetchTitles();
    fetchJobCategory(query: "");
    fetchCurrentLocation(query: "");
  }

  initSharedPreference() async {
    pref = await SharedPreferences.getInstance();
  }







  fetchTitles() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getTitle();
    setState(() {
      isLoading = false;
    });
  }

  fetchJobCategory({String query}) async {
    setState(() {
      isLoadingJobCategory = true;
    });
    _apiResponseJobCategory = await apiServices.getJobCategory(query: query);
    setState(() {
      isLoadingJobCategory = false;
    });
  }

  fetchCurrentLocation({String query}) async {
    setState(() {
      isLoadingCurrentLocation = true;
    });
    _apiResponseCurrentLocation =
    await apiServices.getCurrentLocation(query: query);
    setState(() {
      isLoadingCurrentLocation = false;
    });
  }

  List<String> parseData() {
    List<JobCategory> category = _apiResponseJobCategory.data;
    List<String> dataItems = [];
    for (int i = 0; i < category.length; i++) {
      dataItems.add(category[i].jobroleName);
    }
    return dataItems;
  }

  List<String> parseLocation() {
    List<CurrentLocation> location = _apiResponseCurrentLocation.data;
    List<String> dataItems = [];
    for (int i = 0; i < location.length; i++) {
      dataItems.add(location[i].cityName);
    }
    return dataItems;
  }

  RichText getRequiredLabel({String fieldName}) {
    return RichText(
      text: TextSpan(
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaNova"),
          text: fieldName,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Basic Information",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Card(
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0, left: 13),
                            child: DropdownButtonFormField<GetTitle>(
                              hint: Text(
                                "Title:",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                              value: selectedUser,
                              onChanged: (GetTitle newValue) {
                                setState(() {
                                  selectedUser = newValue;
                                });
                              },
                              validator: (value) =>
                              value == null ? 'Please fill Title' : null,
                              items: _apiResponse.data.map((GetTitle user) {
                                return DropdownMenuItem<GetTitle>(
                                  value: user,
                                  child: Text(
                                    user.titleDesc,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: fnameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'First Name:',
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova"),
                              floatingLabelStyle: TextStyle(
                                color: Color(0xff2972ff),
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.bold,
                                // letterSpacing: 1.5,
                                fontSize: 17.5,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff2972ff),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter First Name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: mnameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),
                                labelText: 'Middle Name:',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                                floatingLabelStyle: TextStyle(
                                  color: Color(0xff2972ff),
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2972ff),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: lnameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),
                                labelText: 'Last Name:',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                                floatingLabelStyle: TextStyle(
                                  color: Color(0xff2972ff),
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 1.5,
                                  fontSize: 17.5,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2972ff),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter Last Name";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Tooltip(
                        message: "Primary number can't be updated",
                        child: TextFormField(
                          enabled: false,
                          controller: numberController,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),

                            contentPadding: EdgeInsets.all(8.0),
                            labelText: 'Contact No:',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                            floatingLabelStyle: TextStyle(
                              color: Color(0xff2972ff),
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              // letterSpacing: 1.5,
                              fontSize: 17.5,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff2972ff),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Mobile";
                          //   }
                          //   if (!EmailValidator.validate(value)) {
                          //     return "Please enter Correct email";
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 10
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Tooltip(
                        message: "Primary email can't be updated",
                        child: TextFormField(
                          enabled: false,
                          controller: emailController,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
                            contentPadding: EdgeInsets.all(8.0),
                            labelText: 'E-mail:',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                            floatingLabelStyle: TextStyle(
                              color: Color(0xff2972ff),
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              // letterSpacing: 1.5,
                              fontSize: 17.5,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff2972ff),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Enter Email";
                            }
                            if (!EmailValidator.validate(value)) {
                              return "Please enter Correct email";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Additional",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff3e61ed),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff3e61ed),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: isVisible,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text("Number 2:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                            ),
                            TextFormField(
                              controller: number2Controller,
                              decoration: InputDecoration(
                                hintText: "Enter Number",
                                hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 14.5,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text("Email 2:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                            ),
                            TextFormField(
                              controller: email2Controller,
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 14.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Gender:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: FormBuilderRadioGroup<CustumRadioButtons>(

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        options: genderItems
                            .map((lang) => FormBuilderFieldOption(
                          value: lang,
                          child: Text(lang.text),
                        ))
                            .toList(growable: false),

                        onChanged: (val) {
                          setState(() {
                            genderRadioId = val.value;
                            genderRadioadioValue = val.text;
                          });
                          print(genderRadioId);
                          print(genderRadioadioValue);
                        },
                        validator: (val) {
                          if (val == null) {
                            return "This field is required";
                          } else {
                            return null;
                          }
                        },
                        initialValue: null,
                        name: "Gender",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Experience:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: FormBuilderRadioGroup<CustumRadioButtons>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        options: experienceItems
                            .map((lang) => FormBuilderFieldOption(
                          value: lang,
                          child: Text(lang.text),
                        ))
                            .toList(growable: false),
                        onChanged: (val) {
                          setState(() {
                            experienceRadioId = val.value;
                            experienceRadioValue = val.text;
                          });
                          print(experienceRadioId);
                          print(experienceRadioValue);
                        },
                        validator: (val) {
                          if (val == null) {
                            return "This field is required";
                          } else {
                            return null;
                          }
                        },
                        initialValue: null,
                        name: "Experience",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    experienceRadioId == 1
                        ? const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Experience Tenure:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                    )
                        : Container(),
                    const SizedBox(
                      height: 3,
                    ),
                    experienceRadioId == 1
                        ? Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                hint: Text("Years"),
                                value: mySelectionYear,
                                onChanged: (newValue) {
                                  setState(() {
                                    mySelectionYear = newValue;
                                  });
                                },
                                validator: (value) => value == null
                                    ? 'Please fill Year'
                                    : null,
                                items: [
                                  "0",
                                  "1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                  "6",
                                  "7",
                                  "8",
                                  "9",
                                  "10",
                                  "11",
                                  "12"
                                ]
                                    .map(
                                      (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.bold,
                                            fontFamily:
                                            "ProximaNova"),
                                      )),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                hint: Text("Months"),
                                value: mySelectionMonth,
                                onChanged: (newValue) {
                                  setState(() {
                                    mySelectionMonth = newValue;
                                  });
                                },
                                validator: (value) => value == null
                                    ? 'Please fill Month'
                                    : null,
                                items: [
                                  "0",
                                  "1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                  "6",
                                  "7",
                                  "8",
                                  "9",
                                  "10",
                                  "11",
                                  "12"
                                ]
                                    .map(
                                      (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.bold,
                                            fontFamily:
                                            "ProximaNova"),
                                      )),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Job Role:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownSearch<JobCategory>(
                          dropdownSearchDecoration: InputDecoration(
                              border: UnderlineInputBorder(
                              )
                          ),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null) {
                              return "Please Enter Job Role";
                            }
                            return null;
                          },
                          mode: Mode.DIALOG,
                          items: isLoadingJobCategory
                              ? [JobCategory()]
                              : _apiResponseJobCategory.data,
                          itemAsString: (JobCategory obj) {
                            return obj.jobroleName;
                          },
                          onFind: (val) async {
                            setState(() {
                              query = val;
                            });
                            return _apiResponseJobCategory.data;
                          },
                          hint: "Select Job Category",
                          onChanged: (value) {
                            jobCategorySearchCon.text =
                                value.jobroleId.toString();
                            jobRoleID = value.jobroleId;
                            print(value.jobroleId);
                          },
                          showSearchBox: true,
                          popupItemBuilder:
                              (context, JobCategory item, bool isSelected) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(item.jobroleName),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),


                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GFButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: "Cancel",
                type: GFButtonType.solid,
              ),
              SizedBox(
                width: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(right:20),
                child: GFButton(
                    text: "Save",
                    type: GFButtonType.solid,
                    blockButton: false,
                    onPressed: () async {
                      // if (_fbKey.currentState.saveAndValidate()) {
                      final insert = BasicDetialModel(

                        candidateTitleId: int.parse(selectedUser.titleId),
                        // candidateMobile1: widget.mobileNo,
                        candidateFirstName: fnameController.text,
                        candidateMiddleName: mnameController.text,
                        candidateLastName: lnameController.text,
                        candidateEmail1: emailController.text,
                        candidateName: fnameController.text +
                            " " +
                            mnameController.text +
                            " " +
                            lnameController.text,
                        candidateGenderId: genderRadioId,
                        candidateTotalworkexp:
                        experienceRadioId == 2 ? totalExp : totalWorkExp(),
                        candidateJobroleId: int.parse(jobRoleID),

                      );

                      final result = await apiServices.basicinfoUpdate(insert);
                      print("#######################");
                      // response = result.data as Map<String, dynamic>;
                      // storeDataToSharedPref();
                      if(result.data){
                        print('-------------------SUCCESS----------------');
                      }else{
                        print('-------------------ERROR----------------');


                      }
                      Navigator.of(context).pop();
                      // }
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  int totalWorkExp() {
    totalExp = (int.parse(mySelectionYear) * 12) + int.parse(mySelectionMonth);
    return totalExp;
  }

  void storeDataToSharedPref() {
    pref.setString(keyUuid, response['axelaCandidateUuId']);
    pref.setInt(keyCandiadateId, response['axelaCandidateId']);
    pref.setString(keyCandidateName, response['axelaCandidateName']);
    pref.setString(keyCandidateEmail, response['axelaCandidateEmail1']);
    pref.setString(keyCandiadteMobile, response['axelaCandidateMobile']);
  }
}