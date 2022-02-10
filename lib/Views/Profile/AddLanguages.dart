import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/EmploymentType.dart';
import 'package:job_portal/Models/ItSkillAdd.dart';
import 'package:job_portal/Models/ItSkillRetrive.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/Languages.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Models/Profiecency.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step6-ItSkills.dart';
import 'package:textfield_search/textfield_search.dart';

class LanguagesAdd extends StatefulWidget {
  LanguagesAdd({Key key, this.uuid,  })
      : super(key: key);
  String uuid;

  @override
  _LanguagesAddState createState() => _LanguagesAddState();
}

class Skills {
  final int id;
  final String name;

  Skills({
    this.id,
    this.name,
  });
}

class _LanguagesAddState extends State<LanguagesAdd> {
  bool get isEditing => widget.uuid != null;


  // String mySelection;
  // String mySelection1;
  // String mySelection2;

  // String myskill;



  var formKey = GlobalKey<FormState>();

  TextEditingController myController = TextEditingController();
  TextEditingController myController2 = TextEditingController();

ApiServices apiServices = ApiServices();
  @override
  void initState() {

    super.initState();

  }


 bool  isLoading = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Languages",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                        ),
                      ],
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 10,
                          right: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Languages:',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova")),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child:        TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: this.myController,
                                    decoration: InputDecoration(
                                      hintText: 'Select Languages'
                                    )
                                ),
                                debounceDuration: Duration(milliseconds: 500),
                                suggestionsCallback: ApiServices.getLanguages ,
                                itemBuilder: (context, Languages suggestions){
                                  final skill = suggestions;
                                  return ListTile(
                                    title: Text(skill.languageName) ,
                                  );
                                },
                                noItemsFoundBuilder: (context)=>Text(""),

                                onSuggestionSelected: (Languages suggesstion){
                                  // final skill = suggesstion;
                                  myController.text = suggesstion.languageName;

                                },
                              ),
                            ),


                            // TextFieldSearch(
                            //     label: 'My Label',
                            //     controller: myController,
                            //     future: () {
                            //       return fetchITSkill(query: myController.text);
                            //     },
                            //     getSelectedValue: (value) {
                            //       print(
                            //           value); // this prints the selected option which could be an object
                            //     }),

                            const SizedBox(
                              height: 15,
                            ),
                            const Text('Proficiency:',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova")),
                            TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                  controller: this.myController2,
                                  decoration: InputDecoration(
                                     hintText: 'Select Proficiency'
                                  )
                              ),
                              debounceDuration: Duration(milliseconds: 500),
                              suggestionsCallback: ApiServices.getProficiency ,
                              itemBuilder: (context, Proficiency suggestions){
                                final skill = suggestions;
                                return ListTile(
                                  title: Text(skill.proficiencyName) ,
                                );
                              },
                              noItemsFoundBuilder: (context)=>Text(""),

                              onSuggestionSelected: (Proficiency suggesstion){
                                // final skill = suggesstion;
                                myController2.text = suggesstion.proficiencyName;

                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // GFButton(
                        //   onPressed: ()  async {
                        //     setState(() {
                        //       isLoading = true;
                        //     });
                        //     final insert = ItSkillAdd(
                        //       requestType: "delete",
                        //       candidateitskillUuid: widget.uuid,
                        //     );
                        //     print(itSkillId);
                        //     print(itSkillId);
                        //     final result =
                        //     await apiServices.itSkillDelete(insert);
                        //     setState(() {
                        //       isLoading = false;
                        //     });
                        //     if (result.data) {
                        //       Navigator.pop(context);
                        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //         content: Row(children: const [
                        //           Icon(
                        //             Icons.done_outlined,
                        //           ),
                        //           SizedBox(width: 7),
                        //           Text("Successfully Deleted"),
                        //         ]),
                        //         backgroundColor: Colors.green,
                        //         duration: const Duration(milliseconds: 2500),
                        //       ));
                        //
                        //     } else {
                        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //         content: Row(
                        //           children: const [
                        //             Icon(Icons.error),
                        //             SizedBox(width: 7),
                        //             Text("An Error Occured"),
                        //           ],
                        //         ),
                        //         backgroundColor: Colors.red,
                        //         duration: const Duration(milliseconds: 2500),
                        //       ));
                        //     }
                        //   },
                        //   text: isEditing?"Delete":"Cancel",
                        //   type: GFButtonType.solid,
                        // ),
                        SizedBox(
                          width: 10,
                        ),
                        GFButton(
                          // onPressed: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => CareerPreference()));
                          // },
                          onPressed: () async {
                            if (formKey.currentState.validate()) {

                              if (isEditing) {
                               print("OHHHHH YEAHHHH");
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                final insert = ItSkillAdd(

                                );

                                final result = await apiServices.itSkillAdd(insert);
                                setState(() {
                                  isLoading = false;
                                });
                                if (result.data) {
                                  Navigator.pop(context);
                                } else {
                                  print("error");
                                }
                              }

                              // const title = "Done";
                              // final text = result.error
                              //     ? (result.errorMessage ?? "An Error Occurred")
                              //     : "Successfully Created";
                              // showDialog(
                              //   context: context,
                              //   builder: (_) => AlertDialog(
                              //     title: const Text(title),
                              //     content: Text(text),
                              //     actions: [
                              //       ElevatedButton(
                              //           onPressed: () {
                              //             Navigator.pop(context);
                              //           },
                              //           child: const Text("OK"))
                              //     ],
                              //   ),
                              // ).then((data) {
                              //   if (result.data) {
                              //     Navigator.of(context).pop();
                              //
                              //   }
                              // });
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             CareerPreference(uuid: widget.uuid,)));
                            // Navigator.of(context).pop();
                          },
                          text: isEditing ? "Update" : "Save",
                          type: GFButtonType.solid,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
