
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/ItSkillsPost.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Services/ApiServices.dart';

import 'Step7-CareerPreference.dart';

class ItSkills extends StatefulWidget {
   ItSkills({Key key,this.uuid}) : super(key: key);
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

  TextEditingController skillSearchCont = TextEditingController();
  TextEditingController myController = TextEditingController();

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

  TextEditingController yearsCont = TextEditingController();
  TextEditingController monthCont = TextEditingController();
  TextEditingController versionCont = TextEditingController();

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
                      "IT Skills",
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
                        Text('IT Skills',
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
                                    labelText: 'Skill'
                                )
                            ),
                            debounceDuration: Duration(milliseconds: 500),
                            suggestionsCallback: Service.getITSkill ,
                            itemBuilder: (context, ITSkill suggestions){
                              final skill = suggestions;
                              return ListTile(
                                title: Text(skill.itskillName) ,
                              );
                            },
                            noItemsFoundBuilder: (context)=>Text(""),

                            onSuggestionSelected: (ITSkill suggesstion){
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
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " Enter Year";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: yearsCont,
                                decoration: InputDecoration(
                                  hintText: "Type Year",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " Enter Month";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: monthCont,
                                decoration: InputDecoration(
                                  hintText: "Type Month",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.5,
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

                          hint: Text("Last Year",style: TextStyle(
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
                          value == null ? ' fill Last Year' : null,
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
                        // DropdownButtonFormField(
                        //     validator: (value) =>
                        //     value == null ? ' fill year' : null,
                        //   decoration: const InputDecoration(
                        //       border: UnderlineInputBorder()),
                        //   hint: Text("Select year"),
                        //   value: myYear,
                        //   onChanged: (newValue) {
                        //     setState(() {
                        //       myYear = newValue;
                        //     });
                        //   },
                        //   items: isLoading
                        //       ? [" Wait"]
                        //           .map(
                        //             (value) => DropdownMenuItem(
                        //                 value: value,
                        //                 child: Text(
                        //                   value,
                        //                   style: TextStyle(
                        //                       fontSize: 15,
                        //                       fontWeight: FontWeight.normal,
                        //                       fontFamily: "ProximaNova"),
                        //                 )),
                        //           )
                        //           .toList()
                        //       : _apiResponse.data
                        //           .map(
                        //             (data) => DropdownMenuItem(
                        //               value: data.yearId,
                        //               child: Text(
                        //                 "${data.yearName}",
                        //                 style: TextStyle(
                        //                     fontSize: 15,
                        //                     fontWeight: FontWeight.normal,
                        //                     fontFamily: "ProximaNova"),
                        //               ),
                        //             ),
                        //           )
                        //           .toList(),
                        // ),
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
                      onPressed: () {},
                      text: "Add",
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
                          int totalworkexp = (int.parse(yearsCont.text) * 12) +
                              int.parse(monthCont.text);
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
                              candidateitskillVersion: int.parse(versionCont.text),
                              candidateitskillExperience: totalworkexp,
                              candidateitskillLastused: int.parse(myYear.yearId));
                          final result = await apiServices.ItSkillsPost(insert);
                          setState(() {
                            isLoading = false;
                          });
                          const title = "Done";
                          final text = result.error
                              ? (result.errorMessage ?? "An Error Occurred")
                              : "Successfully Created";
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
                        Navigator.push(
                                   context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CareerPreference(uuid: widget.uuid,)));
                      },
                      text: "Next",
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
