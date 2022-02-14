import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:job_portal/Models/Patent-Populate.dart';
import 'package:job_portal/Models/PatentAdd.dart';
import 'package:job_portal/Services/ApiServices.dart';

class AddPatents extends StatefulWidget {
  AddPatents({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _AddPatentsState createState() => _AddPatentsState();
}

class _AddPatentsState extends State<AddPatents> {
  bool get isEditing => widget.uuid != null;

// Global formKey
  var formKey = GlobalKey<FormState>();

  DateTime selectedDate;
  DateTime initialDate;
  int val = 0;
  bool isLoading = false;

  TextEditingController title = TextEditingController();
  TextEditingController office = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController discription = TextEditingController();

  ApiServices apiServices = ApiServices();
  String errorMessage;
  PatentPopulate patentPopulate;

  @override
  void initState() {
    getPatent();
    super.initState();
  }

  getPatent() {
    if (isEditing) {
      setState(() {
        isLoading = true;
      });
      apiServices.populatePatentUpdate(widget.uuid).then((response) {
        setState(() {
          isLoading = false;
        });
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error Occurred";
        }
        patentPopulate = response.data;
        title.text = patentPopulate.candidatepatentTitle;
        office.text = patentPopulate.candidatepatentOffice;
        url.text = patentPopulate.candidatepatentWeblink;
        val = int.parse(patentPopulate.candidatepatentStatus);
        number.text = patentPopulate.candidatepatentApplicationnumber;
        discription.text = patentPopulate.candidatepatentDesc;
        initialDate = DateTime.parse(patentPopulate.candidatepatentIssuedate);
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
                    "Patent",
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
                        'Patent Title',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                          hintText: " Patent Title",
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
                        'Patent Office',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      TextFormField(
                        controller: office,
                        decoration: InputDecoration(
                          hintText: " Patent Office",
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
                        'Patent WebLink',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      TextFormField(
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Patent Status',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      ListTile(
                        title: Text(
                          "Pending",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Issued",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova"),
                        ),
                        leading: Radio(
                          value: 2,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      Text(
                        'Application Number',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "ProximaNova"),
                      ),
                      TextFormField(
                        controller: number,
                        decoration: InputDecoration(
                          hintText: "Application Number",
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
                        'Issue Date',
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
                          hintText: 'Issue Date',
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
                     if(isEditing){
                       setState(() {
                         isLoading = true;
                       });
                       final insert = AddPatent(
                         requestType: "update",
                         candidatepatentUuid: widget.uuid,
                         candidatepatentTitle: title.text,
                         candidatepatentOffice: office.text,
                         candidatepatentWeblink: url.text,
                         candidatepatentStatus: val.toString(),
                         candidatepatentApplicationnumber: number.text,
                         candidatepatentIssuedate: selectedDate,
                         candidatepatentDesc: discription.text,
                       );

                       final result = await apiServices.patentsAdd(insert);
                       setState(() {
                         isLoading = false;
                       });
                       if (result.data) {
                         Navigator.pop(context);
                       } else {
                         print("error");
                       }
                     }else{
                       setState(() {
                         isLoading = true;
                       });
                       final insert = AddPatent(
                         requestType: "add",
                         candidatepatentTitle: title.text,
                         candidatepatentOffice: office.text,
                         candidatepatentWeblink: url.text,
                         candidatepatentStatus: val.toString(),
                         candidatepatentApplicationnumber: number.text,
                         candidatepatentIssuedate: selectedDate,
                         candidatepatentDesc: discription.text,
                       );

                       final result = await apiServices.patentsAdd(insert);
                       setState(() {
                         isLoading = false;
                       });
                       if (result.data) {
                         Navigator.pop(context);
                       } else {
                         print("error");
                       }
                     }
                      },
                      text: isEditing?"Update":"Add",
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
