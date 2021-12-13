import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_portal/Views/skills_and_eduction.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key key}) : super(key: key);

  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  int groupValue = 0;
  int salaryValue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Employment Details.",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 18.5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get personalized job recommendations based on your work"
                      "experience",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Are you currently employed ?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 15),
                    child: Row(
                      children: [
                        GFRadio(
                          size: 20,
                          activeBorderColor: GFColors.SUCCESS,
                          value: 0,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          inactiveIcon: null,
                          radioColor: GFColors.SUCCESS,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          "Yes",
                          style: TextStyle(
                            fontFamily: "Poppins",
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
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: GFColors.SUCCESS,
                          radioColor: GFColors.SUCCESS,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          "No",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),

                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 25),
                    child: Text(
                      "Total work experience *",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: TextField(
                              decoration: InputDecoration(hintText: "Eg: 2"),
                            ),
                          ),
                          // flex: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Years',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextField(
                            decoration:
                            InputDecoration(hintText: "Eg.6"),
                          ),
                          // flex: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Months',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Job Title',
                        hintText: 'Job Title',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Iconsax.setting,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Your Company Name',
                        hintText: 'Your Company Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Iconsax.setting,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 25),
                    child: Text(
                      "Work Duration *",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: TextField(
                              decoration: InputDecoration(hintText: "Worked from"),
                            ),
                          ),
                          // flex: 2,
                        ),

                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextField(
                            decoration:
                            InputDecoration(hintText: "Worked till"),
                          ),
                          // flex: 2,
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Are you currently employed ?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 15),
                    child: Row(
                      children: [
                        GFRadio(
                          size: 20,
                          activeBorderColor: GFColors.SUCCESS,
                          value: 0,
                          groupValue: salaryValue,
                          onChanged: (value) {
                            setState(() {
                              salaryValue = value;
                            });
                          },
                          inactiveIcon: null,
                          radioColor: GFColors.SUCCESS,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          "Rupee",
                          style: TextStyle(
                            fontFamily: "Poppins",
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
                          groupValue: salaryValue,
                          onChanged: (value) {
                            setState(() {
                              salaryValue = value;
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: GFColors.SUCCESS,
                          radioColor: GFColors.SUCCESS,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          "Dollar",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 30.0),
                            child: TextField(
                              decoration: InputDecoration(hintText: "Eg:200000"),
                            ),
                          ),
                          // flex: 2,
                        ),
                         Padding(
                           padding: EdgeInsets.only(top: 10),
                           child: Text("Per year",
                             style: TextStyle(
                             fontFamily: "OpenSans",
                             fontWeight: FontWeight.w500,
                             letterSpacing: 1.5,
                             fontSize: 17.5,
                           ),),
                         ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        // labelText: 'Job Title',
                        hintText: 'Industry Type',
                        // labelStyle: TextStyle(
                        //   color: Colors.black,
                        //   fontSize: 14.0,
                        //   fontWeight: FontWeight.w400,
                        // ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Iconsax.setting,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Availability to join *",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        // labelText: 'Job Title',
                        hintText: 'Experience',
                        // labelStyle: TextStyle(
                        //   color: Colors.black,
                        //   fontSize: 14.0,
                        //   fontWeight: FontWeight.w400,
                        // ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Iconsax.setting,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                              side: const BorderSide(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (
                                  context) => SkillsAndEducation()));
                            }, child: const Text("Next"))
                      ],
                    ),
                  ),
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
