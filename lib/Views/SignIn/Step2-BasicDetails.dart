// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field, unnecessary_string_interpolations, avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetTitle.dart';
import 'package:job_portal/Models/basicdetials.dart';
import 'package:job_portal/Models/getjobcategory.dart';
import 'package:job_portal/Services/ApiServices.dart';

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key key}) : super(key: key);

  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  //Global Form Key
  //===============
  var formKey = GlobalKey<FormState>();

  //Controllers for TextField
  //=========================
  TextEditingController fnameController = TextEditingController();
  TextEditingController mnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //Normal Fiels Variables
  //======================
  String titleId = "";
  String myjobrole = "";
  String query;
  String myLocation;
  bool _isLoading = false;
  int genderGroupValue = 0;
  int experienceGroupValue = 0;
  String dropdownValue;
  String mySelection;
  String mySelectionYear;
  String mySelectionMonth;
  bool isLoadingJobCategory = false;
  bool isLoading = false;

  //Dummy Data List
  //===============
  List<String> locationList = ["Srinagar", "Jammu", "Kolkata"];
  List<String> salutation = [
    "Mr",
    "Ms",
    "Shri",
    "Mrs",
    "Mx",
  ];

  //Service Object
  //==============
  ApiServices apiServices = ApiServices();

  //ApiResponse Generic Objects
  //===========================
  ApiResponse<List<GetTitle>> _apiResponse;
  ApiResponse<List<JobCategory>> _apiResponseJobCategory;

  @override
  void initState() {
    super.initState();
    fetchTitles();
    fetchJobCategory(query: "");
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

  List<String> parseData() {
    List<JobCategory> category = _apiResponseJobCategory.data;
    List<String> dataItems = [];
    for (int i = 0; i < category.length; i++) {
      dataItems.add(category[i].jobroleName);
    }
    return dataItems;
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
              child: Form(
                key: formKey,
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
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    hint: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          "Title",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "ProximaNova"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    onChanged: (newValue) {
                                      setState(() {
                                        mySelection = newValue;
                                      });
                                    },
                                    items: isLoading
                                        ? ["Please Wait"]
                                            .map(
                                              (value) => DropdownMenuItem(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontFamily:
                                                            "ProximaNova"),
                                                  )),
                                            )
                                            .toList()
                                        : _apiResponse.data
                                            .map(
                                              (data) => DropdownMenuItem(
                                                value: titleId = data.titleId,
                                                child: Text(
                                                  "${data.titleDesc}",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily:
                                                          "ProximaNova"),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                    value: mySelection,
                                  ),
                                ),
                              ),
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
                              alignLabelWithHint: true,
                              labelText: "First Name",
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
                                labelText: 'Middle Name',
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
                                labelText: 'Last Name',
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
                          labelText: 'E-mail',
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
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Gender",
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GFRadio(
                            size: 20,
                            activeBorderColor: const Color(0xff2972ff),
                            value: 1,
                            groupValue: genderGroupValue,
                            onChanged: (value) {
                              setState(() {
                                genderGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: const Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GFRadio(
                            size: 20,
                            value: 2,
                            groupValue: genderGroupValue,
                            onChanged: (value) {
                              setState(() {
                                genderGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            activeBorderColor: const Color(0xff2972ff),
                            radioColor: const Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          GFRadio(
                            size: 20,
                            activeBorderColor: const Color(0xff2972ff),
                            value: 3,
                            groupValue: genderGroupValue,
                            onChanged: (value) {
                              setState(() {
                                genderGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: const Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Others",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Experience",
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GFRadio(
                            size: 20,
                            activeBorderColor: const Color(0xff2972ff),
                            value: 1,
                            groupValue: experienceGroupValue,
                            onChanged: (value) {
                              setState(() {
                                experienceGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: const Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Yes",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GFRadio(
                            size: 20,
                            value: 2,
                            groupValue: experienceGroupValue,
                            onChanged: (value) {
                              setState(() {
                                experienceGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            activeBorderColor: const Color(0xff2972ff),
                            radioColor: const Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "No",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    experienceGroupValue == 0
                        ? const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Experience Tenure",
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
                    experienceGroupValue == 0
                        ? Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: GFDropdown(
                                        hint: const Text(
                                          "Years",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "ProximaNova"),
                                        ),
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                left: Radius.zero,
                                                right: Radius.zero),
                                        value: mySelectionYear,
                                        onChanged: (newValue) {
                                          setState(() {
                                            mySelectionYear = newValue;
                                          });
                                        },
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
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: GFDropdown(
                                        hint: const Text(
                                          "Months",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "ProximaNova"),
                                        ),
                                        value: mySelectionMonth,
                                        onChanged: (newValue) {
                                          setState(() {
                                            mySelectionMonth = newValue;
                                          });
                                        },
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
                                          "12",
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
                        "Job Role",
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
                        child: FindDropdown(
                          searchBoxDecoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          items: isLoadingJobCategory
                              ? ["Not Connected With Internet"]
                              : parseData(),
                          searchHint: "Job Role",
                          onFind: (val) async {
                            setState(() {
                              query = val;
                            });
                            await isLoadingJobCategory
                                ? () {}
                                : fetchJobCategory(query: query);
                            parseData();
                            return [""];
                          },
                          onChanged: (item) {
                            setState(() {
                              myjobrole = item;
                            });
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
                        "Current Location",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<String>(
                        hint: "Current Location",
                        dropdownSearchBaseStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                        dropdownSearchDecoration: const InputDecoration(),
                        mode: Mode.DIALOG,
                        showSearchBox: true,
                        showSelectedItems: true,
                        items: locationList,
                        onChanged: (item) {
                          setState(() {
                            myLocation = item;
                          });
                        },
                        selectedItem: myLocation,
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
                onPressed: () {
                  print(titleId);
                  print(fnameController.text);
                  print(mnameController.text);
                  print(lnameController.text);
                  print(emailController.text);
                  print(genderGroupValue);
                  print(experienceGroupValue);
                  print(myjobrole);
                  print(myLocation);
                  if (formKey.currentState.validate()) {
                    apiServices.postBasicDetials(BasicDetialModel(
                      candidateTitleId: int.parse(titleId),
                      candidateFirstName: fnameController.text,
                      candidateMiddleName: mnameController.text,
                      candidateLastName: lnameController.text,
                      candidateEmail1: emailController.text,
                      candidateGenderId: genderGroupValue,
                      candidateJobroleId: 3,
                      candidateCityId: 5,
                    ));
                  }
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const QualificationBlueCollar(),
                  //   ),
                  // );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
