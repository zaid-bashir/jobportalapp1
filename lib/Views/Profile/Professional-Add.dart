import 'dart:developer';

import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetCompany.dart';
import 'package:job_portal/Models/GetIndustry.dart';
import 'package:job_portal/Models/ProfessionDetailsPost.dart';
import 'package:job_portal/Models/ProfessionalDetails.dart';
import 'package:job_portal/Models/ProfessionalPopulate.dart';
import 'package:job_portal/Models/ProfessionalPopulate.dart';
import 'package:job_portal/Models/ProfessionalPopulate.dart';
import 'package:job_portal/Models/ProfessionalPopulate.dart';
import 'package:job_portal/Models/ProfileGetNoticePeriod.dart';


import 'package:job_portal/Services/ApiServices.dart';

class ProfessionAdd extends StatefulWidget {
  ProfessionAdd({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _ProfessionAddState createState() => _ProfessionAddState();
}

class _ProfessionAddState extends State<ProfessionAdd> {
  bool get isEditing => widget.uuid != null;

  String query;
  String mycompany = "";
  String myindustry = "";
  String currentCompanyID = "";

  int groupValue;

  // variables
  DateTime selectedDateWorkingSince = DateTime.now();
  DateTime date ;



  // CONTROLLERS
  DateTime selectedDateProfile = DateTime.now();
  TextEditingController currentCompanySearchCo = TextEditingController();
  TextEditingController currentOrganisationCntrl = TextEditingController();
  TextEditingController currentOrganisationNameCntrl = TextEditingController();
  TextEditingController previousOrganisationNameCntrl = TextEditingController();
  TextEditingController myControllerPofile = TextEditingController();
  TextEditingController previousDesignationCntrl = TextEditingController();
  TextEditingController previousSalaryCntrl = TextEditingController();

  TextEditingController salaryCountProfile = TextEditingController();

  // DateTime noticeperiodDate = DateTime.now();
  TextEditingController currentrganiationnameCntrl = TextEditingController();
  TextEditingController currentDesignationCntrl = TextEditingController();

// CONTROLLERS END HERE

  GetProfileNoticePeriod profileSelectedUser;

  // formkey for validation starts here
  var formKey = GlobalKey<FormState>();

  // formkey for validation ends her
  bool isLoadingCompany = false;
  bool isLoadingIndustry = false;
  bool isLoading = false;
  bool isLoadingCurrentCopmpany = false;
  bool toggleYes = false;
  bool isLoadingProfessionalProfile = false;

  ApiServices apiServices = ApiServices();

  ApiResponse<List<Company>> _apiResponseCurrentCompany;
  ApiResponse<List<Industry>> _apiResponseIndustry;
  ApiResponse<List<Professional>> _apiResponseProfessional;
  ApiResponse<List<GetProfileNoticePeriod>> _apiResponseProfile;

  // variables for id
  String noticePeriodID = "";

  @override
  void initState() {
    print("--------------------------------------------");
    print(widget.uuid);
    print("--------------------------------------------");

    fetchIndustry(query: "");
    fetchNoticeperiod();
    getprof();
    super.initState();
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

  List<String> parseData() {
    List<Company> category = _apiResponseCurrentCompany.data;
    List<String> dataItems = [];
    for (int i = 0; i < category.length; i++) {
      dataItems.add(category[i].organizationName);
    }
    return dataItems;
  }

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

  List<String> parseIndustry() {
    List<Industry> category = _apiResponseIndustry.data;
    List<String> dataItems = [];
    for (int i = 0; i < category.length; i++) {
      dataItems.add(category[i].industryName);
    }
    return dataItems;
  }

  ProfessionalPopulate professionalPopulate;
  String errorMessage;

  getprof() {
    if (isEditing) {
      setState(() {
        isLoading = true;
      });
      apiServices.populateProfProfessionalUpdate(widget.uuid).then((response) {
        setState(() {
          isLoading = false;
        });
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error Occurred";
        }
        professionalPopulate = response.data;
        groupValue = int.parse(professionalPopulate.candidateexpIscurrentcompany);
        currentOrganisationNameCntrl.text = professionalPopulate.candidateexpIscurrentcompany == "1" ?professionalPopulate.OrganizationName : "";
        currentDesignationCntrl.text = professionalPopulate.candidateexpIscurrentcompany == "1" ? professionalPopulate.Designation : "";
        salaryCountProfile.text = professionalPopulate.candidateexpIscurrentcompany == "1" ? professionalPopulate.Salary : "";

        //prevoius
        previousOrganisationNameCntrl.text =  professionalPopulate.candidateexpIscurrentcompany == "0" ?professionalPopulate.OrganizationName : "";
        previousDesignationCntrl.text =  professionalPopulate.candidateexpIscurrentcompany == "0" ? professionalPopulate.Designation : "";
        previousSalaryCntrl.text =  professionalPopulate.candidateexpIscurrentcompany == "0" ? professionalPopulate.Salary : "";
      });
      print(widget.uuid);
      print(widget.uuid);
      print(widget.uuid);
    }
  }

  // richtext
  RichText getRequiredLabel({String fieldName}) {
    return RichText(
      text: TextSpan(
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaNova"),
          text: fieldName,
          children: [
            TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
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

                  const Text(
                    "Professional Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova"),
                  ),
                  Text(
                    "Add your professional details to help us find a better fitted job for you."
                    ,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "ProximaNova",
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                                      activeBorderColor:
                                      const Color(0xff3e61ed),
                                      value: 1,
                                      groupValue: groupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          groupValue = value;
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
                                      return "Select Current Organization";
                                    }
                                  },
                                  textFieldConfiguration:
                                  TextFieldConfiguration(
                                      controller: this
                                          .currentOrganisationNameCntrl,
                                      decoration: InputDecoration(
                                          labelText: 'Organization')),
                                  debounceDuration:
                                  Duration(milliseconds: 500),
                                  suggestionsCallback:
                                  ApiServices.getCompany,
                                  itemBuilder:
                                      (context, Company suggestions) {
                                    final skillorganization = suggestions;
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
                                keyboardType: TextInputType.number,
                                controller: currentDesignationCntrl,
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
                                child: Text("Current Annual Salary *",
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
                                  FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                                ],
                                keyboardType: TextInputType.number,
                                controller: salaryCountProfile,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  hintText: "Add Annual Salary",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.5,
                                  ),
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Enter Current Annual Salary";
                                  }
                                  if(value.length < 6){
                                    return "Salary should be more than 5 digits";
                                  }
                                  if(value.length > 7){
                                    return "Salary should be less than 7 digits";
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

                                  initialValue: date,
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
                                      selectedDateWorkingSince = date;
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
                                child: Text("Previous  Organization Name",
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
                                      controller: this
                                          .previousOrganisationNameCntrl,
                                      decoration: InputDecoration(
                                          labelText: 'Organization')),
                                  debounceDuration:
                                  Duration(milliseconds: 500),
                                  suggestionsCallback:
                                  ApiServices.getCompany,
                                  itemBuilder:
                                      (context, Company suggestions) {
                                    final skillorganization = suggestions;
                                    return ListTile(
                                      title: Text(skillorganization
                                          .organizationName),
                                    );
                                  },
                                  noItemsFoundBuilder: (context) =>
                                      Text(""),
                                  onSuggestionSelected:
                                      (Company suggesstion) {
                                        previousOrganisationNameCntrl.text =
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
                              groupValue == 1
                                  ? SizedBox(
                                height: 5,
                              )
                                  : Container(),
                              groupValue == 0
                                  ? TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Select Previous Designation";
                                  }
                                  return null;
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                ],
                                controller: previousDesignationCntrl,
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
                                  ? TextFormField(
                                keyboardType: TextInputType.number,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                                ],
                                controller: previousSalaryCntrl,

                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return "Enter Previous Annual Salary";
                                  }
                                  if(input.length < 6){
                                    return "Salary should be more than 5 digits";
                                  }
                                  if(input.length > 7){
                                    return "Salary should be less than 7 digits";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(

                                  hintText: "Add Annual Salary",
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
                                        autovalidateMode:
                                        AutovalidateMode.always,
                                        validator: (e) {
                                          if(e == null){
                                            return "Enter Start Date";
                                          }else{
                                            return null;
                                          }
                                        },

                                        onDateSelected: (date) {
                                          setState(() {
                                            selectedDateWorkingSince =
                                                date;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    Expanded(
                                      child: DateTimeFormField(
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
                                        // initialValue: date,
                                        mode:
                                        DateTimeFieldPickerMode.date,
                                        autovalidateMode:
                                        AutovalidateMode.always,
                                        validator: (e) {
                                          if(e == null){
                                            return "Enter End Date";
                                          }else{
                                            return null;
                                          }
                                        },

                                        onDateSelected: (date) {
                                          setState(() {
                                            selectedDateProfile = date;
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GFButton(
                          onPressed: () async{

                            setState(() {
                              isLoadingProfessionalProfile = true;
                            });
                            final insert = PostProfession(
                                requestType: "delete",
                                candidateexpUuid:
                              widget.uuid);

                            final result =
                            await apiServices.professionalProfileAdd(insert);
                            setState(() {
                              isLoadingProfessionalProfile = false;
                            });
                            if (result.data) {
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
                        GFButton(
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                    if(isEditing){
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final insert = groupValue ==1 ?
                                      PostProfession(
                                          requestType: "update",
                                          candidateexpUuid: widget.uuid,
                                          candidateexpIscurrentcompany: 1,
                                          candidateexpOrganizationname:
                                          currentOrganisationNameCntrl.text,
                                          candidateexpDesignation:
                                          currentDesignationCntrl.text,
                                          candidateexpStartdate:
                                          selectedDateWorkingSince
                                              .toString()
                                              .split(" ")[0],
                                          candidateexpSalary:
                                          salaryCountProfile.text,
                                          candidateexpNoticeperiodId:
                                          profileSelectedUser.noticePeriodId
                                              .toString())
                                          : PostProfession(
                                          requestType: "update",
                                          candidateexpUuid: widget.uuid,
                                          candidateexpIscurrentcompany: 0,
                                          candidateexpOrganizationname:
                                          previousOrganisationNameCntrl.text,
                                          candidateexpDesignation:
                                          previousDesignationCntrl.text,
                                          candidateexpStartdate:
                                          selectedDateWorkingSince
                                              .toString()
                                              .split(" ")[0],
                                          candidateexpSalary:
                                          previousSalaryCntrl.text,
                                          candidateexpEnddate: selectedDateProfile
                                              .toString()
                                              .split(" ")[0]
                                      );

                                      final result = await apiServices
                                          .professionalProfileAdd(insert);

                                      setState(() {
                                        isLoading = false;
                                      });

                                      if (result.data) {
                                        Navigator.pop(context);
                                      } else {
                                        print("error occured by ");
                                      }
                                    }else{
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final insert = groupValue ==1 ?
                                      PostProfession(
                                          requestType: "add",
                                          candidateexpIscurrentcompany: 1,
                                          candidateexpOrganizationname:
                                          currentOrganisationNameCntrl.text,
                                          candidateexpDesignation:
                                          currentDesignationCntrl.text,
                                          candidateexpStartdate:
                                          selectedDateWorkingSince
                                              .toString()
                                              .split(" ")[0],
                                          candidateexpSalary:
                                          salaryCountProfile.text,
                                          candidateexpNoticeperiodId:
                                          profileSelectedUser.noticePeriodId
                                              .toString())
                                          : PostProfession(
                                          requestType: "add",
                                          candidateexpIscurrentcompany: 0,
                                          candidateexpOrganizationname:
                                          previousOrganisationNameCntrl.text,
                                          candidateexpDesignation:
                                          previousDesignationCntrl.text,
                                          candidateexpStartdate:
                                          selectedDateWorkingSince
                                              .toString()
                                              .split(" ")[0],
                                          candidateexpSalary:
                                          previousSalaryCntrl.text,
                                          candidateexpEnddate: selectedDateProfile
                                              .toString()
                                              .split(" ")[0]
                                      );

                                      final result = await apiServices
                                          .professionalProfileAdd(insert);

                                      setState(() {
                                        isLoading = false;
                                      });

                                      if (result.data) {
                                        Navigator.pop(context);
                                      } else {
                                        print("error occured by ");
                                      }
                                    }






                              }

                            },
                            text: isEditing ? "Update" : "Add",
                            type: GFButtonType.solid),
                      ],
                    ),
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












