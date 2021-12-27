import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:date_field/date_field.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Views/SignIn/careerpreference.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

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
                      MultiSelectDialogField(
                        items: _skills
                            .map((e) =>
                                MultiSelectItem(e, e.name))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          _skills = values;
                        },
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

 const SizedBox(height: 20,),
                  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GFButton(
                  onPressed: () => showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_outline,
                        color: Colors.green,
                        size: 60,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Skill added, Click add option to add more else click next ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "ProximaNova")),
                      ],
                    ) ,
                    actions: [
                      GFButton(onPressed: (){
                        Navigator.of(context).pop();
                      },text: "Add",),
                      GFButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CareerPreference(),),);

                      },text: "Next",),
                    ],

                  )),
                  text: "Next",
                  type: GFButtonType.solid,
                )),
          ),

            ],
          ),
        ),
      ),
    ));
  }
}
