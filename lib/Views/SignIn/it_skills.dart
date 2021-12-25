import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:date_field/date_field.dart';
import 'package:getwidget/components/radio/gf_radio.dart';

class ItSkills extends StatefulWidget {
  const ItSkills({Key key}) : super(key: key);

  @override
  _ItSkillsState createState() => _ItSkillsState();
}

class _ItSkillsState extends State<ItSkills> {

  String mySelection;
  String mySelection1;
  String mySelection2;


  List<String> lists = ["2015", "2016", "2017", "2018","2019","2020"];
  List<String> lists1 = ["2015", "2016", "2017", "2018","2019","2020"];
  List<String> lists2 = ["1", "2", "3","4","5","6","7","8","9","10","11","12"];
  List list = [
    "Web Development",
    "Mobile App Development",
    "Full Stack Developer",
    "Back-end Developer"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
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
                    "Additional Details",
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
                    top: 10,
                    bottom: 10,
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
                        items: const [
                          "Web Development",
                          "Mobile App Development",
                          "Full Stack Developer",
                          "Back-end Developer"],
                        // popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: print,
                        hint: "Select Skill",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('Version',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),
                      const SizedBox(
                        height: 8,
                      ),
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
                            child:    DropdownButtonFormField(
                              // disabledHint: ,
                                decoration:const InputDecoration(
                                    border: UnderlineInputBorder(

                                    )
                                ),
                                hint: Text("Select year",     style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 14.5,
                                ),),
                                value: mySelection1,
                                onChanged: (String Value) {
                                  setState(() {
                                    mySelection1 = Value;
                                  });
                                },
                                items: lists1.map((listsC)=> DropdownMenuItem(
                                  child: Text(listsC),
                                  value: listsC,)).toList()



                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child:    DropdownButtonFormField(
                              // disabledHint: ,
                                decoration:const InputDecoration(
                                    border: UnderlineInputBorder(
                                    )
                                ),
                                hint: Text("Select Month",     style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 14.5,
                                ),),
                                value: mySelection2,
                                onChanged: (String Value) {
                                  setState(() {
                                    mySelection2 = Value;
                                  });
                                },
                                items: lists2.map((listsC)=> DropdownMenuItem(
                                  child: Text(listsC),
                                  value: listsC,)).toList()



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
                        value: mySelection,
                        onChanged: (String Value) {
                          setState(() {
                            mySelection = Value;
                          });
                        },
                        items: lists.map((listsC)=> DropdownMenuItem(
                            child: Text(listsC),
                        value: listsC,)).toList()



                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
