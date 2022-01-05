// ignore_for_file: prefer_const_constructors

import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetCompany.dart';
import 'package:job_portal/Models/GetIndustry.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/Step6-KeySkills.dart';

class WorkingProfession extends StatefulWidget {
  const WorkingProfession({Key key}) : super(key: key);

  @override
  _WorkingProfessionState createState() => _WorkingProfessionState();
}

class _WorkingProfessionState extends State<WorkingProfession> {

  String query;
  String mycompany = "";
  String myindustry = "";




  int groupValue = 0;
  List lists = [
    "ClustTech Pvt Ltd",
    "Zumr Pvt Ltd",
    "Accenture",
    "Microsoft"
        "Google"
  ];
  List list = [
    "IT-software",
    "Education/training",
    "IT- hardware/Training",
    "Internet/ E- commerce"
  ];
  List list3 = [
    "MAnufacturing",
    "BPO/Call Center",
    "IT-Hardware/ Networking",
    "E-Learning"
  ];
  DateTime selectedDate;

  // int groupValue = 1;
  // int groupValue2 = 1;
  // List lists = ["delhi", "mumbai", "chennai", "kashmir"];
  // List list = ["Srinagar", "Pulwama", "Budgam", "Ganderbal"];


  bool isLoadingCompany = false;
  bool isLoadingIndustry = false;

  ApiServices apiServices = ApiServices();

  ApiResponse<List<Company>> _apiResponseCompany;
  ApiResponse<List<Industry>> _apiResponseIndustry;






  @override
  void initState() {
    super.initState();

    fetchCompany(query: "");
    fetchIndustry(query: "");
  }

  fetchCompany({String query}) async {
    setState(() {
      isLoadingCompany = true;
    });
    _apiResponseCompany = await apiServices.getCompany(query: query);
    setState(() {
      isLoadingCompany = false;
    });
  }


  List<String> parseData(){
    List<Company> category = _apiResponseCompany.data;
    List<String> dataItems = [];
    for(int i = 0; i < category.length;i++){
      dataItems.add(category[i].companyName);
    }
    return dataItems;
  }
  //Industry
  fetchIndustry({String query}) async {
    setState(() {
      isLoadingIndustry = true;
    });
    _apiResponseIndustry = await apiServices.getIndustry(query: query);
    setState(() {
      isLoadingIndustry = false;
    });
  }
  List<String> parseIndustry(){
    List<Industry> category = _apiResponseIndustry.data;
    List<String> dataItems = [];
    for(int i = 0; i < category.length;i++){
      dataItems.add(category[i].industryName);
    }
    return dataItems;
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
                      "Professional Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                  ],
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text("Currently Working",
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
                              child: Row(
                                children: [
                                  GFRadio(
                                    size: 20,
                                    activeBorderColor:
                                        const Color(0xff3e61ed),
                                    value: 0,
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
                                    "Yes",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  GFRadio(
                                    size: 20,
                                    value: 1,
                                    groupValue: groupValue,
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue = value;
                                      });
                                    },
                                    inactiveIcon: null,
                                    activeBorderColor:
                                        const Color(0xff3e61ed),
                                    radioColor: const Color(0xff3e61ed),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Text(
                                    "No",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            groupValue == 0
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Current Company Name",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  )
                            // logic for the gfbutton  Goes here
                                : Container(),
                            groupValue == 0
                                ? SizedBox(
                                    height: 5,
                                  )
                                : Container(),
                            groupValue == 0
                                ? Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: FindDropdown(
                              searchBoxDecoration:  const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                              ),
                              items: parseData(),
                              searchHint: "Company Name",
                              onFind: (val) async{
                                  setState(() {
                                    query = val;
                                  });
                                  await fetchCompany(query: query);
                                  parseData();
                                  return [""];
                              },
                              onChanged: (item) {
                                  setState(() {
                                    mycompany = item;
                                  });
                              },
                            ),
                                )
                                : Container(),

                            groupValue == 0
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Current Designation",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  )
                                : Container(),
                            groupValue == 0
                                ? SizedBox(
                                    height: 5,
                                  )
                                : Container(),
                            groupValue == 0
                                ? DropdownSearch<String>(
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    mode: Mode.DIALOG,
                                    showSelectedItems: true,
                                    showSearchBox: true,
                                    items: ["OM", "SC", "ST", "RBC", "OBC"],
                                    // popupItemDisabled: (String s) => s.startsWith('I'),
                                    onChanged: print,
                                    hint: "Select Designation",
                                  )
                                : Container(),
                            groupValue == 0
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Current Salary",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  )
                                : Container(),
                            groupValue == 0
                                ? SizedBox(
                                    height: 5,
                                  )
                                : Container(),
                            groupValue == 0
                                ? TextField(
                                    decoration: InputDecoration(
                                      hintText: "Current Salary",
                                      hintStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontFamily: "ProximaNova",
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 14.5,
                                      ),
                                    ),
                                  )
                                : Container(),
                            groupValue == 0
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Working since",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  )
                                : Container(),

                            groupValue == 0
                                ? Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: "Years"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: "Months"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),

                            groupValue == 0
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Previous Company Name",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  ),
                            groupValue == 1
                                ?  Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: FindDropdown(
                              searchBoxDecoration:  const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                              ),
                              items: parseData(),
                              searchHint: "Company Name",
                              onFind: (val) async{
                                  setState(() {
                                    query = val;
                                  });
                                  await fetchCompany(query: query);
                                  parseData();
                                  return [""];
                              },
                              onChanged: (item) {
                                  setState(() {
                                    mycompany = item;
                                  });
                              },
                            ),
                                )
                                : Container(),
                            groupValue == 1
                                ? Container()
                                : SizedBox(
                                    height: 10,
                                  ),
                            groupValue == 0
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Previous Designation",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  ),

                            groupValue == 0
                                ? Container()
                                : DropdownSearch<String>(
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    mode: Mode.DIALOG,
                                    showSelectedItems: true,
                                    showSearchBox: true,
                                    items: ["OM", "SC", "ST", "RBC", "OBC"],
                                    // popupItemDisabled: (String s) => s.startsWith('I'),
                                    onChanged: print,
                                    hint: "Select Previous Designation",
                                  ),
                            groupValue == 0
                                ? Container()
                                : SizedBox(
                                    height: 10,
                                  ),

                            // const Text('Previous Designation',
                            //     style: TextStyle(fontSize:15,
                            //         fontWeight: FontWeight.bold,
                            //         fontFamily: "ProximaNova")),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                            // DropdownSearch<String>(
                            //   dropdownSearchDecoration: const InputDecoration(
                            //     border: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Colors.grey,
                            //       ),
                            //     ),
                            //   ),
                            //   mode: Mode.DIALOG,
                            //   showSelectedItems: true,
                            //   showSearchBox: true,
                            //   items: ["Indian",
                            //     "Chinies",
                            //     "Indonasian",
                            //     "Austrailia"],
                            //   // popupItemDisabled: (String s) => s.startsWith('I'),
                            //   onChanged: print,
                            //   hint: "Select Nationality",
                            //   // selectedItem: "Indian"
                            // ),

                            groupValue == 0
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Previous Salary",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  ),
                            groupValue == 0
                                ? Container()
                                : TextField(
                                    decoration: InputDecoration(
                                      hintText: "Previous Salary('Annually')",
                                      hintStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontFamily: "ProximaNova",
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 14.5,
                                      ),
                                    ),
                                  ),

                            groupValue == 0
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Text("Tenure of last job",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova")),
                                  ),

                            groupValue == 0
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: "Years"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: "Months"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text("Industry",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: FindDropdown(
                                searchBoxDecoration:  const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                items: parseIndustry(),
                                searchHint: "Industry Name",
                                onFind: (val) async{
                                  setState(() {
                                    query = val;
                                  });
                                  await fetchIndustry(query: query);
                                  parseData();
                                  return [""];
                                },
                                onChanged: (item) {
                                  setState(() {
                                    myindustry = item;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => KeySkills(),
                            ),
                          );
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
