// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetCompany.dart';
import 'package:job_portal/Models/GetIndustry.dart';
import 'package:job_portal/Models/ProfessionalDetails.dart';
import 'package:job_portal/Models/ProfileGetNoticePeriod.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step5-KeySkills.dart';
import 'package:job_portal/Models/ProfessionDetailsPost.dart';

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

  GetProfileNoticePeriod profileSelectedUser;
  Company getCompany;

  int groupValue = 0;
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
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
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
                    ],
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
                                      value: 2,
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
                                child: TypeAheadField(
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
                                          return "this field is required";
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
                                      child: Text("Current Salary *",
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
                                      controller: salaryCount,
                                      decoration: InputDecoration(
                                        hintText: "Current Salary",
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
                                          return "this field is required";
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
                                      child: Text("Working since",
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
                                          // hintStyle: heading6.copyWith(color: textGrey),
                                          // errorStyle: TextStyle(color: Colors.redAccent),
                                          suffixIcon: Icon(Icons.event_note),
                                        ),
                                        // initialValue: date,
                                        mode: DateTimeFieldPickerMode.date,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (e) => (e?.day ?? 0) == 1
                                            ? 'Please not the first day'
                                            : null,

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
                                        validator: (value) => value == null
                                            ? 'Please fill Notice Period'
                                            : null,
                                        items: _apiResponseProfile.data
                                            .map((GetProfileNoticePeriod user) {
                                          var dropdownMenuItem =
                                              DropdownMenuItem<
                                                  GetProfileNoticePeriod>(
                                            value: user,
                                            child: Text(
                                              user.noticePeriodName,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                          return dropdownMenuItem;
                                        }).toList(),
                                      ),
                                    )
                                  : Container(),

                              groupValue == 2
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top: 15,
                                      ),
                                      child: Text("Previous Company Name",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "ProximaNova")),
                                    )
                                  : Container(),

                              groupValue == 2
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: DropdownSearch<Company>(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: UnderlineInputBorder()),
                                        validator: (value) {
                                          if (value == null) {
                                            return "Please Select Company Name";
                                          }
                                          return null;
                                        },
                                        mode: Mode.DIALOG,
                                        items: isLoadingCurrentCopmpany
                                            ? Company()
                                            : _apiResponseCurrentCompany.data,
                                        itemAsString: (Company obj) {
                                          return obj.organizationName;
                                        },
                                        onFind: (val) async {
                                          setState(() {
                                            query = val;
                                            print(val);
                                          });
                                          return _apiResponseCurrentCompany
                                              .data;
                                        },
                                        hint: "Select Highest Qualification",
                                        onChanged: (value) {
                                          currentCompanySearchCo.text =
                                              value.organizationId.toString();
                                          currentCompanyID =
                                              value.organizationId;
                                          print(value.organizationId);
                                        },
                                        showSearchBox: true,
                                        popupItemBuilder: (context,
                                            Company item, bool isSelected) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Card(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                    Text(item.organizationName),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container(),
                              groupValue == 2
                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(
                                      height: 10,
                                    ),
                              groupValue == 2
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
                              groupValue == 2
                                  ? TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "this field is required";
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
                              groupValue == 2
                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : Container(),

                              // const Text('Previous Designation',
                              //     style: TextStyle(fontSize:15,
                              //         fontWeight: FontWeight.bold,
                              //         fontFamily: "ProximaNova")),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // DropdownSearch<String>(
                              //   dropdownSearchDecoration: const InputDecoration(
                              //     border: UnderlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Colors.grey,
                              //       ),
                              //     ),
                              //   ),
                              //   mode: Mode.DIALOG,
                              //   showSelectedItems: true,
                              //   showSearchBox: true,
                              //   items: ["Indian",
                              //     "Chinies",
                              //     "Indonasian",
                              //     "Austrailia"],
                              //   // popupItemDisabled: (String s) => s.startsWith('I'),
                              //   onChanged: print,
                              //   hint: "Select Nationality",
                              //   // selectedItem: "Indian"
                              // ),

                              groupValue == 2
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top: 15,
                                      ),
                                      child: Text("Previous Salary",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "ProximaNova")),
                                    )
                                  : Container(),
                              groupValue == 2
                                  ? TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Previous Annually Salary",
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

                              groupValue == 2
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

                              groupValue == 2
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
                                              validator: (e) => (e?.day ?? 0) ==
                                                      1
                                                  ? 'Please not the first day'
                                                  : null,

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
                                              validator: (e) => (e?.day ?? 0) ==
                                                      1
                                                  ? 'Please not the first day'
                                                  : null,

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

                              // Padding(
                              //   padding: EdgeInsets.only(
                              //     top: 10,
                              //   ),
                              //   child: Text("Industry",
                              //       style: TextStyle(
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.bold,
                              //           fontFamily: "ProximaNova")),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 8.0),
                              //   child: FindDropdown(
                              //     searchBoxDecoration: const InputDecoration(
                              //       border: UnderlineInputBorder(
                              //         borderSide: BorderSide(
                              //           color: Colors.grey,
                              //         ),
                              //       ),
                              //     ),
                              //     items: parseIndustry(),
                              //     searchHint: "Industry Name",
                              //     onFind: (val) async {
                              //       setState(() {
                              //         query = val;
                              //       });
                              //       await fetchIndustry(query: query);
                              //       parseData();
                              //       return [""];
                              //     },
                              //     onChanged: (item) {
                              //       setState(() {
                              //         myindustry = item;
                              //       });
                              //     },
                              //   ),
                              // )
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
                                print("Currently Working : " +
                                    groupValue.toString());
                                print("Organisation Name : " +
                                    getCompany.organizationName);
                                print("Notice Period : " +
                                    profileSelectedUser.noticePeriodId);
                                print("Designation : " +
                                    currentCompanyCntrl.text);
                                print("Salary :" + salaryCount.text.toString());
                                print("Start Date :" + selectedDate.toString().split(" ")[0]);
                                print(
                                    "=======================================");
                                final insert = PostProfession(
                                  candidateUuid: widget.uuid,
                                  candidateexpOrganizationname:
                                  currentOrganisationNameCntrl.text,
                                  // candidateexpIscurrentcompany:
                                  //     groupValue.toString(),
                                  candidateexpNoticeperiodId:
                                      profileSelectedUser.noticePeriodId,
                                  // candidateexpOrganizationname:
                                  //     getCompany.organizationName,
                                  candidateexpDesignation:
                                      currentCompanyCntrl.text,
                                  candidateexpSalary:
                                      salaryCount.text.toString(),
                                  candidateexpStartdate: selectedDate.toString().split(" ")[0],
                                  // candidateexpOrganizationId:
                                  //     int.parse(currentCompanyID),
                                  // candidateexpEnddate: selectedDate3,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => KeySkillsPage(
                                        uuid: widget.uuid,
                                      )));
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
