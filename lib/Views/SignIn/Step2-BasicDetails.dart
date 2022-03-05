// ignore_for_file: avoid_print, prefer_const_constructors, must_be_immutable, prefer_final_fields, non_constant_identifier_names, unused_field

import 'package:advance_notification/advance_notification.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:getwidget/getwidget.dart';
import 'package:toast/toast.dart';
import 'package:logger/logger.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/BasicDetailsPost.dart';
import 'package:job_portal/Models/CurerntLocation.dart';
import 'package:job_portal/Models/GetTitle.dart';
import 'package:job_portal/Models/JobRole.dart';
import 'package:job_portal/Models/CustumRadioModel.dart';
import 'package:job_portal/Models/RegisterError.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'Step7-CareerPreference.dart';

class BasicDetails extends StatefulWidget {
  BasicDetails({Key key, this.mobileNo, this.countryCode}) : super(key: key);
  String mobileNo;
  String countryCode;
  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}


// ScaffoldMessenger.of(context)
//                               .showSnackBar(
//                                 SnackBar(
//                                   content: Row(children: [
//                                     const Icon(
//                                       Icons.done,
//                                       color: Colors.white,
//                                     ),
//                                     const SizedBox(width: 7),
//                                     Expanded(
//                                       child: Text(jsonDecode(
//                                           _apiResponse.data)['response']),
//                                     ),
//                                   ]),
//                                   backgroundColor: Colors.green,
//                                   duration: const Duration(milliseconds: 1500),
//                                 ),
//                               )

class _BasicDetailsState extends State<BasicDetails> {

  //Scaffolf Key
  //============
    final _scaffoldKey = GlobalKey<ScaffoldState>();

  //Logger Instance
  //===============
  Logger log = Logger();

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
  TextEditingController myController = TextEditingController();

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
  Map<String, dynamic> responseError;
  Map<String, dynamic> responseSuccess;
  String jwtToken = "";
  List<String> jobroleList = [];
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

  //Form Validate Check
  //===================
  bool formValidateCheck = false;

  //Service Object
  //==============
  ApiServices apiServices = ApiServices();

  RegisterError registerError = RegisterError(
      candidateEmail1: "Enter Valid Email!",
      candidateLastName: "Enter Last Name!",
      candidateCurrentCityId: "Select Current Location!",
      candidateMobile1: "Enter Mobile!",
      candidatePreferredJobRoleList: "Select Preferred Job Roles!",
      candidateFirstName: "Enter First Name!",
      candidateGenderId: "Select Gender!");

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
    // fetchCurrentLocation(query: "");
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

  // fetchCurrentLocation({String query}) async {
  //   setState(() {
  //     isLoadingCurrentLocation = true;
  //   });
  //   _apiResponseCurrentLocation =
  //   await apiServices.getCurrentLocation(query: query);
  //   setState(() {
  //     isLoadingCurrentLocation = false;
  //   });
  // }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
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
                Text(
                  "Add basic detail for the recruiter to know you",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                  ),
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
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z]"))
                            ],
                            controller: fnameController,
                            decoration: const InputDecoration(
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return registerError.candidateFirstName;
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
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z]"))
                              ],
                              controller: mnameController,
                              decoration: const InputDecoration(
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
                                  fontSize: 17.5,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2972ff),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z]"))
                              ],
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return null;
                          }
                          if (!EmailValidator.validate(value)) {
                            return registerError.candidateEmail1;
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
                            return registerError.candidateGenderId;
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
                            return "Select Experience!";
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
                                      hint: Text("Years"),
                                      value: mySelectionYear,
                                      onChanged: (newValue) {
                                        setState(() {
                                          mySelectionYear = newValue;
                                        });
                                      },
                                      validator: (value) =>
                                          value == null ? 'Select Year' : null,
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
                                      hint: Text("Months"),
                                      value: mySelectionMonth,
                                      onChanged: (newValue) {
                                        setState(() {
                                          mySelectionMonth = newValue;
                                        });
                                      },
                                      validator: (value) =>
                                          value == null ? 'Select Month' : null,
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
                        "Preferred Job Role:",
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
                        child: JobRole(context),
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
                      child: TypeAheadFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Select Current Location";
                          } else {
                            return null;
                          }
                        },
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: myController,
                            decoration: InputDecoration(
                                hintText: 'Select Current Location')),
                        debounceDuration: Duration(milliseconds: 500),
                        suggestionsCallback: ApiServices.getCurrentLoc,
                        itemBuilder: (context, CurrentLocation suggestions) {
                          final skill = suggestions;
                          return ListTile(
                            title: Text(skill.cityName),
                          );
                        },
                        noItemsFoundBuilder: (context) => Text(""),
                        onSuggestionSelected: (CurrentLocation suggesstion) {
                          // final skill = suggesstion;
                          myController.text = suggesstion.cityName;
                          cityID = suggesstion.cityId;
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
                        candidateTitleId: selectedUser.titleId ?? 0,
                        candidateMobile1:
                            widget.countryCode + "-" + widget.mobileNo,
                        candidateFirstName: fnameController.text,
                        candidateMiddleName: mnameController.text,
                        candidateLastName: lnameController.text,
                        candidateEmail1: emailController.text,
                        candidateGenderId: genderRadioId,
                        experience: experienceRadioId.toString(),
                        candidateTotalworkexp:
                            experienceRadioId == 2 ? 0 : totalWorkExp(),
                        candidatePreferredJobRoleList: jobroleList,
                        candidateCurrentCityId: int.parse(cityID),
                      );
                      log.i("=======================================");
                      log.i("First Name "+insert.candidateFirstName);
                      log.i("Middle Name "+insert.candidateMiddleName);
                      log.i("Last Name "+insert.candidateLastName);
                      log.i("Mobile1 "+insert.candidateMobile1);
                      log.i("Email1 "+insert.candidateEmail1);
                      log.i("TitleId "+insert.candidateTitleId);
                      log.i("GenderId "+insert.candidateGenderId.toString());
                      log.i("Current City ID "+insert.candidateCurrentCityId.toString());
                      log.i("JobRole "+insert.candidatePreferredJobRoleList.toString());
                      log.i("Total Experience "+insert.candidateTotalworkexp.toString());
                      log.i("Experience "+insert.experience);
                      log.i("=======================================");
                      final result = await apiServices.postBasicDetials(insert);
                      print("#######################");
                      print(result.responseCode);
                      if (result.responseCode == 400) {
                        setState(() {
                          registerError.candidateEmail1 =
                              result.data['candidateEmail1'];
                        });
                        Toast.show(
                          result.data['candidateEmail1'],
                          context,
                          duration: Toast.LENGTH_SHORT,
                          gravity: Toast.BOTTOM,
                        );
                      }
                      !result.error
                          ? AdvanceSnackBar(
                                  message: "All fields Saved Successfully...",
                                  icon: Icon(Icons.verified),
                                  isIcon: true,
                                  bgColor: Colors.black)
                              .show(context)
                          : SizedBox();
                      responseSuccess = result.data["successResult"];
                      print("#######################");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CareerPreference(
                              experienceId: experienceRadioId,
                            ),
                          ),
                          (route) => false);
                    }
                    const SizedBox(height: 10);
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
    pref
        .setInt(keyCandiadateId, responseSuccess['axelaCandidateId'])
        .toString();
    pref.setString(keyToken, jwtToken);
  }

  Widget JobRole(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownSearch<JobCategory>.multiSelection(
          dropdownSearchDecoration: InputDecoration(
            border: UnderlineInputBorder(),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Select Preferred Job Role";
            }
            return null;
          },
          mode: Mode.DIALOG,
          items: isLoading ? [JobCategory()] : _apiResponseJobCategory.data,
          itemAsString: (JobCategory obj) {
            return obj.jobroleName;
          },
          onChanged: (val) {
            setState(() {
              jobroleList = val.map((e) {
                return e.jobroleId;
              }).toList();
              print(jobroleList);
            });
          },
          // onFind: (val) async {
          //   setState(() {
          //     query = val;
          //   });
          //   fetchCompany(query: query);
          //   return _apiResponse.data;
          // },
          // ignore: deprecated_member_use
          hint: "Select Preferred Role",
          showSearchBox: true,
          popupItemBuilder: (context, JobCategory item, bool isSelected) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(item.jobroleName),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
