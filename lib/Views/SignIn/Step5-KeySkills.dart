

// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/KeySkill.dart';
import 'package:job_portal/Models/PostkeySkills.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step6-ItSkills.dart';

class KeySkillsPage extends StatefulWidget {
   KeySkillsPage({Key key,this.uuid}) : super(key: key);
  String uuid;
  @override
  _KeySkillsPageState createState() => _KeySkillsPageState();
}

class _KeySkillsPageState extends State<KeySkillsPage> {
  var formKey = GlobalKey<FormState>();
  List<KeySkills> selectedSkills = [];
  bool isSelected = false;
  bool isLoading = false;
  ApiServices apiServices = ApiServices();
  ApiResponse<List<KeySkills>> _apiResponse;

  bool isLoadingPost = false;
  ApiResponse<List<PostKeySkills>> _apiResponsePostKeySkills;

  var jobCategorySearchCon = TextEditingController();
  String SkillId = "0";
  String query = "";

  fetchCompany({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getSkills(query: query);
    setState(() {
      isLoading = false;
    });
  }

  List<PostKeySkills> createPostList() {
    List<PostKeySkills> postItems = [];
    for (var i = 0; i < selectedSkills.length; i++) {
      var obj = PostKeySkills(
          candidateUuid: widget.uuid,
          candidatekeyskilKeyskillId: int.parse(selectedSkills[i].keyskillId));
      postItems.add(obj);
      print(obj.candidatekeyskilKeyskillId);
      print(obj.candidateUuid);
    }
    return postItems;
  }

  @override
  void initState() {
    fetchCompany(query: "");
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
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Key Skills',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            child: Padding(
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
                                                  autoValidateMode:
                                                  AutovalidateMode
                                                      .onUserInteraction,
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
                                                  itemAsString:
                                                      (KeySkills obj) {
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
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: GFButton(
                        onPressed: () {
                          bool check = false;
                          if (formKey.currentState.validate()) {
                            apiServices.postSkills(createPostList()).then((value){
                              check = value.data;
                            });
                            if (!check) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>  ItSkills(uuid: widget.uuid,),
                                ),
                              );
                            } else {

                            }
                          } else {}
                        },
                        text: "Next",
                        type: GFButtonType.solid,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
