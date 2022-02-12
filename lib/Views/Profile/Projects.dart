import 'package:date_field/date_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/CurerntLocation.dart';
import 'package:job_portal/Models/GetCompany.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Views/SignIn/ListViewEmploymentType.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  var formKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool isVisible = false;
  int groupValue = 0;
  int groupValue1 = 0;
  int groupValue2 = 0;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2;
  DateTime selectedDate3;
  String mySelectionYear;

  String query;
  String mycompany = "";
  String cityID = "";

  String currentCompanyID = "";

  TextEditingController currentCompanySearchCo = TextEditingController();
  TextEditingController jobCategorySearchCon = TextEditingController();

  bool isLoadingCompany = false;
  bool isLoadingCurrentCopmpany = false;
  bool isLoadingCurrentLocation = false;

  ApiServices apiServices = ApiServices();

  ApiResponse<List<Company>> apiResponseCurrentCompany;
  ApiResponse<List<CurrentLocation>> _apiResponseCurrentLocation;

  // fetchCompany({String query}) async {
  //   setState(() {
  //     isLoadingCompany = true;
  //   });
  //   apiResponseCurrentCompany = await apiServices.getCompany(query: query);
  //   setState(() {
  //     isLoadingCompany = false;
  //   });
  // }

  List<String> parseData() {
    List<Company> category = apiResponseCurrentCompany.data;
    List<String> dataItems = [];
    for (int i = 0; i < category.length; i++) {
      dataItems.add(category[i].organizationName);
    }
    return dataItems;
  }

  fetchCurrentLocation({String query}) async {
    setState(() {
      isLoadingCurrentLocation = true;
    });
    _apiResponseCurrentLocation =
        await apiServices.getCurrentLocation(query: query);
    setState(() {
      isLoadingCurrentLocation = false;
    });
  }

  @override
  void initState() {
    // fetchCompany(query: "");
    fetchCurrentLocation(query: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
                  "Add Projects",
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
                        child: Text("Project Type:   ",
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
                              "Academic",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GFRadio(
                              size: 20,
                              value: 2,
                              groupValue: groupValue,
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value;
                                });
                              },
                              inactiveIcon: null,
                              activeBorderColor: const Color(0xff3e61ed),
                              radioColor: const Color(0xff3e61ed),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              "Professsional",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Project Title:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Add title",
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
                          top: 15,
                        ),
                        child: Text(" Project Client: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownSearch<Company>(
                        dropdownSearchDecoration:
                            InputDecoration(border: UnderlineInputBorder()),
                        validator: (value) {
                          if (value == null) {
                            return "Please Select Company Name";
                          }
                          return null;
                        },
                        mode: Mode.DIALOG,
                        items: isLoadingCurrentCopmpany
                            ? Company()
                            : apiResponseCurrentCompany.data,
                        itemAsString: (Company obj) {
                          return obj.organizationName;
                        },
                        onFind: (val) async {
                          setState(() {
                            query = val;
                            print(val);
                          });
                          return apiResponseCurrentCompany.data;
                        },
                        hint: "Select Name",
                        onChanged: (value) {
                          currentCompanySearchCo.text =
                              value.organizationId.toString();
                          currentCompanyID = value.organizationId;
                          print(value.organizationId);
                        },
                        showSearchBox: true,
                        popupItemBuilder:
                            (context, Company item, bool isSelected) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(item.organizationName),
                              ),
                            ),
                          );
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Project Status",
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
                              activeBorderColor: const Color(0xff3e61ed),
                              value: 1,
                              groupValue: groupValue1,
                              onChanged: (value) {
                                setState(() {
                                  groupValue1 = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: const Color(0xff3e61ed),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              "Finished",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GFRadio(
                              size: 20,
                              value: 2,
                              groupValue: groupValue1,
                              onChanged: (value) {
                                setState(() {
                                  groupValue1 = value;
                                });
                              },
                              inactiveIcon: null,
                              activeBorderColor: const Color(0xff3e61ed),
                              radioColor: const Color(0xff3e61ed),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              "Ongoing",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      groupValue1 == 1
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: DateTimeFormField(
                                      decoration: const InputDecoration(
                                        border: const UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        hintText: 'Start Date',
                                        // hintStyle: heading6.copyWith(color: textGrey),
                                        // errorStyle: TextStyle(color: Colors.redAccent),
                                        suffixIcon: Icon(Icons.event_note),
                                      ),
                                      // initialValue: date,
                                      mode: DateTimeFieldPickerMode.date,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (e) => (e?.day ?? 0) == 1
                                          ? ' Except first day'
                                          : null,

                                      onDateSelected: (date) {
                                        setState(() {
                                          selectedDate = date;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: DateTimeFormField(
                                      decoration: const InputDecoration(
                                        border: const UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        hintText: 'End Date',
                                        // hintStyle: heading6.copyWith(color: textGrey),
                                        // errorStyle: TextStyle(color: Colors.redAccent),
                                        suffixIcon: Icon(Icons.event_note),
                                      ),
                                      // initialValue: date,
                                      mode: DateTimeFieldPickerMode.date,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (e) => (e?.day ?? 0) == 1
                                          ? ' Except first day'
                                          : null,

                                      onDateSelected: (date) {
                                        setState(() {
                                          selectedDate2 = date;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      groupValue1 == 2
                          ? Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: DateTimeFormField(
                                decoration: const InputDecoration(
                                  border: const UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: 'Start Date',
                                  // hintStyle: heading6.copyWith(color: textGrey),
                                  // errorStyle: TextStyle(color: Colors.redAccent),
                                  suffixIcon: Icon(Icons.event_note),
                                ),
                                // initialValue: date,
                                mode: DateTimeFieldPickerMode.date,
                                autovalidateMode: AutovalidateMode.always,
                                validator: (e) => (e?.day ?? 0) == 1
                                    ? 'Please not the first day'
                                    : null,

                                onDateSelected: (date) {
                                  setState(() {
                                    selectedDate3 = date;
                                  });
                                },
                              ),
                            )
                          : Container(),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text("Project URL:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Url",
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
                        child: Text("Description:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProximaNova")),
                      ),
                      TextFormField(
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
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Add more options",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff3e61ed),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff3e61ed),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                "Location:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            DropdownSearch<CurrentLocation>(
                              dropdownSearchDecoration: InputDecoration(
                                  border: UnderlineInputBorder()),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null) {
                                  return "Please Select  Location";
                                }
                                return null;
                              },
                              mode: Mode.DIALOG,
                              items: isLoadingCurrentLocation
                                  ? [CurrentLocation()]
                                  : _apiResponseCurrentLocation.data,
                              itemAsString: (CurrentLocation obj) {
                                return obj.cityName;
                              },
                              onFind: (val) async {
                                setState(() {
                                  query = val;
                                });
                                return _apiResponseCurrentLocation.data;
                              },
                              hint: "Select City",
                              onChanged: (value) {
                                jobCategorySearchCon.text =
                                    value.cityName.toString();
                                cityID = value.cityId;
                                print(value.cityId);
                              },
                              showSearchBox: true,
                              popupItemBuilder: (context, CurrentLocation item,
                                  bool isSelected) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(item.cityName),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text("Project Site:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  GFRadio(
                                    size: 20,
                                    activeBorderColor: const Color(0xff3e61ed),
                                    value: 1,
                                    groupValue: groupValue2,
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue2 = value;
                                      });
                                    },
                                    inactiveIcon: null,
                                    radioColor: const Color(0xff3e61ed),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Text(
                                    "Offsite",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  GFRadio(
                                    size: 20,
                                    value: 2,
                                    groupValue: groupValue2,
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue2 = value;
                                      });
                                    },
                                    inactiveIcon: null,
                                    activeBorderColor: const Color(0xff3e61ed),
                                    radioColor: const Color(0xff3e61ed),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Text(
                                    "Onsite",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text("Team Size:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: DropdownButtonFormField<String>(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hint: Text("Select Team Size"),
                                value: mySelectionYear,
                                onChanged: (newValue) {
                                  setState(() {
                                    mySelectionYear = newValue;
                                  });
                                },
                                validator: (value) =>
                                    value == null ? 'Please fill value' : null,
                                items: [
                                  "0",
                                  "1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                  "6",
                                  "7",
                                  "8",
                                  "9",
                                  "10",
                                  "11",
                                  "12"
                                ]
                                    .map(
                                      (value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "ProximaNova"),
                                          )),
                                    )
                                    .toList(),
                              ),
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
                padding: const EdgeInsets.only(right: 22),
                child: GFButton(
                    text: "Save",
                    type: GFButtonType.solid,
                    blockButton: false,
                    onPressed: () async {
                      Navigator.of(context).pop();
                    }

                    // }
                    ),
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
