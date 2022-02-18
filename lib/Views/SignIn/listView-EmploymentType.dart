// import 'dart:convert';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:job_portal/Data_Controller/apiresponse.dart';
// import 'package:job_portal/Models/EmploymentType.dart';
// import 'package:job_portal/Services/ApiServices.dart';
// import 'package:job_portal/Utility/apiurls.dart';
// import 'package:http/http.dart' as http;
//
// class listCheck extends StatefulWidget {
//    listCheck({Key key}) : super(key: key);
//
//   @override
//   listCheckState createState() => listCheckState();
// }
// List<int> selectedSkillsemp = [];
//
// class listCheckState extends State<listCheck> {
//   ApiServices apiServices = ApiServices();
//
//   bool isLoading = false;
//   EmploymentType checkBoxValue = null;
//   bool check;
//
//   fetchEmpType() async {
//     setState(() {
//       isLoading = true;
//     });
//     _apiResponse3 = await apiServices.getEmploymentType();
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   ApiResponse<List<EmploymentType>> _apiResponse3;
//
//   bool _isChecked = true;
//
//   @override
//   void initState() {
//     fetchData();
//     fetchEmpType();
//     super.initState();
//   }
//
//   var courseList = <EmploymentType>[];
//
//   Future<List<EmploymentType>> fetchData() async {
//     final url = Uri.parse(ApiUrls.kEmpType);
//     final header = {
//       "Content-Type": "application/json",
//     };
//     final response = await http.get(url, headers: header);
//     var courses = <EmploymentType>[];
//     if (response.statusCode == 200) {
//       var coursesJson = jsonDecode(response.body);
//       for (var data in coursesJson) {
//         courses.add(EmploymentType.fromJson(data));
//       }
//     } else {
//       throw Exception('Failed to Fetch Courses');
//     }
//     setState(() {
//       courseList = courses;
//     });
//     return courseList;
//   }
//
//   // final List<EmploymentType> questionList = [];
//
//   getList() {
//     for (var a in courseList) {
//       Row(
//         children: [
//           Checkbox(
//               value: checkBoxValue == a,
//               onChanged: (bool newValue) {
//                 setState(() {
//                   checkBoxValue = a;
//                 });
//               }),
//           Text(a.employmenttypeName),
//         ],
//       );
//     }
//     // .toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children:[
//         Padding(
//           padding:
//           const EdgeInsets.all(8.0),
//           child: DropdownSearch<EmploymentType>.multiSelection(
//             autoValidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               if (value.isEmpty) {
//                 return "Please Select Employment type";
//               }
//               return null;
//             },
//             mode: Mode.DIALOG,
//             items: isLoading
//                 ? [EmploymentType()]
//                 : _apiResponse3.data,
//             itemAsString:
//                 (EmploymentType obj) {
//               return obj.employmenttypeName;
//             },
//             onChanged: (val) {
//               setState(() {
//                 selectedSkillsemp = val.map((e) {
//                   return e.employmenttypeId;
//                 }).toList();
//                 print(selectedSkillsemp);
//               });
//             },
//             // onFind: (val) async {
//             //   setState(() {
//             //     query = val;
//             //   });
//             //   fetchCompany(query: query);
//             //   return _apiResponse.data;
//             // },
//             // ignore: deprecated_member_use
//             hint: "Select Employment type",
//             showSearchBox: true,
//             popupItemBuilder: (context,
//            EmploymentType item,
//                 bool isSelected) {
//               return Container(
//                 margin:
//                 EdgeInsets.symmetric(
//                     horizontal: 8),
//                 child: Padding(
//                   padding:
//                   EdgeInsets.all(8.0),
//                   child: Text(
//                       item.employmenttypeName),
//                 ),
//               );
//             },
//           ),
//         ),
//
//
//
//       ]
//
//     );
//   }
// // Widget buildCheck(CheckBoxModel checkBoxModel ) => CheckboxListTile(
// //     value:checkBoxModel.value,
// //     controlAffinity: ListTileControlAffinity.leading,
// //     title: Text(checkBoxModel.title),
// //     onChanged: (value) {
// //       setState(() {
// //         checkBoxModel.value = value;
// //       });
// //     });
// }
