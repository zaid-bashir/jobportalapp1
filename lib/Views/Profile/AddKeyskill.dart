// ignore_for_file: must_be_immutable, unused_field, non_constant_identifier_names, avoid_print, prefer_const_constructors
// ignore_for_file: must_be_immutable, unused_field, non_constant_identifier_names, avoid_print, prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/KeySkillAddProfile.dart';
import 'package:job_portal/Models/KeySkillProfilePopulate.dart';
import 'package:job_portal/Models/keyskill.dart';
import 'package:job_portal/Models/postkeyskills.dart';
import 'package:job_portal/Services/ApiServices.dart';


class AddSkillsPage extends StatefulWidget {
  AddSkillsPage({Key key, this.uuid}) : super(key: key);

  // ignore: unused_import
  String uuid;

  @override
  _AddSkillsPageState createState() => _AddSkillsPageState();
}

class _AddSkillsPageState extends State<AddSkillsPage> {
  var formKey = GlobalKey<FormState>();
  List<KeySkills> selectedSkills = [];
  bool isSelected = false;
  bool isLoading = false;
  bool isLoadingPost = false;
  bool isLoadingPopulateKeySkillsProfile = false;
  ApiResponse<List<KeySkills>> _apiResponse;
  ApiResponse<List<PostKeySkills>> _apiResponsePostKeySkills;
  ApiResponse<List<PopulateKeySkillsProfileModel>> _apiResponseKeySkillPopulate;
  var jobCategorySearchCon = TextEditingController();
  String SkillId = "0";
  String query = "";
  ApiServices apiServices = ApiServices();

  fetchCompany({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getSkills(query: query);
    setState(() {
      isLoading = false;
    });
  }

  List<KeySkillAddProfile> createPostList() {
    List<KeySkillAddProfile> postItems = [];
    for (var i = 0; i < selectedSkills.length; i++) {
      var obj = KeySkillAddProfile(
          requestType: "add",
          candidatekeyskillName : selectedSkills[i].keyskillName);
      postItems.add(obj);
      print(obj.candidatekeyskillName);
      print(obj.requestType);
    }
    return postItems;
  }

  populateKeySkills() async {
    setState(() {
      isLoadingPopulateKeySkillsProfile = true;
    });
    _apiResponseKeySkillPopulate = await apiServices.getKeySkillsProfile();
    setState(() {
      isLoadingPopulateKeySkillsProfile = false;
    });
  }



  @override
  void initState() {
    fetchCompany(query: "");
    populateKeySkills();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Edit Key Skills',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova"),
                ),
                Text(
                  "Add skills for recruiters to find you easily in keywords search.",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                  ),
                ),


                Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
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
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Key Skills',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontFamily: "ProximaNova",
                                                    fontWeight:
                                                    FontWeight.bold),
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
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: DropdownSearch<
                                                  KeySkills>.multiSelection(
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return "Please Select Key Skill/Skills";
                                                  }
                                                  return null;
                                                },
                                                mode: Mode.DIALOG,
                                                items: isLoading
                                                    ? [KeySkills()]
                                                    : _apiResponse.data,
                                                itemAsString: (KeySkills obj) {
                                                  return obj.keyskillName;
                                                },
                                                onChanged: (val) {
                                                  setState(() {
                                                    isSelected = true;
                                                    selectedSkills = val;
                                                  });
                                                },
                                                onFind: (val) async {
                                                  setState(() {
                                                    query = val;
                                                  });
                                                  fetchCompany(query: query);
                                                  return _apiResponse.data;
                                                },
                                                // ignore: deprecated_member_use
                                                hint: "Select Key Skills",
                                                showSearchBox: true,
                                                popupItemBuilder: (context,
                                                    KeySkills item,
                                                    bool isSelected) {
                                                  return Container(
                                                    margin:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.all(8.0),
                                                      child: Text(
                                                          item.keyskillName),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
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
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              apiServices
                                  .keySkillAddProfile(lst: createPostList());
                            });
                            SnackBar(content: Container(
                              decoration : BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text("Key Skills Added Successfully..."),
                            ));
                            Navigator.of(context).pop();
                            populateKeySkills();
                          } else {
                          }
                        },
                        text: "Save",
                        type: GFButtonType.solid,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
