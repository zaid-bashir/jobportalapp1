// import 'dart:convert';
//
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:job_portal/Data_Controller/apiresponse.dart';
// import 'package:job_portal/Models/EmploymentType.dart';
// import 'package:job_portal/Models/JobType.dart';
// import 'package:job_portal/Services/ApiServices.dart';
// import 'package:job_portal/Utility/apiurls.dart';
// import 'package:http/http.dart' as http;
//
// class ListJob extends StatefulWidget {
//   const ListJob({Key key}) : super(key: key);
//
//   @override
//   ListJobState createState() => ListJobState();
// }
// List<int> selectedSkillsJob = [];
//
// class ListJobState extends State<ListJob> {
//   ApiServices apiServices = ApiServices();
//
//   bool isLoading = false;
//   JobType checkBoxValue  = null;
//   //
//   // fetchEmpType() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   _apiResponse3 = await apiServices.getEmploymentType();
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }
//   //
//   // ApiResponse<List<EmploymentType>> _apiResponse3;
//   // bool check = false;
//
//   fetchJobType() async {
//     setState(() {
//       isLoading = true;
//     });
//     _apiResponse8 = await apiServices.getjobType();
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   ApiResponse<List<JobType>> _apiResponse8;
//   @override
//   void initState() {
//     fetchData();
//     fetchJobType();
//     super.initState();
//   }
//
//   var courseList = <JobType>[];
//
//
//   Future<List<JobType>> fetchData() async {
//     final url = Uri.parse(ApiUrls.kJobType);
//     final header = {
//       "Content-Type": "application/json",
//     };
//     final response = await http.get(
//         url,
//         headers: header
//     );
//
//     var courses = <JobType>[];
//     if (response.statusCode == 200) {
//       var coursesJson = jsonDecode(response.body);
//       for (var data in coursesJson) {
//         courses.add(JobType.fromJson(data));
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
//   List<Widget> getList() {
//     List<Widget> childs = courseList.map((e) =>
//         Row(children: <Widget>[
//           Checkbox(
//               value:  checkBoxValue == e ,
//               onChanged: (newValue) {
//                 setState(() {
//                   checkBoxValue = e  ;
//                 });
//               }
//           ),
//           Text(e.jobtypeName),
//
//         ]))
//         .toList();
//     return childs;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DropdownSearch<JobType>.multiSelection(
//           autoValidateMode:
//           AutovalidateMode
//               .onUserInteraction,
//           validator: (value) {
//             if (value.isEmpty) {
//               return "Please Select Job type";
//             }
//             return null;
//           },
//           mode: Mode.DIALOG,
//           items: isLoading
//               ? [JobType()]
//               : _apiResponse8.data,
//           itemAsString:
//               (JobType obj) {
//             return obj.jobtypeName;
//           },
//           onChanged: (val) {
//             setState(() {
//
//               selectedSkillsJob = val.map((e){
//                 return e.jobtypeId;
//               }).toList();
//               print(selectedSkillsJob);
//             });
//           },
//           // onFind: (val) async {
//           //   setState(() {
//           //     query = val;
//           //   });
//           //   fetchCompany(query: query);
//           //   return _apiResponse.data;
//           // },
//           // ignore: deprecated_member_use
//           hint: "Select Job Type",
//           showSearchBox: true,
//           popupItemBuilder: (context,
//               JobType item,
//               bool isSelected) {
//             return Container(
//               margin:
//               EdgeInsets.symmetric(
//                   horizontal: 8),
//               child: Padding(
//                 padding:
//                 EdgeInsets.all(8.0),
//                 child: Text(
//                     item.jobtypeName),
//               ),
//             );
//           },
//         ),
//       ]
//     );
//
//   }
// }
