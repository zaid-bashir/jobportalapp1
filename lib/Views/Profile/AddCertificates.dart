import 'package:date_field/date_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/Certification-Add.dart';
import 'package:job_portal/Models/CertificationPopulate.dart';

import 'package:job_portal/Services/ApiServices.dart';

class Certification extends StatefulWidget {
  String uuid;

  Certification({Key key, this.uuid}) : super(key: key);

  @override
  _CertificationState createState() => _CertificationState();
}

class _CertificationState extends State<Certification> {
  bool get isEditing => widget.uuid != null;
  var formKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  int groupValue = 0;
  DateTime lastDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2;

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController issueByController = TextEditingController();

  bool isLoading = false;
  bool isLoadingCertification = false;

  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    GetCertification();
    print(widget.uuid);
    super.initState();
  }


  String errorMessage;

  CertificationAdd populate;

  GetCertification() {
    if (isEditing) {
      setState(() {
        isLoading = true;
      });
      apiServices.populateCertificationUp(widget.uuid).then((response) {
        setState(() {
          isLoading = false;
        });
        if (response.error) {
          errorMessage = response.errorMessage ?? "An Error Occurred";
        }
        populate = response.data;
        nameController.text = populate.candidatecertificationName;
        idController.text = populate.candidatecertificationCertificationid;
        urlController.text = populate.candidatecertificationWeblink;
        issueByController.text = populate.candidatecertificationIssuedby;
        // selectedDate = populate.candidatecertificationIssuedate;
        groupValue = int.parse(populate.candidatecertificationExpiry);
        // selectedDate2 = populate.candidatecertificationExpirydate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Certification",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova"),
                ),
                Text(
                  "Add details and links of your certifications.",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Card(
              elevation: 5,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
                child: FormBuilder(
                  key: _fbKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Certification Name:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                        ],
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Certification Id:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        keyboardType: TextInputType.number,
                        controller: idController,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: "Enter ID",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Certification URL:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        controller: urlController,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: "Enter URl",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Issued By:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                        ],
                        controller: issueByController,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, right: 25),
                        child: Text("Issued Date",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DateTimeFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Issued Date',
                          // hintStyle: heading6.copyWith(color: textGrey),
                          // errorStyle: TextStyle(color: Colors.redAccent),
                          suffixIcon: Icon(Icons.event_note),
                        ),
                        // initialValue: date,
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        lastDate: lastDate,
                        validator: (e) =>
                            (e?.day ?? 0) == 1 ? 'Except first day' : null,
                        // initialDate: date  ,
                        onDateSelected: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Validity:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GFRadio(
                                  size: 20,
                                  activeBorderColor: const Color(0xff3e61ed),
                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                  },
                                  inactiveIcon: null,
                                  radioColor: const Color(0xff3e61ed),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text(
                                  "This Certification does not expire",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DateTimeFormField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'Expiry Date',
                                // hintStyle: heading6.copyWith(color: textGrey),
                                // errorStyle: TextStyle(color: Colors.redAccent),
                                suffixIcon: Icon(Icons.event_note),
                              ),
                              // initialValue: date,
                              lastDate: lastDate,
                              mode: DateTimeFieldPickerMode.date,
                              autovalidateMode: AutovalidateMode.always,
                              validator: (e) => (e?.day ?? 0) == 1
                                  ? 'Except first day'
                                  : null,
                              // initialDate: date  ,
                              onDateSelected: (date) {
                                setState(() {
                                  selectedDate2 = date;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GFButton(
                onPressed: () async {
                  setState(() {
                    isLoadingCertification = true;
                  });
                  final insert = CertificationPopulate(
                    requestType: "delete",
                    candidatecertificationUuid: widget.uuid,
                  );

                  final result = await apiServices.certificationAdd(insert);
                  setState(() {
                    isLoadingCertification = false;
                  });
                  if (result.data) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(children: const [
                        Icon(
                          Icons.done_outlined,
                        ),
                        SizedBox(width: 7),
                        Text("Successfully Deleted"),
                      ]),
                      backgroundColor: Colors.green,
                      duration: const Duration(milliseconds: 2500),
                    ));

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                        children: const [
                          Icon(Icons.error),
                          SizedBox(width: 7),
                          Text("An Error Occured"),
                        ],
                      ),
                      backgroundColor: Colors.red,
                      duration: const Duration(milliseconds: 2500),
                    ));
                  }
                  Navigator.of(context).pop();
                },

                text: "Delete",
                type: GFButtonType.solid,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: GFButton(
                    text: isEditing ? "Update" : "Save",
                    type: GFButtonType.solid,
                    blockButton: false,
                    onPressed: () async {
                      if (isEditing) {
                        setState(() {
                          isLoading = true;
                        });
                        final insert = CertificationPopulate(
                          requestType: "update",
                          candidatecertificationUuid: widget.uuid,
                          candidatecertificationName: nameController.text,
                          candidatecertificationCertificationid:
                              idController.text,
                          candidatecertificationWeblink: urlController.text,
                          candidatecertificationIssuedby:
                              issueByController.text,
                          candidatecertificationIssuedate:
                              selectedDate.toString().split(" ")[0],
                          candidatecertificationExpiry: groupValue.toString(),
                          candidatecertificationExpirydate:
                              selectedDate2.toString().split(" ")[0],
                        );
                        final result =
                            await apiServices.certificationAdd(insert);

                        setState(() {
                          isLoading = false;
                        });

                        if (result.data) {
                          Navigator.of(context).pop();
                        }
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        final insert = CertificationPopulate(
                          requestType: "add",
                          candidatecertificationName: nameController.text,
                          candidatecertificationCertificationid:
                              idController.text,
                          candidatecertificationWeblink: urlController.text,
                          candidatecertificationIssuedby:
                              issueByController.text,
                          candidatecertificationIssuedate:
                              selectedDate.toString().split(" ")[0],
                          candidatecertificationExpiry: groupValue.toString(),
                          candidatecertificationExpirydate:
                              selectedDate2.toString().split(" ")[0],
                        );
                        final result =
                            await apiServices.certificationAdd(insert);

                        setState(() {
                          isLoading = false;
                        });

                        if (result.data) {
                          Navigator.of(context).pop();
                        }
                      }
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
