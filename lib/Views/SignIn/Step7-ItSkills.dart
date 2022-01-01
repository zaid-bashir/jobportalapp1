import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Services/ApiServices.dart';

import 'Step8-CareerPreference.dart';

class ItSkills extends StatefulWidget {
  const ItSkills({Key key}) : super(key: key);

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
  String myYear;
  String mySelection;
  String mySelection1;
  String mySelection2;


  List<String> lists = ["2015", "2016", "2017", "2018","2019","2020"];
  List<String> lists1 = ["2015", "2016", "2017", "2018","2019","2020"];
  List<String> lists2 = ["1", "2", "3","4","5","6","7","8","9","10","11","12"];
  // List list = [
  //   "Web Development",
  //   "Mobile App Development",
  //   "Full Stack Developer",
  //   "Back-end Developer"
  // ];

    static List<Skills> _skills = [
    Skills(id: 1, name: "Web Development"),
    Skills(id: 2, name: "Mobile App Development"),
    Skills(id: 3, name: "Full Stack Developer"),
    Skills(id: 4, name: "Back-end Developer"),
  ];





  bool isLoading = false;

  ApiServices apiServices = ApiServices();

  ApiResponse<List<PassingYear>> _apiResponse;
  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
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
                      DropdownSearch<String>(
                        dropdownSearchDecoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        mode: Mode.DIALOG,
                        showSelectedItems: true,
                        showSearchBox: true,
                        items: [
                          "Web Development",
                          "Mobile App Development",
                          "Back-end Developer",
                          "Full-Stack Developer"
                        ],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select Skills",
                        // selectedItem: "Indian"
                      ),
                          
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('Version',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),

                      TextField(
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
                        children:  [
                          Expanded(
                            child:TextField(
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
                            child:                TextField(
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
                      DropdownButtonFormField(
                        // disabledHint: ,
                        decoration:const InputDecoration(
                          border: UnderlineInputBorder(

                          )
                        ),
                        hint: Text("Select year"),
                        value: myYear,
                          onChanged: (newValue) {
                            setState(() {
                              myYear = newValue;
                            });
                          },
                          items: isLoading
                          ? ["Please Wait"]
                              .map(
                                (value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight:
                                      FontWeight.normal,
                                      fontFamily:
                                      "ProximaNova"),
                                )),
                          )
                              .toList()
                              : _apiResponse.data
                          .map(
                          (data) => DropdownMenuItem(
                  value: data.yearId,
                  child: Text(
                    "${data.yearName}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                        FontWeight.normal,
                        fontFamily:
                        "ProximaNova"),
                  ),
                ),
              )
                  .toList(),




                      ),


                    ],
                  ),
                ),
              ),

 const SizedBox(height: 20,),
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CareerPreference()));
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
    ));
  }
}
