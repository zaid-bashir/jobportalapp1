// // ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors, avoid_print
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:job_portal/Data_Controller/apiresponse.dart';
// import 'package:job_portal/Models/GetTitle.dart';
// import 'package:job_portal/Models/JobCategory.dart';
// import 'package:job_portal/Services/ApiServices.dart';
// import 'package:job_portal/Utility/ApiUrls.dart';
// import 'package:job_portal/Views/SignIn/Step3-QualificationDetails.dart';
//
// class BasicDetails extends StatefulWidget {
//   const BasicDetails({Key key}) : super(key: key);
//
//   @override
//   _BasicDetailsState createState() => _BasicDetailsState();
// }
//
// class _BasicDetailsState extends State<BasicDetails> {
//   List<String> jobCategoryList = [
//     "Software Engineer",
//     "Network Engineer",
//     "Network Engineer",
//     "Software Tester",
//   ];
//
//
//   String myjobCategory;
//
//   List<String> locationList = ["Srinagar", "Jammu", "Kolkata"];
//
//   String myLocation;
//
//   List<String> salutation = [
//     "Mr",
//     "Ms",
//     "Shri",
//     "Mrs",
//     "Mx",
//   ];
//
//   String mySelection;
//   String mySelectionYear;
//   String mySelectionMonth;
//
//   bool _isLoading = false;
//   int genderGroupValue = 0;
//   int experienceGroupValue = 0;
//   String dropdownValue;
//
//   bool isLoading = false;
//
//   ApiServices apiServices = ApiServices();
//
//   ApiResponse<List<GetTitle>> _apiResponse;
//   ApiResponse<List<JobCategory>> _apiResponse2;
//
//   var  courseList = <JobCategory> [];
//
//   Future<List<JobCategory>> getJobCategory(String name) async {
//     final url = Uri.parse(ApiUrls.kJobCategory + name);
//     final headers = {
//       "Content-Type": "application/json",
//     };
//     final response = await  http.get(
//         url,
//         headers: headers
//     );
//
//     var courses = <JobCategory>[];
//     if (response.statusCode == 200) {
//       var coursesJson = jsonDecode(response.body);
//       for (var data in coursesJson) {
//         courses.add(JobCategory.fromJson(data));
//       }
//     } else {
//       throw Exception('Failed to Fetch Courses');
//     }
//     setState(() {
//       courseList = courses;
//     });
//     return courses;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchJobCategory();
//     fetchTitles();
//   }
//
//   fetchTitles() async {
//     setState(() {
//       isLoading = true;
//     });
//     _apiResponse = await apiServices.getTitle();
//     setState(() {
//       isLoading = false;
//     });
//   }
//   fetchJobCategory() async {
//     setState(() {
//       isLoading = true;
//     });
//   getJobCategory(myjobCategory);
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 20, top: 10),
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: Icon(Icons.arrow_back),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "Register New Account",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "ProximaNova"),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//             child: Card(
//               child: Form(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(color: Colors.grey)),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: DropdownButtonHideUnderline(
//                                   child: GFDropdown(
//                                     hint: Text(
//                                       "Title",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: "ProximaNova"),
//                                     ),
//                                     onChanged: (newValue) {
//                                       setState(() {
//                                         mySelection = newValue;
//                                       });
//                                     },
//                                     items: isLoading
//                                         ? ["Please Wait"]
//                                             .map(
//                                               (value) => DropdownMenuItem(
//                                                   value: value,
//                                                   child: Text(
//                                                     value,
//                                                     style: TextStyle(
//                                                         fontSize: 15,
//                                                         fontWeight:
//                                                             FontWeight.normal,
//                                                         fontFamily:
//                                                             "ProximaNova"),
//                                                   )),
//                                             )
//                                             .toList()
//                                         : _apiResponse.data
//                                             .map(
//                                               (data) => DropdownMenuItem(
//                                                 value: data.titleId,
//                                                 child: Text(
//                                                   "${data.titleDesc}",
//                                                   style: TextStyle(
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.normal,
//                                                       fontFamily:
//                                                           "ProximaNova"),
//                                                 ),
//                                               ),
//                                             )
//                                             .toList(),
//                                     value: mySelection,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           flex: 5,
//                           child: const TextField(
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.all(8.0),
//                               labelText: 'First Name',
//                               labelStyle: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "ProximaNova"),
//                               floatingLabelStyle: TextStyle(
//                                 color: Color(0xff2972ff),
//                                 fontFamily: "ProximaNova",
//                                 fontWeight: FontWeight.bold,
//                                 // letterSpacing: 1.5,
//                                 fontSize: 17.5,
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xff2972ff),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           Expanded(
//                             child: const TextField(
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.all(8.0),
//                                 labelText: 'Middle Name',
//                                 labelStyle: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: "ProximaNova"),
//                                 floatingLabelStyle: TextStyle(
//                                   color: Color(0xff2972ff),
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.bold,
//                                   // letterSpacing: 1.5,
//                                   fontSize: 17.5,
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0xff2972ff),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: const TextField(
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.all(8.0),
//                                 labelText: 'Last Name',
//                                 labelStyle: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: "ProximaNova"),
//                                 floatingLabelStyle: TextStyle(
//                                   color: Color(0xff2972ff),
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.bold,
//                                   // letterSpacing: 1.5,
//                                   fontSize: 17.5,
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0xff2972ff),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: const TextField(
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(8.0),
//                           labelText: 'E-mail',
//                           labelStyle: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "ProximaNova"),
//                           floatingLabelStyle: TextStyle(
//                             color: Color(0xff2972ff),
//                             fontFamily: "ProximaNova",
//                             fontWeight: FontWeight.bold,
//                             // letterSpacing: 1.5,
//                             fontSize: 17.5,
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0xff2972ff),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                         "Gender",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "ProximaNova"),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GFRadio(
//                             size: 20,
//                             activeBorderColor: Color(0xff2972ff),
//                             value: 0,
//                             groupValue: genderGroupValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 genderGroupValue = value;
//                               });
//                             },
//
//                             inactiveIcon: null,
//                             radioColor: Color(0xff2972ff),
//                           ),
//
//                           const SizedBox(
//                             width: 7,
//                           ),
//                           const Text(
//                             "Male",
//
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "ProximaNova"),
//                           ),
//
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           GFRadio(
//                             size: 20,
//                             value: 1,
//                             groupValue: genderGroupValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 genderGroupValue = value;
//                               });
//                             },
//                             inactiveIcon: null,
//                             activeBorderColor: Color(0xff2972ff),
//                             radioColor: Color(0xff2972ff),
//                           ),
//                           const SizedBox(
//                             width: 7,
//                           ),
//                           const Text(
//                             "Female",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "ProximaNova"),
//                           ),
//                           const SizedBox(
//                             width: 7,
//                           ),
//                           GFRadio(
//                             size: 20,
//                             activeBorderColor: Color(0xff2972ff),
//                             value: 3,
//                             groupValue: genderGroupValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 genderGroupValue = value;
//                               });
//                             },
//                             inactiveIcon: null,
//                             radioColor: Color(0xff2972ff),
//                           ),
//                           const SizedBox(
//                             width: 7,
//                           ),
//                           const Text(
//                             "Others",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "ProximaNova"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                         "Experience",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "ProximaNova"),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GFRadio(
//                             size: 20,
//                             activeBorderColor: Color(0xff2972ff),
//                             value: 0,
//                             groupValue: experienceGroupValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 experienceGroupValue = value;
//                               });
//                             },
//                             inactiveIcon: null,
//                             radioColor: Color(0xff2972ff),
//                           ),
//                           const SizedBox(
//                             width: 7,
//                           ),
//                           const Text(
//                             "Yes",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "ProximaNova"),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           GFRadio(
//                             size: 20,
//                             value: 1,
//                             groupValue: experienceGroupValue,
//                             onChanged: (value) {
//                               setState(() {
//                                 experienceGroupValue = value;
//                               });
//                             },
//                             inactiveIcon: null,
//                             activeBorderColor: Color(0xff2972ff),
//                             radioColor: Color(0xff2972ff),
//                           ),
//                           const SizedBox(
//                             width: 7,
//                           ),
//                           const Text(
//                             "No",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "ProximaNova"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     experienceGroupValue == 0
//                         ? Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               "Experience Tenure",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "ProximaNova"),
//                             ),
//                           )
//                         : Container(),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     experienceGroupValue == 0
//                         ? Row(
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                           bottom:
//                                               BorderSide(color: Colors.grey)),
//                                     ),
//                                     child: DropdownButtonHideUnderline(
//                                       child: GFDropdown(
//                                         hint: Text(
//                                           "Years",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "ProximaNova"),
//                                         ),
//                                         borderRadius: BorderRadius.horizontal(
//                                             left: Radius.zero,
//                                             right: Radius.zero),
//                                         value: mySelectionYear,
//                                         onChanged: (newValue) {
//                                           setState(() {
//                                             mySelectionYear = newValue;
//                                           });
//                                         },
//                                         items: [
//                                           "0",
//                                           "1",
//                                           "2",
//                                           "3",
//                                           "4",
//                                           "5",
//                                           "6",
//                                           "7",
//                                           "8",
//                                           "9",
//                                           "10",
//                                           "11",
//                                           "12",
//                                           "13",
//                                           "14",
//                                           "15"
//                                         ]
//                                             .map(
//                                               (value) => DropdownMenuItem(
//                                                   value: value,
//                                                   child: Text(
//                                                     value,
//                                                     style: TextStyle(
//                                                         fontSize: 15,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontFamily:
//                                                             "ProximaNova"),
//                                                   )),
//                                             )
//                                             .toList(),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       border: Border(
//                                           bottom:
//                                               BorderSide(color: Colors.grey)),
//                                     ),
//                                     child: DropdownButtonHideUnderline(
//                                       child: GFDropdown(
//                                         hint: Text(
//                                           "Months",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "ProximaNova"),
//                                         ),
//                                         value: mySelectionMonth,
//                                         onChanged: (newValue) {
//                                           setState(() {
//                                             mySelectionMonth = newValue;
//                                           });
//                                         },
//                                         items: ["0", "1", "2", "3", "4", "5"]
//                                             .map(
//                                               (value) => DropdownMenuItem(
//                                                   value: value,
//                                                   child: Text(
//                                                     value,
//                                                     style: TextStyle(
//                                                         fontSize: 15,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontFamily:
//                                                             "ProximaNova"),
//                                                   )),
//                                             )
//                                             .toList(),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Container(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                         "Job Category",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "ProximaNova"),
//                       ),
//                     ),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: DropdownSearch<String>(
//                           hint: "Job Category",
//                           dropdownSearchBaseStyle: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "ProximaNova"),
//                           dropdownSearchDecoration: const InputDecoration(
//                             border: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                           mode: Mode.DIALOG,
//                           showSearchBox: true,
//                           showSelectedItems: true,
//                           items: jobCategoryList,
//                           // label: "Menu mode",
//                           popupItemDisabled: (String s) => s.startsWith('I'),
//                           onChanged: (item) {
//                             setState(() {
//                               myjobCategory = item;
//                             });
//                           },
//                           selectedItem: myjobCategory,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                         "Current Location",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "ProximaNova"),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: DropdownSearch<String>(
//                         hint: "Current Location",
//                         dropdownSearchBaseStyle: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "ProximaNova"),
//                         dropdownSearchDecoration: const InputDecoration(),
//                         mode: Mode.DIALOG,
//                         showSearchBox: true,
//                         showSelectedItems: true,
//                         items: locationList,
//                         // label: "Menu mode",
//                         popupItemDisabled: (String s) => s.startsWith('I'),
//                         onChanged: (item) {
//                           setState(() {
//                             myLocation = item;
//                           });
//                         },
//                         selectedItem: myLocation,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: GFButton(
//                 text: "Next",
//                 type: GFButtonType.solid,
//                 blockButton: false,
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => QualificationBlueCollar(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetShift.dart';
import 'package:job_portal/Models/JobCategory.dart';
import 'package:job_portal/Utility/ApiUrls.dart';
import 'package:search_choices/search_choices.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchableDropdownApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

bool isLoading = false;

List<String> localData = [
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  'Eight',
  'Nine',
  'Ten',
];

class _AppState extends State<SearchableDropdownApp> {
  Map<String, String> selectedValueMap = Map();

  @override
  void initState() {
    selectedValueMap["local"] = null;
    selectedValueMap["server"] = null;
    super.initState();
  }

  ApiResponse<List<PreferredShift>> _apiResponse;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Searchable Dropdown Example App'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 571,
            width: double.infinity,
            color: Colors.white.withOpacity(0.4),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Container(
                      child:  Text(
                    'Dropdown with local data : ',
                    style:  TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  // use local data for providing options and store selected value to the key "local"
                  getSearchableDropdown(localData, "local"),
                  Container(
                      child:  Text(
                    'server data : ',
                    style:  TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  FutureBuilder<ApiResponse<List<PreferredShift>>>(
                    // get data from server and return a list of mapped 'name' fields
                    future: getServerData(),
                    //sets getServerData method as the expected Future
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //checks if response returned valid data
                        // use mapped 'name' fields for providing options and store selected value to the key "server"
                        return getSearchableDropdown(
                            _apiResponse.data, "server");
                      } else if (snapshot.hasError) {
                        //checks if the response threw error
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchableDropdown(List<dynamic> listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for (var i = 0; i < listData.length; i++) {
      items.add(DropdownMenuItem(
        child: Text(
          _apiResponse.data ?? "sometext",
        ),
        value: _apiResponse.data.length,
      ));
    }
    return SearchChoices.single(
      items: items,
      value: selectedValueMap[mapKey],
      isCaseSensitiveSearch: false,
      hint: Text('Select One'),
      searchHint: Text(
        'Select One',
        style: TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          selectedValueMap[mapKey] = value;
        });
      },
    );
  }

  Future<ApiResponse<List<PreferredShift>>> getServerData() async {
    final url = Uri.parse(ApiUrls.kShift);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <PreferredShift>[];
      for (var item in jsonData) {
        list.add(PreferredShift.fromJson(item));
      }
      return ApiResponse<List<PreferredShift>>(data: list);
    }
    return ApiResponse<List<PreferredShift>>(
        error: true, errorMessage: "An error occurred");
  }
}
