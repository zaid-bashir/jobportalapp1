
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Views/SignIn/personaldetails.dart';
class CareerPreference extends StatefulWidget {
  const CareerPreference({Key key}) : super(key: key);

  @override
  _CareerPreferenceState createState() => _CareerPreferenceState();
}

class _CareerPreferenceState extends State<CareerPreference> {



  List<String> lists = [
    "TextTile Industry",
    "Automobile Industry",
    "IT Industry",
    "Aviation Industry",
  ];
  List<String> lists2 = [
    "Software Engineer",
    "Data Scientist",
    "Flutter Developer",
   "Content Writer"
    "Nurse"
  ];

  List<String> lists3 = [
    "Intern ", // job type
    "Full Time",
    "Part Time",
  ];



  List<String> lists4 = [
    "Temporary", // employ type
    "Household",
    "Freelance",
    "Permanent",
  ];
  List<String> lists5 = [
    "Srinagar",  // job location
    "Bangalore",
    "Mumbai",
    "Delhi"

  ];
  List<String> lists6 = [
   "First Shift",
    "Second Shift",
    "Night Shift",
    "Fixed Shift"

  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 20),
              child: Column(
                children:
                [
                  Row
                  (
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.arrow_back)),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Career Preferences',style: const TextStyle(color:Colors.black,fontSize: 20, fontWeight:FontWeight.bold,fontFamily: "ProximaNova")),
                  ],


                ),


                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Preferred Industry',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child:  Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:DropdownSearch<String>(
                                          dropdownSearchDecoration: const InputDecoration(
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          mode: Mode.DIALOG,
                                          showSelectedItems: true,
                                          showSearchBox: true,
                                          items: lists,
                                          // popupItemDisabled: (String s) => s.startsWith('I'),
                                          onChanged: print,
                                          hint:"Select Industry",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Preferred Job Role',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),



                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:DropdownSearch<String>(
                                          dropdownSearchDecoration: const InputDecoration(
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          mode: Mode.DIALOG,
                                          showSelectedItems: true,
                                          showSearchBox: true,
                                          items:lists2,
                                          // popupItemDisabled: (String s) => s.startsWith('I'),
                                          onChanged: print,
                                          hint: "Select Role",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Preferred Job Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child:  Padding(
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
                                          showSelectedItems: true,
                                          showSearchBox: true,
                                          items:lists3,
                                          // popupItemDisabled: (String s) => s.startsWith('I'),
                                          onChanged: print,
                                          hint: "Select Type",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Preferred Employment Type',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child:  Padding(
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
                                          showSelectedItems: true,
                                          showSearchBox: true,
                                          items:lists4,
                                          // popupItemDisabled: (String s) => s.startsWith('I'),
                                          onChanged: print,
                                          hint: "Select Employment",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Preferred Job Location',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child:   Padding(
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
                                          showSelectedItems: true,
                                          showSearchBox: true,
                                          items: lists5,
                                          // popupItemDisabled: (String s) => s.startsWith('I'),
                                          onChanged: print,
                                          hint: "Select Location",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 22.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Salary Expectation',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children:  <Widget>[
                                   Icon(Icons.attach_money),


                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Lakh"),
                                    ),

                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Thousand"),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Preferred Shift',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child:   Padding(
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
                                          showSelectedItems: true,
                                          showSearchBox: true,
                                          items: lists6,
                                          // popupItemDisabled: (String s) => s.startsWith('I'),
                                          onChanged: print,
                                          hint: "Select Shift",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 22.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Availibility to Join',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: const <Widget>[
                                  Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: ""),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),


 const SizedBox(height: 20,),
                  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GFButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PersonalDetails(),),);
                  },
                  text: "Next",
                  type: GFButtonType.solid,
                )),
          ),


                ],


              ),
            )
          ),




    )
    );
  }
}
