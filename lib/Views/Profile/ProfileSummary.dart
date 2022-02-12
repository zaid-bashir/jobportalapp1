
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';


class SummaryAdd extends StatefulWidget {



  String uuid;

  @override
  _SummaryAddState createState() => _SummaryAddState();
}

class _SummaryAddState extends State<SummaryAdd>
    with SingleTickerProviderStateMixin {

  var formKey = GlobalKey<FormState>();
  TextEditingController textFieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Profile Summary",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Summmary:',
                              style: TextStyle(
                                fontFamily: "ProximaNova",
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                fontSize: 14.0,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 5),
                              child: TextField(
                                controller: textFieldController,
                                maxLength: 100,

                                decoration:  InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)),
                                    borderSide:
                                    BorderSide(color: Colors.black26),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey[500]),
                                  ),
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Enter profile summary",
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GFButton(
                      onPressed: () async {
                        print("SUCCESS");

                        if (formKey.currentState.validate()) {



                        }
                      Navigator.pop(context);
                      },
                      text: "Save",
                      type: GFButtonType.solid,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }


}
