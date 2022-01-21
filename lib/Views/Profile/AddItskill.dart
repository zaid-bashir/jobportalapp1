import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/ItSkillAdd.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/ItSkillsPost.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step7-CareerPreference.dart';

class ItSkillAdds extends StatefulWidget {
  ItSkillAdds({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _ItSkillAddsState createState() => _ItSkillAddsState();
}

class Skills {
  final int id;
  final String name;

  Skills({
    this.id,
    this.name,
  });
}

class _ItSkillAddsState extends State<ItSkillAdds> {
  PassingYear myYear;
  String mySelection;
  String mySelection1;
  String mySelection2;

  String myskill;
  String queries;
  ApiResponse<List<ITSkill>> _apiResponseITSkill;
  String itSkillId = "";

  var formKey = GlobalKey<FormState>();

  TextEditingController skillSearchCont = TextEditingController();

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
                        Text('IT Skills:',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: DropdownSearch<ITSkill>(
                            // validator: (value) {
                            //   if (value == null) {
                            //     return "Please Select Your Skill";
                            //   }
                            //   return null;
                            // },
                            dropdownSearchDecoration:
                                InputDecoration(border: UnderlineInputBorder()),
                            mode: Mode.DIALOG,
                            items: isLoading
                                ? parseITSkill()
                                : _apiResponseITSkill.data,
                            itemAsString: (ITSkill obj) {
                              return obj.itskillName;
                            },
                            onFind: (val) async {
                              setState(() {
                                queries = val;
                              });
                              return _apiResponseITSkill.data;
                            },
                            hint: "Select Skill",
                            onChanged: (value) {
                              skillSearchCont.text = value.itskillId.toString();
                              itSkillId = value.itskillId;
                              print(value.itskillId);
                            },
                            showSearchBox: true,
                            popupItemBuilder:
                                (context, ITSkill item, bool isSelected) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(item.itskillName),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Version:',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                        TextFormField(
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return "Please Enter Version";
                          //   } else {
                          //     return null;
                          //   }
                          // },
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
                        Text('Experience:',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return "Please Enter Year";
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                controller: yearsCont,
                                decoration: InputDecoration(
                                  hintText: "Enter Year",
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
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return "Please Enter Month";
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                controller: monthCont,
                                decoration: InputDecoration(
                                  hintText: "Enter Month",
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
                        const Text('Last Used:',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownButtonFormField<PassingYear>(
                          hint: Text(
                            "Last Year",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova"),
                          ),
                          value: myYear,
                          onChanged: (PassingYear newValue) {
                            setState(() {
                              myYear = newValue;
                            });
                          },
                          // validator: (value) =>
                          // value == null ? 'Please fill Last Year' : null,
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
                        //     value == null ? 'Please fill year' : null,
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
                        //       ? ["Please Wait"]
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: "Cancel",
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
                          print(totalworkexp);
                          print(itSkillId);
                          print(itSkillId);
                          print(itSkillId);
                          print(itSkillId);

                          setState(() {
                            isLoading = true;
                          });
                          final insert = ItSkillAdd(
                              requestType:"add",
                            skillId: int.parse(itSkillId),
                            candidateId: 1,
                            candidateitskillVersion:
                                int.parse(versionCont.text),
                            candidateitskillLastused: int.parse(myYear.yearId),
                            candidateitskillExperience: totalworkexp,

                          );
                          print(itSkillId);
                          print(itSkillId);
                          final result = await apiServices.itSkillAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if(result.data){
                            Navigator.pop(context);
                          }
                          else{
                            print("error");
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
                      text: "Save",
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
