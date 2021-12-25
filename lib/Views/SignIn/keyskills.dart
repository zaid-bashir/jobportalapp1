import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:job_portal/Views/SignIn/careerpreference.dart';
import 'package:job_portal/Views/SignIn/it_skills.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class KeySkills extends StatefulWidget {
  const KeySkills({Key key}) : super(key: key);

  @override
  _KeySkillsState createState() => _KeySkillsState();
}

class Skills {
  final int id;
  final String name;

  Skills({
    this.id,
    this.name,
  });
}

class _KeySkillsState extends State<KeySkills> {
  // List<String> dropList = [
  //  "HTML",
  //   "CSS",
  //   "PYTHON",
  //   "FLUTTER",
  //   "JAVA"
  // ];
  static List<Skills> _skills = [
    Skills(id: 1, name: "Html"),
    Skills(id: 2, name: "Python"),
    Skills(id: 3, name: "Java"),
    Skills(id: 4, name: "React"),
    Skills(id: 5, name: "Flutter"),
    Skills(id: 6, name: "Dart"),
  ];
  final _items = _skills
      .map((animal) => MultiSelectItem<Skills>(animal, animal.name))
      .toList();

  List<Skills> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _skills;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 20),
            child: Column(children: [
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
                  Text('Key Skills',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova")),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Card(
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
                                              fontWeight: FontWeight.bold),
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: MultiSelectDialogField(
                                          items: _skills
                                              .map((e) =>
                                                  MultiSelectItem(e, e.name))
                                              .toList(),
                                          listType: MultiSelectListType.CHIP,
                                          onConfirm: (values) {
                                            _skills = values;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          
                          ],
                        )),
                  )),


                   const SizedBox(height: 20,),
                  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: GFButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ItSkills(),),);
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
