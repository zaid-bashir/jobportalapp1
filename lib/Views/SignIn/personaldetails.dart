import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:date_field/date_field.dart';
import 'package:getwidget/components/radio/gf_radio.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key key}) : super(key: key);

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  DateTime selectedDate;
  int groupValue = 1;
  int groupValue2 = 1;
 YearPicker selectedDate2;

  List lists = [
    "delhi",
    "mumbai",
    "chennai",
    "kashmir"
  ];
  List list = [
    "Srinagar",
    "Pulwama",
    "Budgam",
    "Ganderbal"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 20, bottom: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 10,),
                  const Text("Personal Details", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova"
                  ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: ExactAssetImage('assets/as.png'),
                            fit: BoxFit.cover,
                          ),
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
                              // _showPicker(context);
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

              Card(

                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10,
                            bottom: 10,
                            right: 25),
                        child: Text(
                          "Permanent Address",
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 18.5,
                          ),
                        ),
                      ),
                      Text('Address',
                          style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),

                      ),


                      const SizedBox(height: 15,),
                      const Text('City',
                          style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),
                      const SizedBox(
                        height: 8,
                      ),
                      DropdownSearch<String>(
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
                        items: ["Srinagar",
                          "Pulwama",
                          "Budgam",
                          "Ganderbal"],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select City",
                      ),
                      const SizedBox(height: 15,),
                      Text('Pin Code',
                          style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Pin Code",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),

                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('State',
                          style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownSearch<String>(
                        dropdownSearchDecoration: const InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        mode: Mode.DIALOG,
                        showSelectedItems: true,
                        showSearchBox: true,
                        items: ["delhi",
                          "mumbai",
                          "chennai",
                          "kashmir"],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select State",
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, right: 25),
                        child: Text(
                            "Date of birth",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      DateTimeFormField(
                        decoration: const InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'D.O.B',
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
                      const Padding(
                        padding: EdgeInsets.only(top: 15, right: 25),
                        child: Text(
                            "Marital Status",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownSearch<String>(
                        dropdownSearchDecoration: const InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        mode: Mode.DIALOG,
                        showSelectedItems: true,
                        showSearchBox: true,
                        items: ["Married",
                          "Unmarried",
                          "Separated",
                          "Divorced",
                          "Widowed"],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select Marital Status",
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, right: 25),
                        child: Text(
                            "Category",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownSearch<String>(
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
                        items: ["OM",
                          "SC",
                          "ST",
                          "RBC",
                          "OBC"],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select Category",
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15,),
                        child: Text(
                            "Disability",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            GFRadio(
                              size: 20,
                              activeBorderColor: const Color(0xff3e61ed),
                              value: 0,
                              groupValue: groupValue,
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: const Color(0xff3e61ed),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              "Yes",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GFRadio(
                              size: 20,
                              value: 1,
                              groupValue: groupValue,
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value;
                                });
                              },
                              inactiveIcon: null,
                              activeBorderColor: const Color(0xff3e61ed),
                              radioColor: const Color(0xff3e61ed),
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
                      groupValue == 0 ? Padding(
                        padding: EdgeInsets.only(top: 15,),
                        child: Text(
                            "Disability Type",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ) : Container(),
                      groupValue == 0 ? SizedBox(
                        height: 5,
                      ) : Container(),
                      groupValue == 0 ? TextField(
                        decoration: InputDecoration(
                          hintText: "Disability Type",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),
                      ) : Container(),
                      groupValue == 0 ? Padding(
                        padding: EdgeInsets.only(top: 15,),
                        child: Text(
                            "Is Assistance Required",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ) : Container(),
                      groupValue == 0 ? SizedBox(
                        height: 5,
                      ) : Container(),
                      groupValue == 0 ? TextField(
                        decoration: InputDecoration(
                          hintText: "Is Assistance Required",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),
                      ) : Container(),
                      Padding(
                        padding: EdgeInsets.only(top: 15,),
                        child: Text(
                            "PAN Number",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "PAN Number",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text('Nationality',
                          style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),
                      const SizedBox(
                        height: 8,
                      ),
                      DropdownSearch<String>(
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
                        items: ["Indian",
                          "Chinies",
                          "Indonasian",
                          "Austrailia"],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select Nationality",
                        // selectedItem: "Indian"
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 15,),
                        child: Text(
                            "Passport Number",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Passport Number",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15,),
                        child: Text(
                            "Work Permits",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            GFRadio(
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
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              "Yes",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GFRadio(
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
                      groupValue2 == 0 ? DropdownSearch<String>(
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
                        items: ["US",
                          "China",
                          "Australia",
                          "England"],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select Country",
                      ) : Container(),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
