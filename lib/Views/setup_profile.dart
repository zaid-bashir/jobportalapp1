import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
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
                        icon: const Icon(Icons.arrow_back)),
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
                        fontFamily: "ProximaNova",
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
              const SizedBox(
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
                        fontFamily: "ProximaNova",
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
                          activeBorderColor:const Color(0xff2972ff),
                          value: 0,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          inactiveIcon: null,
                          radioColor:const Color(0xff2972ff),
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
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor:const Color(0xff2972ff),
                          radioColor: const Color(0xff2972ff),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20,top: 25),
                    child: Text(
                      "Total work experience *",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
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
                              decoration: InputDecoration(hintText: "Eg: 2",hintStyle:  TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                fontSize: 15.5,
                              ),),
                            ),
                          ),
                          // flex: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Years',
                            style: TextStyle(
                              fontFamily: "ProximaNova",
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
                            InputDecoration(hintText: "Eg.6",

                            hintStyle:  TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 15.5,
                            ),),
                          ),
                          // flex: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Months',
                            style: TextStyle(
                              fontFamily: "ProximaNova",
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child:  TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Job-Title',
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
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Company-Name',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.5,
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Color(0xff2972ff),
                          fontFamily: "Poppins",
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
                            child:  TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                labelText: 'Worked From',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 15.5,
                                ),
                                floatingLabelStyle: TextStyle(
                                  color: Color(0xff2972ff),
                                  fontFamily: "Poppins",
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
                          // flex: 2,
                        ),

                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child:  TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              labelText: 'Worked Till',
                              labelStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                fontSize: 15.5,
                              ),
                              floatingLabelStyle: TextStyle(
                                color: Color(0xff2972ff),
                                fontFamily: "Poppins",
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
                          // flex: 2,
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child:  TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Industry-Type',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.5,
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Color(0xff2972ff),
                          fontFamily: "Poppins",
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
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Availability to join",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child:  TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Availability to join',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.5,
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Color(0xff2972ff),
                          fontFamily: "Poppins",
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
                  Padding(
                    padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       GFButton(
                           color: const Color(0xff2972ff),
                           onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (
                                  context) => SkillsAndEducation()));
                            }, child: const Text("Next",style:TextStyle(
                         fontFamily: "Poppins",
                         fontWeight: FontWeight.bold,
                         // letterSpacing: 1.5,
                         fontSize: 13.5,
                       ),))
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
