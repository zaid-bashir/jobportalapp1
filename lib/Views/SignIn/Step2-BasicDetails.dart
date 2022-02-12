// ignore_for_file: avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/BasicDetailsPost.dart';
import 'package:job_portal/Models/CurerntLocation.dart';
import 'package:job_portal/Models/GetTitle.dart';
import 'package:job_portal/Models/JobRole.dart';
import 'package:job_portal/Models/CustumRadioModel.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:email_validator/email_validator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Step3-QualificationDetails.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BasicDetails extends StatefulWidget {
  BasicDetails({Key key, this.mobileNo}) : super(key: key);
  String mobileNo;

  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  //Get SharedPreference Bucket
  //===========================

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
  String keyToken = "KeyToken";

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
  TextEditingController jobCategorySearchCon = TextEditingController();

  //RadioButtons
  //============

  final List<CustumRadioButtons> genderItems = [
    CustumRadioButtons(value: 1, text: "Male"),
    CustumRadioButtons(value: 2, text: "Female"),
    CustumRadioButtons(value: 3, text: "Others"),
  ];
  int genderRadioId = 0;
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
  Map<String,dynamic> responseError;
  Map<String,dynamic> responseSuccess;
  String jwtToken = "";

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
                  "Register New Account",
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
                              value == null ? 'Select Title' : null,
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
                                return "Enter First Name";
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
                                  return "Enter Last Name";
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
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
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
                            return "Enter Email";
                          }
                          if (!EmailValidator.validate(value)) {
                            return "Please enter Correct email";
                          }
                          return null;
                        },
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
                            return "Select Gender";
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
                            return "Select Experience";
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
                                    ? 'Select Year'
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
                                    ? 'Select Month'
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
                        "Preffered Job Role:",
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
                              return "Select Preffered Job Role";
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
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Current Location:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<CurrentLocation>(
                        dropdownSearchDecoration: InputDecoration(
                            border: UnderlineInputBorder(
                            )
                        ),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null) {
                            return "Select Current Location";
                          }
                          return null;
                        },
                        mode: Mode.DIALOG,
                        items: isLoadingCurrentLocation
                            ? [CurrentLocation()]
                            : _apiResponseCurrentLocation.data,
                        itemAsString: (CurrentLocation obj) {
                          return obj.cityName;
                        },
                        onFind: (val) async {
                          setState(() {
                            query = val;
                          });
                          return _apiResponseCurrentLocation.data;
                        },
                        hint: "Select City",
                        onChanged: (value) {
                          jobCategorySearchCon.text = value.cityName.toString();
                          cityID = value.cityId;
                          print(value.cityId);
                        },
                        showSearchBox: true,
                        popupItemBuilder:
                            (context, CurrentLocation item, bool isSelected) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item.cityName),
                              ),
                            ),
                          );
                        },
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: GFButton(
                  text: "Next",
                  type: GFButtonType.solid,
                  blockButton: false,
                  onPressed: () async {
                    if (_fbKey.currentState.saveAndValidate()) {
                      final insert = BasicDetialModel(
                        candidateTitleId: int.parse(selectedUser.titleId),
                        candidateMobile1: widget.mobileNo,
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
                        experienceRadioId == 2 ? 0 : totalWorkExp(),
                        candidateJobroleId: int.parse(jobRoleID),
                        candidateCityId: int.parse(cityID),
                      );

                      final result = await apiServices.postBasicDetials(insert);
                      print("#######################");
                      if(result.data["error"] != null){
                        AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.ERROR,
                              title: 'JobPortalApp',
                              desc: 'Some Fields are Not Filled, Please Fill all the fields',
                            ).show();
                            return;
                      }
                      responseSuccess = result.data["successResult"];
                      jwtToken = result.data["token"];
                      // print(responseError);
                      print(responseSuccess);
                      print(jwtToken);
                      print("#######################");
                      storeDataToSharedPref();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QualificationBlueCollar(
                            uuid: result.data['successResult']['axelaCandidateUuId'],
                            token: jwtToken,
                            experienceId: experienceRadioId,
                          ),
                        ),
                      );
                    }
                  }),
            ),
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
    pref.setString(keyUuid, responseSuccess['axelaCandidateUuId']);
    pref.setInt(keyCandiadateId, responseSuccess['axelaCandidateId']).toString();
    pref.setString(keyToken,jwtToken);
  }
}