// ignore_for_file: must_be_immutable, unused_field, prefer_const_constructors, unnecessary_const, avoid_print, unused_local_variable

import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetCompany.dart';
import 'package:job_portal/Models/GetIndustry.dart';
import 'package:job_portal/Models/PostProfessionRegistration.dart';
import 'package:job_portal/Models/PostProfessionRegistration.dart';
import 'package:job_portal/Models/PostProfessionRegistration.dart';
import 'package:job_portal/Models/ProfessionalDetails.dart';
import 'package:job_portal/Models/ProfileGetNoticePeriod.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step5-KeySkills.dart';
import 'package:job_portal/Models/ProfessionDetailsPost.dart';

import 'Step3-QualificationDetails.dart';

class WorkingProfession extends StatefulWidget {
  WorkingProfession({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _WorkingProfessionState createState() => _WorkingProfessionState();
}

class _WorkingProfessionState extends State<WorkingProfession> {
  String query;
  String mycompany = "";
  String myindustry = "";
  String currentCompanyID = "";
  bool toggleYes = false;

  GetProfileNoticePeriod profileSelectedUser;
  Company skillorganization;
  Company getCompany;

  int groupValue = 2;
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
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate3 = DateTime.now();
  TextEditingController currentCompanySearchCo = TextEditingController();
  TextEditingController currentCompanyCntrl = TextEditingController();
  TextEditingController salaryCount = TextEditingController();
  TextEditingController currentOrganisationNameCntrl = TextEditingController();

  // formkey for validation starts here
  var formKey = GlobalKey<FormState>();

  // formkey for validation ends her

  bool isLoadingCompany = false;
  bool isLoadingIndustry = false;
  bool isLoading = false;
  bool isLoadingCurrentCopmpany = false;
  ApiServices apiServices = ApiServices();

  ApiResponse<List<Company>> _apiResponseCurrentCompany;
  ApiResponse<List<Industry>> _apiResponseIndustry;
  ApiResponse<List<Professional>> _apiResponseProfessional;
  ApiResponse<List<GetProfileNoticePeriod>> _apiResponseProfile;

  @override
  void initState() {
    super.initState();
    // fetchCompany(query: "");
    fetchIndustry(query: "");
    fetchNoticeperiod();
  }

  fetchNoticeperiod() async {
    setState(() {
      isLoading = true;
    });
    _apiResponseProfile = await apiServices.getprofNoticeperiod();
    setState(() {
      isLoading = false;
    });
  }

  //
  // fetchCompany({String query}) async {
  //   setState(() {
  //     isLoadingCompany = true;
  //   });
  //   _apiResponseCurrentCompany = await apiServices.getCompany(query: query);
  //   setState(() {
  //     isLoadingCompany = false;
  //   });
  // }



  //Industry
  fetchIndustry({String query}) async {
    setState(() {
      isLoadingIndustry = true;
    });
    _apiResponseIndustry = await apiServices.getIndustry(query: query);
    setState(() {
      isLoadingIndustry = false;
    });
  }



  // richtext
  RichText getRequiredLabel({String fieldName}) {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaNova"),
          text: fieldName,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const TextSpan(text: '*', style: TextStyle(color: Colors.red)),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Professional Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova"),
                  ),
                  Text(
                    "Add the details of your current/previous job for recruiters to know your experience",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "ProximaNova",
                      color: Colors.grey,
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                ),
                                child: Text("Currently Working",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    GFRadio(
                                      size: 20,
                                      activeBorderColor: const Color(0xff3e61ed),
                                      value: 1,
                                      groupValue: groupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupValue = value;
                                          print(groupValue);
                                          toggleYes = true;
                                        });
                                      },
                                      inactiveIcon: null,
                                      radioColor: const Color(0xff3e61ed),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GFRadio(
                                      size: 20,
                                      value: 0,
                                      groupValue: groupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupValue = value;
                                          print(groupValue);
                                        });
                                      },
                                      inactiveIcon: null,
                                      activeBorderColor:
                                      const Color(0xff3e61ed),
                                      radioColor: const Color(0xff3e61ed),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      "No",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              groupValue == 1
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Current Organization Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 1
                                  ? SizedBox(
                                height: 5,
                              )
                                  : Container(),
                              groupValue == 1
                                  ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TypeAheadFormField(
                                  validator: (value) {
                                    if(value.isEmpty){
                                      return "Enter Current Organization Name";
                                    }
                                  },
                                  textFieldConfiguration:
                                  TextFieldConfiguration(
                                    // ignore: unnecessary_this
                                      controller: this
                                          .currentOrganisationNameCntrl,
                                      decoration: InputDecoration(
                                    hintText: 'Select Current Organization Name')),
                                  debounceDuration:
                                  Duration(milliseconds: 500),
                                  suggestionsCallback:
                                  ApiServices.getCompany,
                                  itemBuilder:
                                      (context, Company suggestions) {
                                    skillorganization = suggestions;
                                    return ListTile(
                                      title: Text(skillorganization
                                          .organizationName),
                                    );
                                  },
                                  noItemsFoundBuilder: (context) =>
                                      Text(""),
                                  onSuggestionSelected:
                                      (Company suggesstion) {
                                    currentOrganisationNameCntrl.text =
                                        suggesstion.organizationName;
                                  },
                                ),
                              )
                                  : Container(),
                              groupValue == 1
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Current Designation",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 1
                                  ? SizedBox(
                                height: 5,
                              )
                                  : Container(),
                              groupValue == 1
                                  ? TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                ],
                                controller: currentCompanyCntrl,
                                decoration: InputDecoration(
                                  hintText: "Current Designation",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.5,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Select Current Designation";
                                  }
                                  return null;
                                },
                              )
                                  : Container(),
                              groupValue == 1
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Current  Annual Salary",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 1
                                  ? SizedBox(
                                height: 5,
                              )
                                  : Container(),
                              groupValue == 1
                                  ? Row(
                                mainAxisSize: MainAxisSize.max,

                                children: [
                                  const Icon(FontAwesomeIcons.rupeeSign),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                      Expanded(
                                        child: TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                                ],
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                keyboardType: TextInputType.number,
                                controller: salaryCount,
                                decoration: InputDecoration(
                                        hintText: "Current Annual Salary",
                                        hintStyle: TextStyle(
                                          color: Colors.blueGrey,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          fontSize: 14.5,
                                        ),
                                ),
                                validator: (value) {
                                        if (value.isEmpty) {
                                          return "Enter Current Annual Salary";
                                        }
                                        if (value.startsWith("0")) {
                                          return "Salary should Not Start With Zero";
                                        }
                                        if(value.length < 6){
                                          return "Salary Should More Than 5 Digits";
                                        }
                                        if(value.length > 7){
                                          return "Salary Should Less Than 7 Digits";
                                        }
                                        return null;
                                },
                              ),
                                      ),
                                    ],
                                  )
                                  : Container(),
                              groupValue == 1
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Working Since",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 1
                                  ? Padding(
                                padding: const EdgeInsets.all(8),
                                child: DateTimeFormField(
                                  decoration: const InputDecoration(
                                    border: const UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: 'Working Since',
                                    hintStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 14.5,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "ProximaNova"),
                                    // hintStyle: heading6.copyWith(color: textGrey),
                                    // errorStyle: TextStyle(color: Colors.redAccent),
                                    suffixIcon: Icon(Icons.event_note),
                                  ),
                                  // initialValue: date,
                                  mode: DateTimeFieldPickerMode.date,
                                  validator: (e) {
                                    if(e == null){
                                      return "Enter Working Since";
                                    }else{
                                      return null;
                                    }
                                  },
                                   lastDate: DateTime.now(),
                                  onDateSelected: (date) {
                                    setState(() {
                                      selectedDate = date;
                                    });
                                  },
                                ),
                              )
                                  : Container(),
                              groupValue == 1
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Notice Period ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 1
                                  ? Padding(
                                padding: const EdgeInsets.all(8),
                                child: DropdownButtonFormField<
                                    GetProfileNoticePeriod>(
                                  hint: Text(
                                    "Notice Period:",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 14.5,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "ProximaNova"),
                                  ),
                                  value: profileSelectedUser,
                                  onChanged:
                                      (GetProfileNoticePeriod newValue) {
                                    setState(() {
                                      profileSelectedUser = newValue;
                                    });
                                  },
                                  validator: (value) =>
                                  value == null
                                      ? 'Select Notice Period'
                                      : null,
                                  items: _apiResponseProfile.data
                                      .map((GetProfileNoticePeriod user) {
                                    return DropdownMenuItem<
                                        GetProfileNoticePeriod>(
                                      value: user,
                                      child: Text(
                                        user.noticePeriodName,
                                        style: TextStyle(
                                            color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                                  : Container(),
                              groupValue == 0
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Previous Organization Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 0
                                  ? Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TypeAheadFormField(
                                  validator: (value) {
                                    if(value.isEmpty){
                                      return "Select Previous Organization";
                                    }
                                  },
                                  textFieldConfiguration:
                                  TextFieldConfiguration(
                                    // ignore: unnecessary_this
                                      controller: this
                                          .currentOrganisationNameCntrl,
                                      decoration: InputDecoration(
                                        hintText: 'Previous Organization Name')),
                                  debounceDuration:
                                  Duration(milliseconds: 500),
                                  suggestionsCallback:
                                  ApiServices.getCompany,
                                  itemBuilder:
                                      (context, Company suggestions) {
                                    skillorganization = suggestions;
                                    return ListTile(
                                      title: Text(skillorganization
                                          .organizationName),
                                    );
                                  },
                                  noItemsFoundBuilder: (context) =>
                                      Text(""),
                                  onSuggestionSelected:
                                      (Company suggesstion) {
                                    currentOrganisationNameCntrl.text =
                                        suggesstion.organizationName;
                                  },
                                ),
                              )
                                  : Container(),
                              groupValue == 0
                                  ? SizedBox(
                                height: 10,
                              )
                                  : SizedBox(
                                height: 10,
                              ),
                              groupValue == 0
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Previous Designation",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 0
                                  ? TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                ],
                                controller: currentCompanyCntrl,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Select Previous Designation";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Previous Designation",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.5,
                                  ),
                                ),
                              )
                                  : Container(),
                              groupValue == 0
                                  ? SizedBox(
                                height: 10,
                              )
                                  : Container(),
                              groupValue == 0
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Previous Annual Salary",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 0
                                  ? Row(
                                mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(FontAwesomeIcons.rupeeSign),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                                ],
                                controller: salaryCount,
                                keyboardType: TextInputType.number,
                                validator: (input) {
                                        if (input.isEmpty) {
                                          return "Enter Previous Annual Salary";
                                        }
                                        if (input.startsWith("0")) {
                                          return "Salary Should Not Start With Zero";
                                        }
                                        if(input.length < 6){
                                          return "Salary Should More Than 5 Digits";
                                        }
                                        if(input.length > 7){
                                          return "Salary Should Less Than 7 Digits";
                                        }
                                        return null;
                                },
                                decoration: InputDecoration(
                                        hintText: "Previous Annual Salary",
                                        hintStyle: TextStyle(
                                          color: Colors.blueGrey,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          fontSize: 14.5,
                                        ),
                                ),
                              ),
                                      ),
                                    ],
                                  )
                                  : Container(),
                              groupValue == 0
                                  ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Tenure of last job",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              )
                                  : Container(),
                              groupValue == 0
                                  ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: DateTimeFormField(
                                        validator: (e) {
                                          if(e == null){
                                            return "Enter Start Date";
                                          }else{
                                            return null;
                                          }
                                        },
                                        lastDate: DateTime.now(),
                                        decoration: const InputDecoration(
                                          border:
                                          const UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          hintText: 'Start Date',
                                          // hintStyle: heading6.copyWith(color: textGrey),
                                          // errorStyle: TextStyle(color: Colors.redAccent),
                                          suffixIcon:
                                          Icon(Icons.event_note),
                                        ),
                                        // initialValue: date,
                                        mode:
                                        DateTimeFieldPickerMode.date,



                                        onDateSelected: (date) {
                                          setState(() {
                                            selectedDate = date;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: DateTimeFormField(
                                        validator: (e) {
                                          if(e == null){
                                            return "Enter End Date";
                                          }else{
                                            return null;
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          border:
                                          const UnderlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          hintText: 'End Date',
                                          // hintStyle: heading6.copyWith(color: textGrey),
                                          // errorStyle: TextStyle(color: Colors.redAccent),
                                          suffixIcon:
                                          Icon(Icons.event_note),
                                        ),
                                        lastDate: DateTime.now(),
                                        // initialValue: date,
                                        mode:
                                        DateTimeFieldPickerMode.date,

                                        onDateSelected: (date) {
                                          setState(() {
                                            selectedDate3 = date;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: GFButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                print(
                                    "=======================================");
                                print("Currently Working ID: " +
                                    groupValue.toString());
                                print("Organisation Name : " +
                                    skillorganization.organizationName);
                                print("End Date : " +
                                    selectedDate3.toString().split(" ")[0]);
                                print("Designation : " +
                                    currentCompanyCntrl.text);
                                print("Salary :" + salaryCount.text.toString());
                                print("Start Date :" +
                                    selectedDate.toString().split(" ")[0]);
                                print(
                                    "=======================================");
                                final insert = toggleYes == true
                                    ? PostProfessionRegistration(
                                    candidateexpIscurrentcompany: 1,
                                    candidateexpOrganizationname:
                                    skillorganization.organizationName,
                                    candidateexpDesignation:
                                    currentCompanyCntrl.text,
                                    candidateexpSalary: salaryCount.text,
                                    candidateexpStartdate:
                                    selectedDate.toString().split(" ")[0],
                                    candidateexpNoticeperiodId:
                                    profileSelectedUser.noticePeriodId
                                        .toString()

                                )
                                    : PostProfessionRegistration(
                                    candidateexpIscurrentcompany: 0,
                                    candidateexpOrganizationname:
                                    skillorganization.organizationName,
                                    candidateexpDesignation:
                                    currentCompanyCntrl.text,
                                    candidateexpSalary: salaryCount.text,
                                    candidateexpStartdate:
                                    selectedDate.toString().split(" ")[0],
                                    candidateexpEnddate: selectedDate3
                                        .toString().split(" ")[0]
                                );

                                final result =
                                await apiServices.ProfessionPost(insert);
                                setState(() {
                                  isLoading = false;
                                });
                                print(selectedDate);
                                const title = "Done";
                                final text = result.error
                                    ? (result.errorMessage ??
                                    "An Error Occurred")
                                    : "Successfully Created";
                                if(result.data){
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) => QualificationBlueCollar(
                                        uuid: widget.uuid,
                                      ),), (
                                          route) => false);
                                }else{}
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
                                //             builder: (context) => KeySkillsPage(uuid: "0c856f4f-61dc-4c70-8b21-22a932358fc1",)));
                                //   }
                                // });
                              }


                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) =>
                              //       QualificationBlueCollar(
                              //         uuid: widget.uuid,
                              //       ),),);
                            },
                            text: "Next",
                            type: GFButtonType.solid)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
