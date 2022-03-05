import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/Country.dart';
import 'package:job_portal/Models/GetCategory.dart';
import 'package:job_portal/Models/GetMarital.dart';
import 'package:job_portal/Models/Nationality.dart';
import 'package:job_portal/Models/PersonalDetails-post.dart';
import 'package:job_portal/Models/location.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Utility/Connect.dart';
import 'package:job_portal/Views/Candidate/BottomNavbar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class PersonalDetails extends StatefulWidget {
   PersonalDetails({Key key, this.uuid}) : super(key: key);
   String uuid;
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
// Global formKey
  var formKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  // text controllers
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController disabilityController = TextEditingController();
  TextEditingController assistanceController = TextEditingController();
  TextEditingController passportController = TextEditingController();

  // controllers for searchable dropdown
  TextEditingController citySearchCon = TextEditingController();
  TextEditingController nationalitySearchCon = TextEditingController();
  TextEditingController countrySearchCon = TextEditingController();

  // ID's for fields
  int totalExp = 0;
  String cityNameID = "";
  String nationalityID = "";
  String countryID = "";

  //general variables
  Marital Marial;
  Category Caste;
  DateTime selectedDate;
  DateTime lastDate = DateTime.now();
  // int start = DateTime.now() - 50;
  int groupValue = 0;
  int groupValue2 = 0;
  YearPicker selectedDate2;
  String query;
  String query1;
  String query2;
  int exservicemenGroupValue = 0;
  String dropdownValue;
  String mySelection;
  String mySelectionYear;
  String mySelectionMonth;

  // API RESONSE GENERIC OBJECTS
  ApiResponse<List<Cities>> _apiResponse;
  ApiResponse<List<Nationality>> _apiResponse2;
  ApiResponse<List<Country>> _apiResponse3;
  ApiResponse<List<Category>> _apiResponse4;
  ApiResponse<List<Marital>> _apiResponse5;
  ApiServices apiServices = ApiServices();
  bool isLoading = false;

  @override
  void initState() {
    fetchCaste();
    fetchMarital();
    fetchCity(query: "");
    fetchNationality(query: "");
    fetchCountry(query: "");
    super.initState();
  }

  fetchMarital() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse5 = await apiServices.getMarital();
    setState(() {
      isLoading = false;
    });
  }

  fetchCaste() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse4 = await apiServices.getCaste();
    setState(() {
      isLoading = false;
    });
  }

  fetchCity({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.getCity(query: query);
    setState(() {
      isLoading = false;
    });
  }

  // List<String> getCity() {
  //   List<Cities> getLoc = _apiResponse.data;
  //   List<String> locData = [];
  //   for (int i = 0; i < getLoc.length; i++) {
  //     locData.add(getLoc[i].cityName);
  //   }
  //   return locData;
  // }

  String City;

  fetchNationality({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse2 = await apiServices.getNationality(query: query);
    setState(() {
      isLoading = false;
    });
  }


  String Nationalities;

  fetchCountry({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponse3 = await apiServices.getCountry(query: query);
    setState(() {
      isLoading = false;
    });
  }



  String Countries;

  RichText getRequiredLabel({String fieldName}) {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaNova"),
          text: fieldName,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const TextSpan(text: '*', style: TextStyle(color: Colors.red)),
          ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Personal Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova"),
                    ),
                    Text(
                      "Add personal datails to complete your profile",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "ProximaNova",
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/as.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    // _showPicker(context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.blueGrey,
                                    radius: 25.0,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ]),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        child: FormBuilder(
                          key: _fbKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 10, bottom: 10, right: 25),
                                child: Text(
                                  "Permanent Address",
                                  style: TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 18.5,
                                  ),
                                ),
                              ),
                              const Text(
                                'Address',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProximaNova"),
                              ),
                              TextFormField(
                                controller: addressController,

                                decoration: const InputDecoration(
                                  hintText: "Address",
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
                                height: 15,
                              ),
                              const Text('City',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownSearch<Cities>(
                                dropdownSearchDecoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                    )
                                ),

                                mode: Mode.DIALOG,
                                items: isLoading ? Cities() : _apiResponse.data,
                                itemAsString: (Cities obj) {
                                  return obj.cityName;
                                },
                                onFind: (val) async {
                                  setState(() {
                                    query = val;
                                  });
                                  return _apiResponse.data;
                                },
                                hint: "Select City Name",
                                onChanged: (value) {
                                  citySearchCon.text = value.cityId.toString();
                                  cityNameID = value.cityId;
                                  print(value.cityId);
                                },
                                showSearchBox: true,
                                popupItemBuilder:
                                    (context, Cities item, bool isSelected) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(item.cityName),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text('Pin Code',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                              TextFormField(
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                                ],
                                controller: pincodeController,
                                decoration: const InputDecoration(
                                  hintText: "Pin Code",
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
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15, right: 25),
                                child: Text("Date of birth",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DateTimeFormField(
                                firstDate: DateTime(lastDate.year-50) ,
                                lastDate: lastDate,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: 'Date of birth',
                                  // hintStyle: heading6.copyWith(color: textGrey),
                                  // errorStyle: TextStyle(color: Colors.redAccent),
                                  suffixIcon: Icon(Icons.event_note),
                                ),
                                // initialValue: date,
                                mode: DateTimeFieldPickerMode.date,
                                // autovalidateMode: AutovalidateMode.always,
                                validator: (e) {
                                  if(e == null){
                                    return "Enter Date of birth";
                                  }else{
                                    return null;
                                  }
                                },

                                onDateSelected: (date) {
                                  setState(() {
                                    selectedDate = date;
                                    print(selectedDate);
                                  });
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15, right: 25),
                                child: Text("Marital Status",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField<Marital>(
                                hint: const Text(
                                  "Select Status",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova"),
                                ),
                                value: Marial,
                                onChanged: (Marital newValue) {
                                  setState(() {
                                    Marial = newValue;
                                  });
                                },

                                items: _apiResponse5.data.map((Marital user) {
                                  return DropdownMenuItem<Marital>(
                                    value: user,
                                    child: Text(
                                      user.maritalName,
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15, right: 25),
                                child: Text("Category",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField<Category>(
                                hint: const Text(
                                  "Category",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova"),
                                ),
                                value: Caste,
                                onChanged: (Category newValue) {
                                  setState(() {
                                    Caste = newValue;
                                  });
                                },

                                items: _apiResponse4.data.map((Category user) {
                                  return DropdownMenuItem<Category>(
                                    value: user,
                                    child: Text(
                                      user.reservedName,
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Text(
                                  "Ex-servicemen",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova"),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    GFRadio(
                                      size: 20,
                                      activeBorderColor:
                                          const Color(0xff2972ff),
                                      value: 1,
                                      groupValue: exservicemenGroupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          exservicemenGroupValue = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      radioColor: const Color(0xff2972ff),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "ProximaNova"),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GFRadio(
                                      size: 20,
                                      value: 2,
                                      groupValue: exservicemenGroupValue,
                                      onChanged: (value) {
                                        setState(() {
                                          exservicemenGroupValue = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      activeBorderColor:
                                          const Color(0xff2972ff),
                                      radioColor: const Color(0xff2972ff),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      "No",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "ProximaNova"),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              exservicemenGroupValue == 1
                                  ? const Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "Ex-servicemen Experience",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "ProximaNova"),
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(
                                height: 3,
                              ),
                              exservicemenGroupValue == 1
                                  ?
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: DropdownButtonFormField<String>(


                                          hint: Text("Years"),
                                          value: mySelectionYear,
                                          onChanged: (newValue) {
                                            setState(() {
                                              mySelectionYear = newValue;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Select Year'
                                              : null,
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
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      "ProximaNova"),
                                                )),
                                          )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: DropdownButtonFormField<String>(


                                          hint: Text("Months"),
                                          value: mySelectionMonth,
                                          onChanged: (newValue) {
                                            setState(() {
                                              mySelectionMonth = newValue;
                                            });
                                          },
                                          validator: (value) => value == null
                                              ? 'Select Month'
                                              : null,
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
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      "ProximaNova"),
                                                )),
                                          )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  : Container(),

                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Disability",
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
                                      value: 2,
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
                              groupValue == 1
                                  ?  Padding(
                                      padding: EdgeInsets.only(
                                        top: 15,
                                      ),
                                      child: getRequiredLabel(fieldName: "Disablity"),
                                    )
                                  : Container(),
                              groupValue == 2
                                  ? const SizedBox(
                                      height: 5,
                                    )
                                  : Container(),
                              groupValue == 1
                                  ? TextFormField(
                                validator: (input){
                                  if(input.isEmpty){
                                    return "Enter Disability Type";
                                  }else{
                                    return null;
                                  }
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                ],
                                      controller: disabilityController,
                                      decoration: const InputDecoration(
                                        hintText: "Disability Type",
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
                              groupValue == 1
                                  ?  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                      ),
                                      child: getRequiredLabel(fieldName: "Describe Assistance Required"),
                                    )
                                  : Container(),
                              groupValue == 2
                                  ? const SizedBox(
                                      height: 5,
                                    )
                                  : Container(),
                              groupValue == 1
                                  ? TextFormField(

                                validator: (input){
                                  if(input.isEmpty){
                                    return "Enter Describe Assistance Required";
                                  }else{
                                    return null;
                                  }
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                ],
                                      controller: assistanceController,
                                      decoration: const InputDecoration(
                                        hintText: "Describe Assistance Required",
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
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("PAN Number",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              ),
                              // EDit
                              TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[A-Z+0-9]"))
                                ],
                                controller: panController,
                                decoration: const InputDecoration(
                                  hintText: "PAN Number",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.5,
                                  ),
                                ),
                                maxLength: 10,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value){
                                  if(Connect.validateMyPan(value)){
                                    return null;
                                  }if(value.isEmpty){
                                    return null;
                                  }
                                  else{
                                    return "Enter Valid PAN Number";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('Nationality',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "ProximaNova")),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownSearch<Nationality>(
                                dropdownSearchDecoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                    )
                                ),

                                mode: Mode.DIALOG,
                                items: isLoading
                                    ? Nationality()
                                    : _apiResponse2.data,
                                itemAsString: (Nationality obj) {
                                  return obj.countryNationality;
                                },
                                onFind: (val) async {
                                  setState(() {
                                    query = val;
                                  });
                                  return _apiResponse2.data;
                                },
                                hint: "Select Nationality",
                                onChanged: (value) {
                                  nationalitySearchCon.text =
                                      value.countryId.toString();
                                  nationalityID = value.countryId;
                                  print(value.countryId);
                                },
                                showSearchBox: true,
                                popupItemBuilder: (context, Nationality item,
                                    bool isSelected) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(item.countryNationality),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Passport Number",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "ProximaNova")),
                              ),
                              TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp("[A-Z+0-9]"))
                                ],
                                controller: passportController,
                                decoration: const InputDecoration(
                                  hintText: "Passport Number",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.5,
                                  ),
                                ),
                                maxLength: 9,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value){
                                  if(Connect.validateMyPassport(value)){
                                    return null;
                                  }if(value.isEmpty){
                                    return null;
                                  }
                                  else{
                                    return "Enter Valid Passport Number";
                                  }
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Text("Work Permits",
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
                                      value: 2,
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
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: DropdownSearch<Country>(

                                        mode: Mode.DIALOG,
                                        items: isLoading
                                            ? Country()
                                            : _apiResponse3.data,
                                        itemAsString: (Country obj) {
                                          return obj.countryName;
                                        },
                                        onFind: (val) async {
                                          setState(() {
                                            query = val;
                                          });
                                          return _apiResponse3.data;
                                        },
                                        hint: "Select Country",
                                        onChanged: (value) {
                                          countrySearchCon.text =
                                              value.countryId.toString();
                                          countryID = value.countryId;
                                          print(value.countryId);
                                        },
                                        showSearchBox: true,
                                        popupItemBuilder: (context,
                                            Country item, bool isSelected) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(item.countryName),
                                              ),
                                            ),
                                          );
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
                              if (_fbKey.currentState.saveAndValidate()) {
                                print(
                                    totalExp == 0 ? totalExp : totalWorkExp());
                                print(int.parse(Marial.maritalId));
                                print(int.parse(Caste.reservedId));
                                print(addressController.text);
                                print(cityNameID);
                                print(selectedDate);
                                print(pincodeController.text);
                                print(panController.text);

                                setState(() {
                                  isLoading = true;
                                });

                                final insert = PersonalDetailsPost(
                                candidateUuid: widget.uuid,
                                candidateAddress: addressController.text,
                                candidateDob: selectedDate,
                                candidateCityId: int.parse(cityNameID),
                                candidatePin: pincodeController.text,
                                candidateMaritalstatusId:
                                int.parse(Marial.maritalId),
                                candidateReservedcategoryId: int.parse(Caste.reservedId),
                                candidateExservicemen: exservicemenGroupValue.toString(),
                                candidatePassportno: passportController.text,
                                candidatePancard: panController.text,
                                candidateExservicemenExp:
                                totalExp == 0 ? totalExp : totalWorkExp(),
                                candidateDifferentlyAbled:
                                groupValue.toString(),
                                candidateDisabilitType:
                                disabilityController.text,
                                candidateDisabilityAssistance:
                                assistanceController.text,
                                candidateNationalityId:
                                int.parse(nationalityID),
                                candidateWorkpermitcountryId:
                                int.parse(countryID),
                              );
                                final result =
                                    await apiServices.PostPersonal(insert);
                                setState(() {
                                  isLoading = false;
                                });
                                const title = "Done";
                                final text = result.error
                                    ? (result.errorMessage ??
                                        "An Error Occurred")
                                    : "Successfully Created";
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text(title),
                                          content: Text(text),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("OK"))
                                          ],
                                        )).then((data) {
                                  if (result.data) {
                                    Navigator.pushAndRemoveUntil(context,      MaterialPageRoute(
                                      builder: (context) => Navbar(),
                                    ), (route) => false);
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Navbar(),
                                    //   ),
                                    // );
                                  }
                                }
                                );
                              }
                            },
                            text: "Next",
                            type: GFButtonType.solid,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
    );
  }

  int totalWorkExp() {
    totalExp = (int.parse(mySelectionYear) * 12) + int.parse(mySelectionMonth);
    return totalExp;
  }



}
