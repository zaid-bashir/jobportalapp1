// ignore_for_file: prefer_final_fields, unused_field, avoid_print, prefer_const_constructors, missing_required_param

import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/Views/SignIn/register_step3_collars.dart';

class RegisterStep2 extends StatefulWidget {
  const RegisterStep2({Key key}) : super(key: key);

  @override
  _RegisterStep2State createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> {



  List<String> jobCategoryList = [
    "Software Engineer",
    "Network Engineer",
    "Network Engineer",
    "Software Tester",
  ];

  String myjobCategory = "";

  List<String> locationList = ["Srinagar", "Jammu", "Kolkata"];

  String myLocation = "";

  List<String> salutation = [
    "Mr",
    "Ms",
    "Miss",
    "Mrs",
    "Mx",
  ];

  String mySelection = "Mr";
  String mySelectionYear = "1";
  String mySelectionMonth = "0";

  bool _isLoading = false;
  int genderGroupValue = 0;
  int experienceGroupValue = 0;
  String dropdownValue;

  //FOR BASIC DETAILS ---> FUNCTIONS
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      getImagefromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    getImagefromcamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  File _image;

  Future getImagefromcamera() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image :$e");
    }
  }

  Future getImagefromGallery() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image :$e");
    }
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
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Register new\naccount ",
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 20.5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Stack(fit: StackFit.loose, children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image == null
                      ? Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/as.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : ClipOval(
                          child: Image.file(
                            _image,
                            width: 140.0,
                            height: 140.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 90.0, right: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 25.0,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Card(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                               decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey)),
                                    ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    value: mySelection,
                                    onChanged: (newValue) {
                                      setState(() {
                                        mySelection = newValue;
                                      });
                                    },
                                    items: salutation
                                        .map(
                                          (value) => DropdownMenuItem(
                                              value: value, child: Text(value)),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                fontSize: 15.5,
                              ),
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
            
                    const SizedBox(
                      height: 20,
                    ),
            
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(
                            child: const TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),
                                labelText: 'Middle Name',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 15.5,
                                ),
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
                          Expanded(
                            child: const TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 15.5,
                                ),
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
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 15.5,
                          ),
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
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(8),
                      child: Text(
                        "Gender",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GFRadio(
                            size: 20,
                            activeBorderColor: Color(0xff2972ff),
                            value: 0,
                            groupValue: genderGroupValue,
                            onChanged: (value) {
                              setState(() {
                                genderGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 14.5,
                            ),
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
                            activeBorderColor: Color(0xff2972ff),
                            radioColor: Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 14.5,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          GFRadio(
                            size: 20,
                            activeBorderColor: Color(0xff2972ff),
                            value: 3,
                            groupValue: genderGroupValue,
                            onChanged: (value) {
                              setState(() {
                                genderGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Others",
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 14.5,
                            ),
                          ),
                        ],
                      ),
                    
                    ),
            
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Experience",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GFRadio(
                            size: 20,
                            activeBorderColor: Color(0xff2972ff),
                            value: 0,
                            groupValue: experienceGroupValue,
                            onChanged: (value) {
                              setState(() {
                                experienceGroupValue = value;
                              });
                            },
                            inactiveIcon: null,
                            radioColor: Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "Yes",
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 14.5,
                            ),
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
                            activeBorderColor: Color(0xff2972ff),
                            radioColor: Color(0xff2972ff),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            "No",
                            style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 14.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
            
                    experienceGroupValue == 0
                        ? Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Experience Tenure",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                fontSize: 15.5,
                              ),
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
                                    decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: GFDropdown(
                                        borderRadius: BorderRadius.horizontal(left: Radius.zero,right: Radius.zero),
                                        value: mySelectionYear,
                                        onChanged: (newValue) {
                                          setState(() {
                                            mySelectionYear = newValue;
                                          });
                                        },
                                        items: ["0", "1", "2", "3","4","5","6","7","8","9","10","11","12","13","14","15"]
                                            .map(
                                              (value) => DropdownMenuItem(
                                                  value: value, child: Text(value)),
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
                                     decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey)),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: GFDropdown(
                                        value: mySelectionMonth,
                                        onChanged: (newValue) {
                                          setState(() {
                                            mySelectionMonth = newValue;
                                          });
                                        },
                                        items: ["0", "1", "2", "3", "4", "5"]
                                            .map(
                                              (value) => DropdownMenuItem(
                                                  value: value, child: Text(value)),
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
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Job Category",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownSearch<String>(
                            dropdownSearchDecoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                            mode: Mode.DIALOG,
                            showSearchBox: true,
                            showSelectedItems: true,
                            items: jobCategoryList,
                            // label: "Menu mode",
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (item){
                              setState(() {
                                myjobCategory = item;
                              });
                            },
                            selectedItem: myjobCategory,),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Current Location",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<String>(
                          dropdownSearchDecoration: const InputDecoration(
                        ),
                          mode: Mode.DIALOG,
                          showSearchBox: true,
                          showSelectedItems: true,
                          items: locationList,
                          // label: "Menu mode",
                          popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged: (item){
                            setState(() {
                              myLocation = item;
                            });
                          },
                          selectedItem: myLocation,),
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
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QualificationBlueCollar(),),);
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
