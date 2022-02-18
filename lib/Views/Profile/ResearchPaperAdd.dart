import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:job_portal/Models/Presentation-Populate.dart';
import 'package:job_portal/Models/Researchpaper.dart';
import 'package:job_portal/Services/ApiServices.dart';

class Research extends StatefulWidget {
  Research({Key key, this.uuid}) : super(key: key);
  String uuid;

  @override
  _ResearchState createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  bool get isEditing => widget.uuid != null;
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  ApiServices apiServices = ApiServices();
  TextEditingController titleresearch = TextEditingController();
  TextEditingController weburl= TextEditingController();
  TextEditingController publishedon = TextEditingController();
  TextEditingController description = TextEditingController();

  PresentationPopulate presentationPopulate;
  String errorMessage;


  @override
  void initState() {
    // getResearchpaper();
    // getPresentation();
    super.initState();
  }

  // getResearchpaper() {
  //   if (isEditing) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     apiServices.populatePresentationParticularUpdate(widget.uuid).then((response) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       if (response.error) {
  //         errorMessage = response.errorMessage ?? "An Error Occurred";
  //       }
  //       presentationPopulate = response.data;
  //       title.text = presentationPopulate.candidatepresentationTitle;
  //       weblink.text = presentationPopulate.candidatepresentationWeblink;
  //       desclink.text = presentationPopulate.candidatepresentationDesc;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Research Publication",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "ProximaNova"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
                child: FormBuilder(
                  key: _fbKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text("Title:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        controller: titleresearch,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: "Add Title",
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
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text("Web URL:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        controller: weburl,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: "Add URL",
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
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text("Published On:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        controller: publishedon,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: "Published On",
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
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text("Description:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        controller:description,
                        maxLines: 4,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: "Enter Description",
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
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(40.0),

            child: Align(
              alignment: Alignment.centerRight,
              child: GFButton(
                onPressed: () async {
                  // if (isEditing) {
                    setState(() {
                      isLoading = true;
                    });
                  //   final insert = PresentationAddModel(
                  //       requestType: "update",
                  //       candidatepresentationUuid: widget.uuid,
                  //       candidatepresentationTitle: titleresearch.text,
                  //       candidatepresentationWeblink: weburl.text,
                  //       candidatepresentationDesc : description.text);
                  //   final result = await apiServices.presentationAddService(insert);
                  //   setState(() {
                  //     isLoading = false;
                  //   });
                  //   if (result.data) {
                  //     Navigator.pop(context);
                  //   } else {
                  //     print("error");
                  //   }
                  // }
                  // else
                  // {
                    final insert = ResearchpaperAdd(
                        requestType: "add",
                        candidatepaperTitle: titleresearch.text,
                        candidatepaperWeblink: weburl.text,
                        // candidatepaperDesc : description.text,
                        candidatepaperPublisheddate : publishedon.text
                    );

                    final result = await apiServices.researchpaperAdd(insert);
                    setState(() {
                      isLoading = false;
                    });
                    if (result.data) {
                      Navigator.pop(context);
                    } else {
                      print("error occured");
                    }
                  // }
                },
                text:"Add",
                type: GFButtonType.solid,

              ),
            ),
          ),
          // SizedBox(
          //   width: 10,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 22),
          // child: GFButton(
          //     text: "Save",
          //     type: GFButtonType.solid,
          //     blockButton: false,
          //     onPressed: () async {
          //       Navigator.of(context).pop();
          //     }),
          // ),


          // const SizedBox(
          //   height: 40,
          // ),
        ]));
  }
}
