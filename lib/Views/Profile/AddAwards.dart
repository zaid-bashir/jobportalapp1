import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Models/Awards.dart';


import 'package:job_portal/Services/ApiServices.dart';

class AddAwards extends StatefulWidget {
  AddAwards({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _AddAwardsState createState() => _AddAwardsState();
}

class _AddAwardsState extends State<AddAwards> {
  bool get isEditing => widget.uuid != null;

// Global formKey
  var formKey = GlobalKey<FormState>();

  DateTime selectedDate;
  DateTime initialDate;
  bool isLoading = false;

  TextEditingController title = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController discription = TextEditingController();

  ApiServices apiServices = ApiServices();
  String errorMessage;
  Awards awards;

  @override
  void initState() {
    getAwards();
    super.initState();
  }

  getAwards() {
    if (isEditing) {
      setState(() {
        isLoading = true;
      });
      apiServices.populateAwardsUpdate(widget.uuid).then((response) {
        setState(() {
          isLoading = false;
        });
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error Occurred";
        }
        awards = response.data;
        title.text = awards.candidateawardTitle;
        url.text = awards.candidateawardWeblink;
        discription.text = awards.candidateawardDesc;
        // initialDate = awards.candidateawardDate as DateTime;

      });
    }
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
                    "Awards",
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
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Awards Title',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                          hintText: " Awards Title",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Award WebLink',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      TextFormField(
                        // validator: (String input){},
                        controller: url,
                        decoration: InputDecoration(
                          hintText: " Patent Url",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Award Date',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      DateTimeFormField(
                        decoration: const InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Award Date',
                          // hintStyle: heading6.copyWith(color: textGrey),
                          // errorStyle: TextStyle(color: Colors.redAccent),
                          suffixIcon: Icon(Icons.event_note),
                        ),
                        initialValue: initialDate,
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        // validator: (e) => (e?.day ?? 0) == 1
                        //     ? 'Please not the first day'
                        //     : null,

                        onDateSelected: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      TextFormField(
                        controller: discription,
                        decoration: InputDecoration(
                          hintText: "description",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: GFButton(
                      onPressed: () async {
                        if (isEditing) {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = Awards(
                            requestType: "update",
                            candidateawardUuid: widget.uuid,
                            candidateawardTitle: title.text,
                            candidateawardDate: selectedDate.toString(),
                            candidateawardDesc: discription.text,
                            candidateawardWeblink: url.text,
                          );

                          final result = await apiServices.awardsAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            Navigator.pop(context);
                          } else {
                            print("error");
                          }                        }
                        else {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = Awards(
                            requestType: "add",
                            candidateawardTitle: title.text,
                            candidateawardDate: selectedDate.toString(),
                            candidateawardDesc: discription.text,
                            candidateawardWeblink: url.text,
                          );

                          final result = await apiServices.awardsAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            Navigator.pop(context);
                          } else if(result.responseCode == 400){
                            print("error");
                            var errors = result.data.toString();
                            print(errors);
                          }
                        }
                      },
                      text: isEditing ? "Update" : "Add",
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
