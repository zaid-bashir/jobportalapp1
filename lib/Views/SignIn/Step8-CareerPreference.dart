import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/Models/CareerPreference-post.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetIndustry.dart';
import 'package:job_portal/Models/GetShift.dart';
import 'package:job_portal/Models/JobType.dart';
import 'package:job_portal/Models/location.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_portal/Views/SignIn/ListView-Job-Type.dart';
import 'package:job_portal/Views/SignIn/Step9-PersonalDetails.dart';
import 'package:job_portal/Views/SignIn/listView-EmploymentType.dart';

class CareerPreference extends StatefulWidget {
   CareerPreference({Key key,this.uuid}) : super(key: key);
  String uuid;
  @override
  _CareerPreferenceState createState() => _CareerPreferenceState();
}

//edited
class _CareerPreferenceState extends State<CareerPreference> {
  DateTime selectedDate;
  int groupValue = 1;
  int groupValue2 = 1;
  YearPicker selectedDate2;

  fetchCity({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseLocation = await apiServices.getCity(query: query);
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
  TextEditingController industrySearchCont = TextEditingController();
  TextEditingController locationSearchCont = TextEditingController();

  bool isLoading = false;
  var formKey = GlobalKey<FormState>();

  ApiServices apiServices = ApiServices();

  ApiResponse<List<PreferredShift>> _apiResponse;
  ApiResponse<List<JobType>> _apiResponse2;
  ApiResponse<List<Industry>> _apiResponseIndustry;

  bool isActive = false;

  @override
  void initState() {
    // fetchJobType();
    fetchShift();
    fetchIndustry(query: "");
    fetchCity(query: "");
    super.initState();
  }

  fetchShift() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getShift();
    setState(() {
      isLoading = false;
    });
  }

  fetchJobType() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse2 = await apiServices.getjobType();
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

  // List<String> parseIndustry() {
  //   List<Industry> category = _apiResponseIndustry.data;
  //   List<String> dataItems = [];
  //   for (int i = 0; i < category.length; i++) {
  //     dataItems.add(category[i].industryName);
  //   }
  //   return dataItems;
  // }

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
                    children: [
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
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Career Preferences',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "ProximaNova")),
                        ],
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
                                              'Preferred Industry',
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
                                          child: DropdownSearch<Industry>(
                                            dropdownSearchDecoration:
                                                InputDecoration(
                                                    border:
                                                        UnderlineInputBorder()),
                                            validator: (value) {
                                              if (value == null) {
                                                return "Please Select Industry";
                                              }
                                              return null;
                                            },
                                            mode: Mode.DIALOG,
                                            items: isLoading
                                                ? Industry()
                                                : _apiResponseIndustry.data,
                                            itemAsString: (Industry obj) {
                                              return obj.industryName;
                                            },
                                            onFind: (val) async {
                                              setState(() {
                                                query = val;
                                              });
                                              return _apiResponseIndustry.data;
                                            },
                                            hint: "Select Industry",
                                            onChanged: (value) {
                                              industrySearchCont.text =
                                                  value.industryId.toString();
                                              myindustry = value.industryId;
                                              print(value.industryId);
                                            },
                                            showSearchBox: true,
                                            popupItemBuilder: (context,
                                                Industry item,
                                                bool isSelected) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child:
                                                        Text(item.industryName),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          // FindDropdown(
                                          //   searchBoxDecoration:  const InputDecoration(
                                          //     border: UnderlineInputBorder(
                                          //       borderSide: BorderSide(
                                          //         color: Colors.grey,
                                          //       ),
                                          //     ),
                                          //   ),
                                          //   items: parseIndustry(),
                                          //   searchHint: "Industry Name",
                                          //   onFind: (val) async{
                                          //     setState(() {
                                          //       query = val;
                                          //     });
                                          //     await fetchIndustry(query: query);
                                          //     parseIndustry();
                                          //     return [""];
                                          //   },
                                          //   onChanged: (item) {
                                          //     setState(() {
                                          //       myindustry = item;
                                          //     });
                                          //   },
                                          // ),
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
                            child: const ListJob(),
                          ),
                                // Padding(
                                //     padding: const EdgeInsets.only(
                                //         left: 10.0, right: 10.0, top: 2.0),
                                //     child: Row(
                                //       mainAxisSize: MainAxisSize.max,
                                //       children: <Widget>[
                                //         Padding(
                                //           padding: const EdgeInsets.all(8.0),
                                //           child: DropdownButtonHideUnderline(
                                //             child: GFDropdown(
                                //               hint: const Text("Job Type"),
                                //               value: jobType,
                                //               onChanged: (newValue) {
                                //                 setState(() {
                                //                   jobType = newValue;
                                //                 });
                                //               },
                                //               items: _apiResponse2.data
                                //                   .map(
                                //                     (data) => DropdownMenuItem(
                                //                         value: data.jobtypeId,
                                //                         child: Text(
                                //                             data.jobtypeName)),
                                //                   )
                                //                   .toList(),
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     )),
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
                                  child: const listCheck(),
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
                                            child: DropdownSearch<Cities>(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                      border:
                                                          UnderlineInputBorder()),
                                              validator: (value) {
                                                if (value == null) {
                                                  return "Please Select Location";
                                                }
                                                return null;
                                              },
                                              mode: Mode.DIALOG,
                                              items: isLoading
                                                  ? Cities()
                                                  : _apiResponseLocation.data,
                                              itemAsString: (Cities obj) {
                                                return obj.cityName;
                                              },
                                              onFind: (val) async {
                                                setState(() {
                                                  queriess = val;
                                                });
                                                return _apiResponseLocation
                                                    .data;
                                              },
                                              hint: "Select location",
                                              onChanged: (value) {
                                                locationSearchCont.text =
                                                    value.cityId.toString();
                                                locationId = value.cityId;
                                                print(value.cityId);
                                              },
                                              showSearchBox: true,
                                              popupItemBuilder: (context,
                                                  Cities item,
                                                  bool isSelected) {
                                                return Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  child: Card(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child:
                                                          Text(item.cityName),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
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
                                              'Salary Expectation',
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
                                        child: TextField(
                                          decoration:
                                              InputDecoration(hintText: "Lakh"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Thousand"),
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
                                              'Availability to Join',
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
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GFRadio(
                                          size: 20,
                                          activeBorderColor:
                                              const Color(0xff3e61ed),
                                          value: 0,
                                          groupValue: groupValue2,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue2 = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          radioColor: const Color(0xff3e61ed),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      const Text(
                                        "Immediate",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GFRadio(
                                          size: 20,
                                          value: 1,
                                          groupValue: groupValue2,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue2 = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor:
                                              const Color(0xff3e61ed),
                                          radioColor: const Color(0xff3e61ed),
                                        ),
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
                                groupValue2 == 1
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 22.0, right: 25.0, top: 20.0),
                                        child: DateTimeFormField(
                                          decoration: const InputDecoration(
                                            border: const UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            hintText: 'Joining Date',
                                            // hintStyle: heading6.copyWith(color: textGrey),
                                            // errorStyle: TextStyle(color: Colors.redAccent),
                                            suffixIcon: Icon(Icons.event_note),
                                          ),
                                          // initialValue: date,
                                          mode: DateTimeFieldPickerMode.date,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          validator: (e) => (e?.day ?? 0) == 1
                                              ? 'Please not the first day'
                                              : null,

                                          onDateSelected: (date) {
                                            setState(() {
                                              selectedDate = date;
                                            });
                                          },
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
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
                                if (formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final insert = CareerPreferencePost(
                                    candidateUuid: widget.uuid,
                                    candidateIndustryId: int.parse(myindustry),
                                    candidateJobtypeIdsList: ['9',"7"],
                                    candidateEmploymenttypeIdsList: ['3',"6"],
                                    candidatePreferredCityIdsList: [locationId],
                                    candidateExpectedctc: 5,
                                    candidateShiftId: int.parse(myShift),
                                    // candidateJoinimmediate: '1',

                                  );
                                  final result =
                                      await apiServices.PostPreference(insert);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  const title = "Done";
                                  final text = result.error
                                      ? (result.errorMessage ??
                                          "An Error Occurred")
                                      : "Successfully Created";
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (_) => AlertDialog(
                                  //     title: const Text(title),
                                  //     content: Text(text),
                                  //     actions: [
                                  //       ElevatedButton(
                                  //           onPressed: () {
                                  //             Navigator.pop(context);
                                  //           },
                                  //           child: const Text("OK"))
                                  //     ],
                                  //   ),
                                  // ).then((data) {
                                  //   if (result.data) {
                                  //     Navigator.of(context).push(
                                  //       MaterialPageRoute(
                                  //         builder: (context) =>
                                  //              PersonalDetails(uuid: widget.uuid,),
                                  //       ),
                                  //     );
                                  //   }
                                  // });
                                }
    Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                 PersonalDetails(uuid: widget.uuid,),
          ),
        );
                              },
                              text: "Next",
                              type: GFButtonType.solid,
                            )),
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
}

// class listCheck extends StatefulWidget {
//   const listCheck({Key key}) : super(key: key);
//
//   @override
//   _listCheckState createState() => _listCheckState();
// }
//
// class _listCheckState extends State<listCheck> {
//   ApiServices apiServices = ApiServices();
//
//   bool isLoading = false;
//   bool isActive = false;
//
//   fetchEmpType() async {
//     setState(() {
//       isLoading = true;
//     });
//     _apiResponse3 = await apiServices.getEmploymentType();
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   ApiResponse<List<EmploymentType>> _apiResponse3;
//
//   @override
//   void initState() {
//     fetchEmpType();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Center(child: CircularProgressIndicator())
//         : ListView.builder(
//             itemCount: _apiResponse3.data.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   CheckboxListTile(
//                     title: Text(_apiResponse3.data[index].employmenttypeName),
//                     value: isActive,
//                     onChanged: (val) {
//                       setState(() {
//                         isActive = val;
//                         if (isActive == true) {
//                           print("student is active");
//                         } else {}
//                       });
//                     },
//                   ),
//                 ],
//               );
//             });
//   }
// }
