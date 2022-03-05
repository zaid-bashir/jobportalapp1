import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Models/Language-Populate.dart';

import 'package:job_portal/Models/Languages.dart';
import 'package:job_portal/Models/LanguagesAdd.dart';
import 'package:job_portal/Models/Profiecency.dart';
import 'package:job_portal/Services/ApiServices.dart';

class LanguagesAdd extends StatefulWidget {
  LanguagesAdd({
    Key key,
    this.uuid,
  }) : super(key: key);
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
    getLanguages();
    super.initState();
  }

  bool isLoading = false;
  bool isLoadingLanguages = false;
  bool read = false;
  bool write = false;
  bool speak = false;

  String profId = "";

  String errorMessage;

  LanguagePopulate languagePopulate;

  getLanguages() {
    if (isEditing) {
      setState(() {
        isLoading = true;
      });
      apiServices.populateLanguageUpdate(widget.uuid).then((response) {
        setState(() {
          isLoading = false;
        });
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error Occurred";
        }
        languagePopulate = response.data;
        myController.text = languagePopulate.Languagename == ""
            ? languagePopulate.Language
            : languagePopulate.Languagename;
        myController2.text = languagePopulate.ProficiencyName;
        read = languagePopulate.Read == "1" ? true : false;
        write = languagePopulate.Write == "1" ? true : false;
        read = languagePopulate.Speak == "1" ? true : false;
        // myYear = "${itSkillProfile.candidateitskillLastused} " as PassingYear;
        // isActive = student.studentActive == '1' ? true : false;
      });
    }
  }

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

                const Text(
                  "Languages",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova"),
                ),
                Text(
                  "Add the languages you can speak and understand."
                  ,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
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
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: this.myController,
                                decoration: InputDecoration(
                                    hintText: 'Select Languages')),
                            debounceDuration: Duration(milliseconds: 500),
                            suggestionsCallback: ApiServices.getLanguages,
                            itemBuilder: (context, Languages suggestions) {
                              final skill = suggestions;
                              return ListTile(
                                title: Text(skill.languageName),
                              );
                            },
                            noItemsFoundBuilder: (context) => Text(""),
                            onSuggestionSelected: (Languages suggesstion) {
                              // final skill = suggesstion;
                              myController.text = suggesstion.languageName;
                            },
                          ),
                        ),



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
                                  hintText: 'Select Proficiency')),
                          debounceDuration: Duration(milliseconds: 500),
                          suggestionsCallback: ApiServices.getProficiency,
                          itemBuilder: (context, Proficiency suggestions) {
                            final skill = suggestions;
                            return ListTile(
                              title: Text(skill.proficiencyName),
                            );
                          },
                          noItemsFoundBuilder: (context) => Text(""),
                          onSuggestionSelected: (Proficiency suggesstion) {
                            // final skill = suggesstion;
                            myController2.text = suggesstion.proficiencyName;
                            profId = suggesstion.proficiencyId;
                          },
                        ),
                        CheckboxListTile(
                          value: read,
                          onChanged: (value) {
                            setState(() {
                              read = value;
                            });
                          },
                          title: Text("Read",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova")),
                          // contentPadding: EdgeInsets.symmetric(
                          //     horizontal: 20,
                          //     vertical: 10
                          // ),
                        ),
                        CheckboxListTile(
                          value: write,
                          onChanged: (value) {
                            setState(() {
                              write = value;
                            });
                          },
                          title: Text("Write",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova")),
                          // contentPadding: EdgeInsets.symmetric(
                          //     horizontal: 20,
                          //     vertical: 10
                          // ),
                        ),
                        CheckboxListTile(
                          value: speak,
                          onChanged: (value) {
                            setState(() {
                              speak = value;
                            });
                          },
                          title: Text("Speak",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova")),
                          // contentPadding: EdgeInsets.symmetric(
                          //     horizontal: 20,
                          //     vertical: 10
                          // ),
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
                    GFButton(
                      onPressed: () async{

                        setState(() {
                          isLoadingLanguages = true;
                        });
                        final insert = LanguagesAddModel(
                          requestType: "delete",
                          candidatelangUuid:
                          widget.uuid,
                        );

                        final result = await apiServices.languagesAdd(insert);
                        setState(() {
                          isLoadingLanguages = false;
                        });
                        if (result.data) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(children: const [
                              Icon(
                                Icons.done_outlined,
                              ),
                              SizedBox(width: 7),
                              Text("Successfully Deleted"),
                            ]),
                            backgroundColor: Colors.green,
                            duration: const Duration(milliseconds: 2500),
                          ));

                        }

                        else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                              children: const [
                                Icon(Icons.error),
                                SizedBox(width: 7),
                                Text("An Error Occured"),
                              ],
                            ),
                            backgroundColor: Colors.red,
                            duration: const Duration(milliseconds: 2500),
                          ));
                        }


                        Navigator.of(context).pop();
                      },
                      text: "Delete",
                      type: GFButtonType.solid,
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GFButton(

                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            if (isEditing) {
                              setState(() {
                                isLoading = true;
                              });
                              final insert = LanguagesAddModel(
                                  requestType: "update",
                                  candidatelangUuid: widget.uuid,
                                  candidatelangLanguagename: myController.text,
                                  candidatelangProficiencyId: profId,
                                  candidatelangRead: read == true ? 1 : 0,
                                  candidatelangWrite: write == true ? 1 : 0,
                                  candidatelangSpeak: speak == true ? 1 : 0);

                              final result =
                                  await apiServices.languagesAdd(insert);
                              setState(() {
                                isLoading = false;
                              });
                              if (result.data) {
                                Navigator.pop(context);
                              } else {
                                print("error");
                              }
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              final insert = LanguagesAddModel(
                                  requestType: "add",
                                  candidatelangLanguagename: myController.text,
                                  candidatelangProficiencyId: profId,
                                  candidatelangRead: read == true ? 1 : 0,
                                  candidatelangWrite: write == true ? 1 : 0,
                                  candidatelangSpeak: speak == true ? 1 : 0);

                              final result =
                                  await apiServices.languagesAdd(insert);
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
