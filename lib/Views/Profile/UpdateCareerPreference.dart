import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/EmploymentType.dart';
import 'package:job_portal/Models/GetIndustry.dart';
import 'package:job_portal/Models/GetShift.dart';
import 'package:job_portal/Models/JobType.dart';
import 'package:job_portal/Models/CareerProfileUpdate.dart';
import 'package:job_portal/Models/location.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateCareerPreference extends StatefulWidget {
  UpdateCareerPreference({Key key, this.uuid}) : super(key: key);
  String uuid;
  @override
  _UpdateCareerPreferenceState createState() => _UpdateCareerPreferenceState();
}

//edited
class _UpdateCareerPreferenceState extends State<UpdateCareerPreference> {
  DateTime selectedDate;
  int groupValue = 1;
  int groupValue2 = 1;
  YearPicker selectedDate2;

  fetchCity({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseLocation =
        (await apiServices.getCity(query: query)) as ApiResponse<List<Cities>>;
    setState(() {
      isLoading = false;
    });
  }

  ApiResponse<List<Cities>> _apiResponseLocation;

  String query;
  String myindustry = "";
  String locationId = "";
  String myShift;
  String jobType;
  String empType;
  String queriess;

  TextEditingController lakhController = TextEditingController();
  TextEditingController thousandController = TextEditingController();
  TextEditingController industrySearchCont = TextEditingController();
  TextEditingController locationSearchCont = TextEditingController();
  TextEditingController lakh = TextEditingController();

  bool isLoading = false;
  var formKey = GlobalKey<FormState>();

  ApiServices apiServices = ApiServices();

  ApiResponse<List<PreferredShift>> _apiResponse;
  ApiResponse<List<Industry>> _apiResponseIndustry;

  bool isActive = false;
  List<String> locationList = [];
  List<int> selectedSkillsJob = [];
  List<int> selectedSkillsemp = [];
  List<String> industriesList = [];
  @override
  void initState() {
    fetchJobType();
    fetchShift();
    fetchEmpType();
    fetchIndustry(query: "");
    fetchCity(query: "");
    super.initState();
  }

  fetchJobType() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse8 = await apiServices.getjobType();
    setState(() {
      isLoading = false;
    });
  }

  fetchEmpType() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse3 = await apiServices.getEmploymentType();
    setState(() {
      isLoading = false;
    });
  }

  ApiResponse<List<EmploymentType>> _apiResponse3;
  ApiResponse<List<JobType>> _apiResponse8;

  fetchShift() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getShift();
    setState(() {
      isLoading = false;
    });
  }

  fetchIndustry({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseIndustry = await apiServices.getIndustry(query: query);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    print("Destroying State");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Career Preferences',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova")),
                      Text(
                        "Share desirable traits in a job and we will recommend best fit jobs for you.",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
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
                                              'Preferred Industries',
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
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Industries(context),
                                        )),
                                      ],
                                    )),
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
                                              'Preferred Job Type',
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
                                      left: 20.0, right: 25.0, top: 20.0),
                                  child: Job(context),
                                ),

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
                                              'Preferred Employment Type',
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
                                      left: 20.0, right: 25.0, top: 20.0),
                                  child: Employe(context),
                                ),

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
                                              'Preferred Job Location',
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
                                            child: Location(context),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22.0, right: 25.0, top: 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Expected Annual Salary',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Icon(FontAwesomeIcons.rupeeSign),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                                    ],
                                    validator: (String input){
                                      if(input.isEmpty){
                                        return "Enter Expected Annual Salary";
                                      }
                                      if(input.length < 6){
                                        return "Salary should be more than 5 digits";
                                      }
                                      if(input.length > 7){
                                        return "Salary should be less than 7 digits";
                                      }
                                    },
                                    controller: lakh,
                                    decoration:
                                    InputDecoration(hintText: "Salary"),
                                  ),
                                ),

                              ],
                            ),
                          ),
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
                                              'Preferred Shift',
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
                                            child: DropdownButtonFormField(
                                              // disabledHint: ,
                                              decoration: const InputDecoration(
                                                  border:
                                                      UnderlineInputBorder()),
                                              hint: Text("Select shift"),
                                              value: myShift,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  myShift = newValue;
                                                });
                                              },
                                              items: isLoading
                                                  ? ["Please Wait"]
                                                      .map(
                                                        (value) =>
                                                            DropdownMenuItem(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontFamily:
                                                                          "ProximaNova"),
                                                                )),
                                                      )
                                                      .toList()
                                                  : _apiResponse.data
                                                      .map(
                                                        (data) =>
                                                            DropdownMenuItem(
                                                          value: data.shiftId,
                                                          child: Text(
                                                            data.shiftName,
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontFamily:
                                                                    "ProximaNova"),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),

                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GFButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            text: "Cancel",
                            type: GFButtonType.solid,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GFButton(
                              onPressed: () async {


                                  setState(() {
                                    isLoading = true;
                                  });
                                  final insert = CareerProfileUpdate(
                                    candidateIndustryIdsList: industriesList,
                                    candidateJobtypeIdsList: selectedSkillsJob,
                                    candidateEmploymenttypeIdsList:
                                        selectedSkillsemp,
                                    candidatePreferredCityIdsList: locationList,
                                    candidateExpectedctc:lakh.text,

                                    candidateShiftId: myShift,
                                    // candidateJoindate: selectedDate
                                  );
                                  final result = await apiServices
                                      .careerpreferenceUpdate(insert);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  const title = "Done";
                                  final text = result.error
                                      ? (result.errorMessage ??
                                          "An Error Occurred")
                                      : "Successfully Updated";

                                Navigator.pop(context);
                              },
                              text: "Save",
                              type: GFButtonType.solid,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Industries(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownSearch<Industry>.multiSelection(
          // autoValidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value.isEmpty) {
              return "Select Preferred Industries";
            }
            return null;
          },
          mode: Mode.DIALOG,
          items: isLoading ? [Industry()] : _apiResponseIndustry.data,
          itemAsString: (Industry obj) {
            return obj.industryName;
          },
          onChanged: (val) {
            setState(() {
              industriesList = val.map((e) {
                return e.industryId;
              }).toList();
              print(industriesList);
            });
          },

          hint: "Select Preferred Industries",
          showSearchBox: true,
          popupItemBuilder: (context, Industry item, bool isSelected) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(item.industryName),
              ),
            );
          },
        ),
      ),
    ]);
  }

  Widget Location(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownSearch<Cities>.multiSelection(
          // autoValidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value.isEmpty) {
              return "Select Preferred City";
            }
            return null;
          },
          mode: Mode.DIALOG,
          items: isLoading ? [Cities()] : _apiResponseLocation.data,
          itemAsString: (Cities obj) {
            return obj.cityName;
          },
          onChanged: (val) {
            setState(() {
              locationList = val.map((e) {
                return e.cityId;
              }).toList();
              print(locationList);
            });
          },
          // onFind: (val) async {
          //   setState(() {
          //     query = val;
          //   });
          //   fetchCompany(query: query);
          //   return _apiResponse.data;
          // },
          // ignore: deprecated_member_use
          hint: "Select Preferred City",
          showSearchBox: true,
          popupItemBuilder: (context, Cities item, bool isSelected) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(item.cityName),
              ),
            );
          },
        ),
      ),
    ]);
  }

  Widget Job(BuildContext context) {
    return Column(children: [
      DropdownSearch<JobType>.multiSelection(
        // autoValidateMode:
        // AutovalidateMode
        //     .onUserInteraction,
        validator: (value) {
          if (value.isEmpty) {
            return " Select Job Type";
          }
          return null;
        },
        mode: Mode.DIALOG,
        items: isLoading ? [JobType()] : _apiResponse8.data,
        itemAsString: (JobType obj) {
          return obj.jobtypeName;
        },
        onChanged: (val) {
          setState(() {
            selectedSkillsJob = val.map((e) {
              return e.jobtypeId;
            }).toList();
            print(selectedSkillsJob);
          });
        },

        hint: "Select Job Type",
        showSearchBox: true,
        popupItemBuilder: (context, JobType item, bool isSelected) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(item.jobtypeName),
            ),
          );
        },
      ),
    ]);
  }

  Widget Employe(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownSearch<EmploymentType>.multiSelection(
          // autoValidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value.isEmpty) {
              return " Select Employment Type";
            }
            return null;
          },
          mode: Mode.DIALOG,
          items: isLoading ? [EmploymentType()] : _apiResponse3.data,
          itemAsString: (EmploymentType obj) {
            return obj.employmenttypeName;
          },
          onChanged: (val) {
            setState(() {
              selectedSkillsemp = val.map((e) {
                return e.employmenttypeId;
              }).toList();
              print(selectedSkillsemp);
            });
          },

          hint: "Select Employment type",
          showSearchBox: true,
          popupItemBuilder: (context, EmploymentType item, bool isSelected) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(item.employmenttypeName),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
