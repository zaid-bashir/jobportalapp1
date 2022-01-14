import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/EmploymentType.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Utility/apiurls.dart';
import 'package:http/http.dart' as http;

class listCheck extends StatefulWidget {
  const listCheck({Key key}) : super(key: key);

  @override
  _listCheckState createState() => _listCheckState();
}

class _listCheckState extends State<listCheck> {
  ApiServices apiServices = ApiServices();

  bool isLoading = false;
  EmploymentType checkBoxValue  = null;

  fetchEmpType() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse3 = await apiServices.getEmploymentType();
    setState(() {
      isLoading = false;
    });
  }
  ApiResponse<List<EmploymentType>> _apiResponse3;
  bool check = false;
  bool _isChecked = true;

  @override
  void initState() {
    fetchData();
    fetchEmpType();
    super.initState();
  }

  var courseList = <EmploymentType>[];


  Future<List<EmploymentType>> fetchData() async {
    final url = Uri.parse(ApiUrls.kEmpType);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
        url,
        headers: header
    );
    var courses = <EmploymentType>[];
    if (response.statusCode == 200) {
      var coursesJson = jsonDecode(response.body);
      for (var data in coursesJson) {
        courses.add(EmploymentType.fromJson(data));
      }
    } else {
      throw Exception('Failed to Fetch Courses');
    }
    setState(() {
      courseList = courses;
    });
    return courseList;
  }

  // final List<EmploymentType> questionList = [];

  List<Widget> getList() {
    List<Widget> childs = courseList
        .map((e) =>
        Row(children: <Widget>[
          Checkbox(
              value:  checkBoxValue == e ,
              onChanged: (newValue) {
                setState(() {
                  checkBoxValue = e;

                });
              }
          ),
          Text(e.employmenttypeName),

        ]))
        .toList();
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: getList()

    );

  }
  // Widget buildCheck(CheckBoxModel checkBoxModel ) => CheckboxListTile(
  //     value:checkBoxModel.value,
  //     controlAffinity: ListTileControlAffinity.leading,
  //     title: Text(checkBoxModel.title),
  //     onChanged: (value) {
  //       setState(() {
  //         checkBoxModel.value = value;
  //       });
  //     });
}
