import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/ItSkillsPost.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Services/ApiServices.dart';

import 'Step7-CareerPreference.dart';
import 'Step8-PersonalDetails.dart';

class ItSkills extends StatefulWidget {
  ItSkills({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _ItSkillsState createState() => _ItSkillsState();
}

class Skills {
  final int id;
  final String name;

  Skills({
    this.id,
    this.name,
  });
}

class _ItSkillsState extends State<ItSkills> {
  PassingYear myYear;
  String mySelection;
  String mySelection1;
  String mySelection2;

  String myskill;
  String queries;
  ApiResponse<List<ITSkill>> _apiResponseITSkill;
  String itSkillName = "";

  var formKey = GlobalKey<FormState>();
  String mySelectionYear;
  String mySelectionMonth;


  fetchITSkill({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseITSkill = await apiServices.getITSkill(query: query);
    setState(() {
      isLoading = false;
    });
  }


  List<String> parseITSkill() {
    List<ITSkill> itskill = _apiResponseITSkill.data;
    List<String> dataItems = [];
    for (int i = 0; i < itskill.length; i++) {
      dataItems.add(itskill[i].itskillName);
    }
    return dataItems;
  }

  bool isLoading = false;

  ApiServices apiServices = ApiServices();

  ApiResponse<List<PassingYear>> _apiResponse;

  @override
  void initState() {
    super.initState();
    fetchITSkill(query: "");
    fetchYear();
  }

  fetchYear() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getPassingYear();
    setState(() {
      isLoading = false;
    });
  }
  TextEditingController skillSearchCont = TextEditingController();
  TextEditingController myController = TextEditingController();
  TextEditingController yearsCont = TextEditingController();
  TextEditingController monthCont = TextEditingController();
  TextEditingController versionCont = TextEditingController();
  cleartext(){
    skillSearchCont.clear();
    myController.clear();
    yearsCont.clear();
    monthCont.clear();
    versionCont.clear();
    myYear.yearName == "";
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
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "IT Skills",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                    Text(
                      "Add the technical skills that you have learent and experiances",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "ProximaNova",
                        color: Colors.grey,
                      ),
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
                            Text('IT Skills',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova")),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TypeAheadFormField(
                                validator:(input){
                                  if(input.isEmpty){
                                    return  "Select IT Skill";
                                  }else{
                                    return null;
                                  }
                                },
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: this.myController,
                                    decoration: InputDecoration(
                                       hintText: 'Skill'
                                    )
                                ),
                                debounceDuration: Duration(milliseconds: 500),
                                suggestionsCallback: Service.getITSkill,
                                itemBuilder: (context, ITSkill suggestions) {
                                  final skill = suggestions;
                                  return ListTile(
                                    title: Text(skill.itskillName),
                                  );
                                },
                                noItemsFoundBuilder: (context) => Text(""),

                                onSuggestionSelected: (ITSkill suggesstion) {
                                  // final skill = suggesstion;
                                  myController.text = suggesstion.itskillName;
                                },
                              ),
                              // FindDropdown(
                              //   searchBoxDecoration: const InputDecoration(
                              //     border: UnderlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Colors.grey,
                              //       ),
                              //     ),
                              //   ),
                              //   items: parseITSkill(),
                              //   searchHint: "Skill Name",
                              //   onFind: (val) async {
                              //     setState(() {
                              //       queries = val;
                              //     });
                              //     await fetchITSkill(query: queries);
                              //     parseITSkill();
                              //     return [""];
                              //   },
                              //   onChanged: (item) {
                              //     setState(() {
                              //       myskill = item;
                              //     });
                              //   },
                              // ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('Version',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova")),
                            TextFormField(
                              maxLength: 3,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp("[0-9+.]"))
                              ],
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return " Enter Version";
                                } else {
                                  return null;
                                }
                              },
                              controller: versionCont,
                              decoration: InputDecoration(
                                hintText: "Version",
                                hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 14.5,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text('Experience',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova")),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: DropdownButtonFormField<String>(


                                        hint: Text("Years"),
                                        value: mySelectionYear,
                                        onChanged: (newValue) {
                                          setState(() {
                                            mySelectionYear = newValue;
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Select Year'
                                            : null,
                                        items: [
                                          "0",
                                          "1",
                                          "2",
                                          "3",
                                          "4",
                                          "5",
                                          "6",
                                          "7",
                                          "8",
                                          "9",
                                          "10",
                                          "11",
                                          "12"
                                        ]
                                            .map(
                                              (value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    "ProximaNova"),
                                              )),
                                        )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: DropdownButtonFormField<String>(


                                        hint: Text("Months"),
                                        value: mySelectionMonth,
                                        onChanged: (newValue) {
                                          setState(() {
                                            mySelectionMonth = newValue;
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'Select Month'
                                            : null,
                                        items: [
                                          "0",
                                          "1",
                                          "2",
                                          "3",
                                          "4",
                                          "5",
                                          "6",
                                          "7",
                                          "8",
                                          "9",
                                          "10",
                                          "11",
                                          "12"
                                        ]
                                            .map(
                                              (value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    "ProximaNova"),
                                              )),
                                        )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Last Used',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova")),
                            const SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField<PassingYear>(

                              hint: Text("Last Year", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova"),),
                              value: myYear,
                              onChanged: (PassingYear newValue) {
                                setState(() {
                                  myYear = newValue;
                                });
                              },
                              validator: (value) =>
                              value == null ? 'Select Last Year' : null,
                              items: _apiResponse.data.map((PassingYear user) {
                                return DropdownMenuItem<PassingYear>(
                                  value: user,
                                  child: Text(
                                    user.yearName,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
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
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) =>
                                    PersonalDetails(uuid: widget.uuid,)), (
                                    route) => false);
                          },
                          text: "Skip",
                          type: GFButtonType.solid,
                        ),
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

                               int totalworkexp = (int.parse(mySelectionYear) * 12) + int.parse(mySelectionMonth);


                              // print("UuId" + widget.uuid);
                              // print("Skill ID "+ int.parse(itSkillName).toString());
                              // print("Version "+double.parse(versionCont.text).toString());
                              // print("WorkExperience "+ totalworkexp.toString());
                              // print("Year ID "+int.parse(myYear.yearId).toString());
                              setState(() {
                                isLoading = true;
                              });
                              final insert = PostItSkills(
                                // candidateUuid: widget.uuid,
                                  candidateitskillName: myController.text,
                                  candidateitskillVersion: double.parse(
                                      versionCont.text),
                                  candidateitskillExperience: totalworkexp,
                                  candidateitskillLastused: int.parse(
                                      myYear.yearId));
                              final result = await apiServices.ItSkillsPost(
                                  insert);
                              setState(() {
                                isLoading = false;
                              });
                              const title = "Done";
                              final text = result.error
                                  ? (result.errorMessage ?? "An Error Occurred")
                                  : "Successfully Created";
                              if (result.data){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Row(children: const [
                                    Icon(
                                      Icons.done_outlined,
                                    ),
                                    SizedBox(width: 7),
                                    Text("Successfully Added"),
                                  ]),
                                  backgroundColor: Colors.green,
                                  duration: const Duration(milliseconds: 2500),
                                ));
                                setState(() {
                                  cleartext();
                                });
                              }else{
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
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 CareerPreference(uuid: widget.uuid,)));
                              //   }
                              // });
                            }
                            // Navigator.push(
                            //            context,
                            //             MaterialPageRoute(
                            //                 builder: (context) =>
                            //                     PersonalDetails(uuid: widget.uuid,)));


                          },
                          text: "Add",
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
