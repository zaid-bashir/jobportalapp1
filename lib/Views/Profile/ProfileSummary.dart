
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:job_portal/Models/ProfileSummaryPopulate.dart';
import 'package:job_portal/Services/ApiServices.dart';


class SummaryAdd extends StatefulWidget {
  SummaryAdd({Key key,this.textfield }) : super(key: key);

  String textfield;
  String uuid;

  @override
  _SummaryAddState createState() => _SummaryAddState();
}

class _SummaryAddState extends State<SummaryAdd>
    with SingleTickerProviderStateMixin {

  var formKey = GlobalKey<FormState>();
  TextEditingController textFieldController = TextEditingController();
  bool isLoading = false;
  ApiServices apiServices = ApiServices();

  getProfileS(){
    setState(() {
      isLoading = true;
    });
    textFieldController.text = widget.textfield;

    // button.value= 1;
// jobCategorySearchCon = widget.onChanged(value);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getProfileS();
    super.initState();
  }



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
                                maxLength: 500,
                                maxLines: 4,
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
                        setState(() {
                          isLoading = true;
                        });
                        final insert = SummaryPopulate(
                          candidateProfilesummary: textFieldController.text,
                        );
                        final result =  await apiServices.summaryAdd(insert);
                        setState(() {
                          isLoading = false;
                        });
                        if(result.data){

                          Navigator.of(context).pop();
                        }

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

