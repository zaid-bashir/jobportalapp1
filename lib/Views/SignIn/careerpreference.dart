
import 'package:date_field/date_field.dart';
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

  DateTime selectedDate;
  int groupValue = 1;
  int groupValue2 = 1;
  YearPicker selectedDate2;

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
                                          hint: "Select Industry",
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
                                    left: 20.0, right: 25.0, top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Text(
                                          'Availability to Join',
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
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GFRadio(
                                      size: 20,
                                      activeBorderColor: const Color(0xff3e61ed),
                                      value: 0,
                                      groupValue: groupValue2,
                                      onChanged: (value) {
                                        setState(() {
                                          groupValue2 = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      radioColor: const Color(0xff3e61ed),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Text(
                                    "Immediate",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GFRadio(
                                      size: 20,
                                      value: 1,
                                      groupValue: groupValue2,
                                      onChanged: (value) {
                                        setState(() {
                                          groupValue2 = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      activeBorderColor: const Color(0xff3e61ed),
                                      radioColor: const Color(0xff3e61ed),
                                    ),
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
                            groupValue2 == 1 ?  Padding(
                              padding: const EdgeInsets.only( left: 22.0, right: 25.0, top: 20.0 ),
                              child: DateTimeFormField(
                                decoration: const InputDecoration(
                                  border: const UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: 'Joining Date',
                                  // hintStyle: heading6.copyWith(color: textGrey),
                                  // errorStyle: TextStyle(color: Colors.redAccent),
                                  suffixIcon: Icon(Icons.event_note),
                                ),
                                // initialValue: date,
                                mode: DateTimeFieldPickerMode.date,
                                autovalidateMode: AutovalidateMode.always,
                                validator: (e) =>
                                (e?.day ?? 0) == 1
                                    ? 'Please not the first day'
                                    : null,

                                onDateSelected: (date) {
                                  setState(() {
                                    selectedDate = date;
                                  });
                                },
                              ),
                            ): Container(),



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
