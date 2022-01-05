import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/CurerntLocation.dart';
import 'package:job_portal/Models/GetTitle.dart';
import 'package:job_portal/Models/getjobcategory.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step3-QualificationDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key key}) : super(key: key);

  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  //SharedPrefs Variable
  String titleIdPref;
  // String myyear = "";

  String myjobrole = "";

  List<String> locationList = ["Srinagar", "Jammu", "Kolkata"];

  String myLocation = "";
  String query = "";

  List<String> salutation = [
    "Mr",
    "Ms",
    "Shri",
    "Mrs",
    "Mx",
  ];

  String mySelection;
  String mySelectionYear;
  String mySelectionMonth;
  bool _isLoading = false;
  int genderGroupValue = 0;
  int experienceGroupValue = 0;
  String dropdownValue;
  bool isLoading = false;
  bool isLoadingJobCategory = false;
  bool isLoadingCurrentLocation = false;
  // bool isLoadingYears = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<List<GetTitle>> _apiResponse;
  // ApiResponse<List<Years>> _apiResponse3;
  ApiResponse<List<JobCategory>> _apiResponseJobCategory;
  ApiResponse<List<CurrentLocation>> _apiResponseCurrentLocation;

  SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    fetchTitles();
    fetchJobCategory(query: "");
    fetchCurrentLocation(query: "");
    // fetchYears();
  }

  void initSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  // fetchYears() async {
  //   setState(() {
  //     isLoadingYears  = true;
  //   });
  //   _apiResponse3 = await apiServices.getExperienceYears();
  //   setState(() {
  //     isLoadingYears = false;
  //   });
  // }

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
              child: Form(
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
                                    hint: getRequiredLabel(fieldName: "Title"),
                                    onChanged: (newValue) {
                                      setState(() {
                                        mySelection = newValue;
                                        pref.setString("titleId", titleIdPref);
                                      });
                                      String Intval =
                                          pref.getString('titleId') ?? 0;
                                      print(Intval);
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
                                                value: titleIdPref =
                                                    data.titleId,
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
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              alignLabelWithHint: true,
                              label: getRequiredLabel(
                                fieldName: "First Name",
                              ),
                              // labelStyle: TextStyle(
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.normal,
                              //     fontFamily: "ProximaNova"),
                              // floatingLabelStyle: TextStyle(
                              //   color: Color(0xff2972ff),
                              //   fontFamily: "ProximaNova",
                              //   fontWeight: FontWeight.bold,
                              //   // letterSpacing: 1.5,
                              //   fontSize: 17.5,
                              // ),
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
                          const Expanded(
                            child: TextField(
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
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),
                                label: getRequiredLabel(fieldName: "Last Name"),
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
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
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: getRequiredLabel(fieldName: "Gender"),
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
                            value: 0,
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
                            value: 1,
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
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: getRequiredLabel(fieldName: "Experiance"),
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
                            value: 0,
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
                            value: 1,
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
                        ? Padding(
                            padding: EdgeInsets.all(8),
                            child: getRequiredLabel(
                                fieldName: "Experiance Tenure"),
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
                                        value: mySelectionMonth,
                                        onChanged: (newValue) {
                                          setState(() {
                                            mySelectionMonth = newValue;
                                          });
                                        },
                                        items: ["0", "1", "2", "3", "4", "5"]
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
                                    // child: DropdownButtonHideUnderline(
                                    //       child:  DropdownButtonFormField(
                                    //         // disabledHint: ,
                                    //           decoration:const InputDecoration(
                                    //               border: UnderlineInputBorder(
                                    //
                                    //               )
                                    //           ),
                                    //           hint: Text("Select year"),
                                    //           value: myyear,
                                    //           onChanged: (newValue) {
                                    //             setState(() {
                                    //               myyear = newValue;
                                    //             });
                                    //           },
                                    //           items: isLoading
                                    //           ? ["Please Wait"]
                                    //               .map(
                                    //                 (value) => DropdownMenuItem(
                                    //                 value: value,
                                    //                 child: Text(
                                    //                   value,
                                    //                   style: TextStyle(
                                    //                       fontSize: 15,
                                    //                       fontWeight:
                                    //                       FontWeight.normal,
                                    //                       fontFamily:
                                    //                       "ProximaNova"),
                                    //                 )),
                                    //           )
                                    //               .toList()
                                    //               : _apiResponse3.data
                                    //           .map(
                                    //           (data) => DropdownMenuItem(
                                    //       value: data.yearId,
                                    //       child: Text(
                                    //         data.yearName,
                                    //         style: TextStyle(
                                    //             fontSize: 15,
                                    //             fontWeight:
                                    //             FontWeight.normal,
                                    //             fontFamily:
                                    //             "ProximaNova"),
                                    //       ),
                                    //     ),
                                    //   )
                                    //       .toList(),
                                    //
                                    //
                                    //
                                    //
                                    // ),
                                    // ),
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
                                        items: ["0", "1", "2", "3", "4", "5"]
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
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: getRequiredLabel(fieldName: "Job Role"),
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
                          items: parseData(),
                          searchHint: "Job Role",
                          onFind: (val) async {
                            setState(() {
                              query = val;
                            });
                            await fetchJobCategory(query: query);
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
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: getRequiredLabel(fieldName: "Current Location"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FindDropdown(
                        searchBoxDecoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        items: parseLocation(),
                        searchHint: "Current Location",
                        onFind: (val) async {
                          setState(() {
                            query = val;
                          });
                          await fetchCurrentLocation(query: query);
                          parseLocation();
                          return [""];
                        },
                        onChanged: (item) {
                          setState(() {
                            myLocation = item;
                          });
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const QualificationBlueCollar(),
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
    );
  }
}
