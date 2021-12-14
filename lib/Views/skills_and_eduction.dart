import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:job_portal/Views/welcome_screen.dart';


class SkillsAndEducation extends StatefulWidget {
   SkillsAndEducation({Key key}) : super(key: key);

  bool isSelected = false;

  @override
  _SkillsAndEducationState createState() => _SkillsAndEducationState();
}

class _SkillsAndEducationState extends State<SkillsAndEducation> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      "Key skills",
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
                      "Recruiters look for candidates with specific key skills to hire for your roles.Add them here. ",
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

              const Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Skills',
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
              Padding(

                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Or select from below",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 15.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Suggested skills based on your employment ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                 FilterChip(
                   label: const Text('Application Programming'),
                   labelStyle: TextStyle(
                       color: widget.isSelected ? Colors.black : Colors.white),
                   selected: widget.isSelected,
                   onSelected: (bool selected) {
                     setState(() {
                       widget.isSelected = !widget.isSelected;
                     });
                   },
                   // selectedColor: Theme.of(context).accentColor,
                   checkmarkColor: Colors.black,
                 ),
                 const SizedBox(
                   width: 20,
                 ),
                 FilterChip(
                   label: const Text('Web Development'),
                   labelStyle: TextStyle(
                       color: widget.isSelected ? Colors.black : Colors.white),
                   selected: widget.isSelected,
                   onSelected: (bool selected) {
                     setState(() {
                       widget.isSelected = !widget.isSelected;
                     });
                   },
                   // selectedColor: Theme.of(context).accentColor,
                   checkmarkColor: Colors.black,
                 ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                 FilterChip(
                   label: Text('Android Development'),
                   labelStyle: TextStyle(
                       color: widget.isSelected ? Colors.black : Colors.white),
                   selected: widget.isSelected,
                   onSelected: (bool selected) {
                     setState(() {
                       widget.isSelected = !widget.isSelected;
                     });
                   },
                   // selectedColor: Theme.of(context).accentColor,
                   checkmarkColor: Colors.black,
                 ),
                 SizedBox(
                   width: 20,
                 ),
                 FilterChip(
                   label: Text('IOS Development'),
                   labelStyle: TextStyle(
                       color: widget.isSelected ? Colors.black : Colors.white),
                   selected: widget.isSelected,
                   onSelected: (bool selected) {
                     setState(() {
                       widget.isSelected = !widget.isSelected;
                     });
                   },
                   // selectedColor: Theme.of(context).accentColor,
                   checkmarkColor: Colors.black,
                 ),

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      "Education Details",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 18.5,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "We will help you find the right job opportunity based on the details ypu enter here",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 12.5,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Qualification',
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Highest Qualification *",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 15.5,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          FilterChip(

                            label: Text('Doctorate'),
                            labelStyle: TextStyle(
                                color: widget.isSelected ? Colors.black : Colors.white),
                            selected: widget.isSelected,
                            onSelected: (bool selected) {
                              setState(() {
                                widget.isSelected = !widget.isSelected;
                              });
                            },
                            // selectedColor: Theme.of(context).accentColor,
                            checkmarkColor: Colors.black,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          FilterChip(
                            label: const Text('Post Graduation'),
                            labelStyle: TextStyle(
                                color: widget.isSelected ? Colors.black : Colors.white),
                            selected: widget.isSelected,
                            onSelected: (bool selected) {
                              setState(() {
                                widget.isSelected = !widget.isSelected;
                              });
                            },
                            // selectedColor: Theme.of(context).accentColor,
                            checkmarkColor: Colors.black,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          FilterChip(
                            label: const Text('Phd'),
                            labelStyle: TextStyle(
                                color: widget.isSelected ? Colors.black : Colors.white),
                            selected: widget.isSelected,
                            onSelected: (bool selected) {
                              setState(() {
                                widget.isSelected = !widget.isSelected;
                              });
                            },
                            // selectedColor: Theme.of(context).accentColor,
                            checkmarkColor: Colors.black,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          FilterChip(
                            label: const Text(' Graduation'),
                            labelStyle: TextStyle(
                                color: widget.isSelected ? Colors.black : Colors.white),
                            selected: widget.isSelected,
                            onSelected: (bool selected) {
                              setState(() {
                                widget.isSelected = !widget.isSelected;
                              });
                            },
                            // selectedColor: Theme.of(context).accentColor,
                            checkmarkColor: Colors.black,
                          ),

                        ],
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
                                    context) => WelcomeScreen()));
                              }, child: const Text("Next",style:TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,

                            fontSize: 13.5,
                          ),))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
