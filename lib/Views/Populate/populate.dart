// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetTitle.dart';

class Populate extends StatefulWidget {
  const Populate({Key key}) : super(key: key);

  @override
  PopulateState createState() => PopulateState();
}

class PopulateState extends State<Populate> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget populateTitle(
      GetTitle selectedUser, ApiResponse<List<GetTitle>> _apiResponse) {
    return DropdownButtonFormField<GetTitle>(
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
      validator: (value) => value == null ? 'Please fill Title' : null,
      items: _apiResponse.data.map((GetTitle user) {
        return DropdownMenuItem<GetTitle>(
          value: user,
          child: Text(
            user.titleDesc,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    );
  }

  Widget populateYears(String mySelectionYear) {
    return DropdownButtonFormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hint: Text("Years"),
      value: mySelectionYear,
      onChanged: (newValue) {
        setState(() {
          mySelectionYear = newValue;
        });
      },
      validator: (value) => value == null ? 'Please fill Year' : null,
      items:
          ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
              .map(
                (value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    )),
              )
              .toList(),
    );
  }
}
