import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/ItSkillAdd.dart';
import 'package:job_portal/Models/ItSkillRetrive.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/PersonalDetails.dart';
import 'package:job_portal/Models/PersonalDetailsRetrive.dart';
import 'package:job_portal/Models/QualificationPopulate.dart';
import 'package:job_portal/Models/qualification-post.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/Sidebar.dart';
import 'package:job_portal/Views/SignIn/Step8-PersonalDetails.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../Candidate/Inbox.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'AddItskill.dart';
import 'PersonalUpdate.dart';
import 'QualificationAdd.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.basic, this.keyjwt}) : super(key: key);
  String basic;
  String keyjwt;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final itemKey = GlobalKey();
  final skillKey = GlobalKey();

  // bool  get key  => widget.ite47mKey != null;
  Future scrollToItem() async {
    final context = itemKey.currentContext;
    await Scrollable.ensureVisible(context);
  }

  Future scrollToItems() async {
    final context = skillKey.currentContext;
    await Scrollable.ensureVisible(context);
  }

  int groupValue = 0;
  final bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  AnimationController loadingController;

  File _file;
  PlatformFile _platformFile;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(allowMultiple: true);
    // type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']
    if (file != null) {
      setState(() {
        _file = File(file.files.single.path);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }

  @override
  void initState() {
    getItSkill();
    getPersonal();
    getQualification();
    // fetchITSkill(query: "");
    // if(widget.basic != null){
    //   setState(() {
    //     scrollToItem();
    //   });
    //
    //   print(widget.basic);
    //    }
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  ApiResponse<List<ItSkillProfile>> _apiResponse;
  ApiResponse<List<QualificationPopulate>> _apiResponse2;
  ApiResponse<List<PersonalRetrive>> _apiResponse3;
  ApiServices apiServices = ApiServices();
  QualificationPopulate qualify;
  bool isLoading;
  String errorMessage;

  getPersonal() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse3 = await apiServices.PopulatePersonal();
    setState(() {
      isLoading = false;
    });
  }

  getQualification() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse2 = await apiServices.PopulateQualification();
    setState(() {
      isLoading = false;
    });
  }

  getItSkill() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.PopulateItSkill();
    setState(() {
      isLoading = false;
    });
  }

  TextEditingController skillSearchCont = TextEditingController();
  String queries;
  ApiResponse<List<ITSkill>> _apiResponseITSkill;
  String itSkillId = "";

  fetchITSkill({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseITSkill = await apiServices.getITSkill(query: query);
    setState(() {
      isLoading = false;
    });
  }

  List<Widget> getPersonalList() {
    List<Widget> childs = _apiResponse3.data
        .map(
          (e) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PERSONAL DETAILS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalUpdate(
                                      Address: e.candidateAddress,
                                      City: e.cityName,
                                      PinCode: e.candidatePin,
                                      DOB: e.candidateDob,
                                      Marry: e.maritalstatusName,
                                      Nationality: e.countryName,
                                      Pan: e.candidatePancard,
                                      Pass: e.candidatePassportno,
                                    ))).then((value) => getPersonal());
                      },
                      child: Icon(
                        Icons.edit,
                        color: Color(0xff3e61ed),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text('Address:',
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.5,
                                      )),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                e.candidateAddress ?? "",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'City:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                e.cityName ?? "",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Pincode: ',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                e.candidatePin ?? "",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'D.O.B:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                e.candidateDob ?? '24-02-1995',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Marital Status:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                e.maritalstatusName ?? "",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Category:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                'OM',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Ex-Servicemen Experience:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                "${e.candidateExservicemenExp}" ?? "",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'PAN Number:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                e.candidatePin ?? "",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Nationality:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                'Indian',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Passport Number:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(
                                e.candidatePassportno ?? "",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  Text(
                                    'Country:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                  child: Text(e.countryName ?? "",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold))),
                            ],
                          )),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: context.read<MenuController>().scaffoldKeys,
        drawer: const SideMenu(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: context.read<MenuController>().controlMenu2,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Images.user1),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            color: KColors.lightGrey,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "What are you looking for?",
                          style:
                              TextStyle(fontSize: 15, color: KColors.subtitle),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.chat,
                        color: Color(0xff3e61ed),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InboxList()));
                      },
                    ),
                  ],
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
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: ExactAssetImage('assets/as.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 70.0, right: 80.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // _showPicker(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 15.0,
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
              const Text(
                "Isra Riaz",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Senior Software Developer, ClustTech",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 14.5,
                ),
              ),
              GFButton(
                  color: const Color(0xff3e61ed),
                  onPressed: () {
                    selectFile();
                    // Navigator.push(context, MaterialPageRoute(builder: (
                    //     context) => SkillsAndEducation()));
                  },
                  child: const Text(
                    "My Resume",
                    style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 1.5,
                      fontSize: 13.5,
                    ),
                  )),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 10,
                endIndent: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //   GFButton(onPressed: (){
              //     scrollToItems();
              //   }, child: Text("Skills"),),
              //   GFButton(onPressed: (){
              //     scrollToItem();
              //   } , child: Text("Location"),),
              // ],),

              Padding(
                padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "BASIC INFORMATION",
                      style: TextStyle(
                        fontFamily: "ProximaNova-Regular",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Basic Information"),
                          content: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              ' Name',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: "Full Name"),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Email ID',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Email ID"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Gender",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
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
                                        "Male",
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
                                        "Female",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GFRadio(
                                        size: 20,
                                        activeBorderColor:
                                            const Color(0xff3e61ed),
                                        value: 3,
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
                                        "Others",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //     padding: const EdgeInsets.only(
                                //         top: 25.0),
                                //     child:  Row(
                                //       mainAxisSize: MainAxisSize.max,
                                //       children: <Widget>[
                                //         Column(
                                //           mainAxisAlignment: MainAxisAlignment.start,
                                //           mainAxisSize: MainAxisSize.min,
                                //           children: const <Widget>[
                                //             Text(
                                //               'Date Of Birth',
                                //               style: TextStyle(
                                //                   fontSize: 16.0,
                                //                   fontWeight: FontWeight.bold),
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     )),
                                // Padding(
                                //     padding: const EdgeInsets.only(
                                //         top: 2.0),
                                //     child:  Row(
                                //       mainAxisSize: MainAxisSize.max,
                                //       children: <Widget>[
                                //         Flexible(
                                //           child:  TextField(
                                //             decoration: const InputDecoration(
                                //                 hintText: "Date Of Birth"),
                                //             enabled: !_status,
                                //           ),
                                //         ),
                                //       ],
                                //     )),

                                Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              ' Experience Tenure',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Tenure"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),

                                Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              ' Job Role',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Role"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Mobile No ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Mobile No"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                              ])),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GFButton(
                                      color: const Color(0xff3e61ed),
                                      onPressed: () {
                                        // Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Save",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontWeight: FontWeight.bold,
                                          // letterSpacing: 1.5,
                                          fontSize: 13.5,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      child: const Icon(Icons.edit, color: Color(0xff3e61ed)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      ' Name :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                  child: Text('Isra Riaz',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)
                                      // decoration: const InputDecoration(
                                      //     hintText: "Full Name"),

                                      ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Email ID :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('isra24@gmail.com',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            children: const [
                              Text(
                                "Gender :",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                  child: Text('Female',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)
                                      // decoration: const InputDecoration(
                                      //     hintText: "Full Name"),

                                      ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      ' Experience Tenure :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('1 year ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87))),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      ' Job Role :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('Front End  ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87))),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Mobile No :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('123456789',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "QUALIFICATION DETAILS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QualificationAdd()))
                            .then((value) => getQualification());
                      },
                      child: const Icon(Icons.edit, color: Color(0xff3e61ed)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 10),
                    child: Column(
                      children: [
                        qualificationList(context),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Profile Headline :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text('Summary of the Profile',
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Highest Qualification :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text("jhvb",
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Course :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text('Btech',
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Course Type :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text('Correspondence',
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Institute Qualified From :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text('JU',
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Passing Year :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text('2021',
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Grading System :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text('CGPA',
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 25.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: const <Widget>[
                        //             Text(
                        //               'Grade Value :',
                        //               style: TextStyle(
                        //                 fontSize: 14.0,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 25.0, right: 25.0, top: 5.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: const <Widget>[
                        //         Flexible(
                        //             child: Text('13',
                        //                 style: TextStyle(
                        //                     fontSize: 15.0,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PROFESSIONAL DETAILS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                    title: const Text('Professional Details'),
                                    content: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Column(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: const <Widget>[
                                                        Text(
                                                          'Current Organization Name',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: const <Widget>[
                                                    Flexible(
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "Add Organization"),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: const <Widget>[
                                                        Text(
                                                          'Current Designation',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: const <Widget>[
                                                    Flexible(
                                                      child: TextField(
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "Add Designation"),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: const <Widget>[
                                                        Text(
                                                          'Current Salary',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: const <Widget>[
                                                    Flexible(
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "Add Salary"),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: const <Widget>[
                                                        Text(
                                                          'Working Since',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: const <Widget>[
                                                    Flexible(
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "Add Detail"),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, top: 20, bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GFButton(
                                                color: const Color(0xff3e61ed),
                                                onPressed: () {
                                                  // Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Save",
                                                  style: TextStyle(
                                                    fontFamily: "ProximaNova",
                                                    fontWeight: FontWeight.bold,
                                                    // letterSpacing: 1.5,
                                                    fontSize: 13.5,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      )
                                    ])),
                        child: const Icon(Icons.edit, color: Color(0xff3e61ed)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Current Organization Name :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('Clustech',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Current Designation:',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('Developer',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Current Salary :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('10000',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Working Since :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('2021',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                key: skillKey,
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      " KEY SKILLS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Key Skills',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Add Skills"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 20, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GFButton(
                                              color: const Color(0xff3e61ed),
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Save",
                                                style: TextStyle(
                                                  fontFamily: "ProximaNova",
                                                  fontWeight: FontWeight.bold,
                                                  // letterSpacing: 1.5,
                                                  fontSize: 13.5,
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                        child: const Icon(Icons.edit, color: Color(0xff3e61ed)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Key Skills :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text('Add Skills',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "IT SKILLS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItSkillAdds()))
                              .then((value) => getItSkill());
                        },
                        child: const Icon(Icons.add, color: Color(0xff3e61ed)))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          child: ItSkillGrid(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "CAREER PREFERENCES",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text('Career Preference'),
                                  content: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Preferred Industry',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Add Industry"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Preferred Job Type',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Add Type"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Preferred Employment Type',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Add Type"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Preferred Job Location',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Add Location"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Salary Expectation',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Add Expectation"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Preferred Shift',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Add Shift"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text(
                                                        'Availability To Join',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: const <Widget>[
                                                  Flexible(
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Add Location"),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 20, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GFButton(
                                              color: const Color(0xff3e61ed),
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Save",
                                                style: TextStyle(
                                                  fontFamily: "ProximaNova",
                                                  fontWeight: FontWeight.bold,
                                                  // letterSpacing: 1.5,
                                                  fontSize: 13.5,
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                        child: const Icon(
                          Icons.edit,
                          color: Color(0xff3e61ed),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Preferred Industry :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text(
                                  'Automobile',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Preferred Job Type :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text(
                                  'Automobile',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Preferred Employment Type : ',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text(
                                  'Contractual',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Preferred Job Location :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text(
                                  'Bangalore',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Salary Expectation :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text(
                                  '30000',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Preferred Shift :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text(
                                  'Flexible',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Availability To Join :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const <Widget>[
                                Flexible(
                                    child: Text(
                                  'Immediate',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              Column(
                children: getPersonalList(),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "UPLOAD RESUME",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child:
                            const Icon(Icons.edit, color: Color(0xff3e61ed))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: selectFile,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                color: Colors.blue.shade400,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.blue.shade50.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Iconsax.folder_open,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Select your file',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade400),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        _platformFile != null
                            ? Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selected File',
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade200,
                                                offset: const Offset(0, 1),
                                                blurRadius: 3,
                                                spreadRadius: 2,
                                              )
                                            ]),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.file(
                                                  _file,
                                                  width: 70,
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _platformFile.name,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${(_platformFile.size / 1024).ceil()} KB',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors
                                                            .grey.shade500),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      height: 5,
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color:
                                                            Colors.blue.shade50,
                                                      ),
                                                      child:
                                                          LinearProgressIndicator(
                                                        value: loadingController
                                                            .value,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // MaterialButton(
                                    //   minWidth: double.infinity,
                                    //   height: 45,
                                    //   onPressed: () {},
                                    //   color: Colors.black,
                                    //   child: Text('Upload', style: TextStyle(color: Colors.white),),
                                    // )
                                  ],
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            // edited
          ),
        ),
      ),
    );
  }

  Widget qualificationList(BuildContext context) {
    return  isLoading ? Center(child: CircularProgressIndicator(),):ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      itemCount: _apiResponse2.data.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QualificationAdd(
              uuid: _apiResponse2.data[index].candidatequalUuid,
            )));
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _apiResponse2.data[index].QualificationName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _apiResponse2.data[index].CourseName == ""
                              ? _apiResponse2.data[index].getBoardName +
                                  "-" +
                                  _apiResponse2.data[index].SchoolmediumName
                              : _apiResponse2.data[index].CourseName +
                                  "-" +
                                  _apiResponse2.data[index].StreamName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            final insert = QualificationPost(
                              requestType: "delete",
                                candidatequalUuid: _apiResponse2.data[index].candidatequalUuid
                            );

                            final result =
                            await apiServices.qualificationAdd(insert);
                            setState(() {
                              isLoading = false;
                            });
                            if (result.data) {
                              print("-----------SUCCESS------------");
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //   content: Row(children: const [
                              //     Icon(
                              //       Icons.done_outlined,
                              //     ),
                              //     SizedBox(width: 7),
                              //     Text("Successfully Deleted"),
                              //   ]),
                              //   backgroundColor: Colors.green,
                              //   duration: const Duration(milliseconds: 2500),
                              // ));
                              // setState(() {
                              //   getQualification();
                              // });
                            } else {
                              print("-----------ERROR------------");

                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //   content: Row(
                              //     children: const [
                              //       Icon(Icons.error),
                              //       SizedBox(width: 7),
                              //       Text("An Error Occured"),
                              //     ],
                              //   ),
                              //   backgroundColor: Colors.red,
                              //   duration: const Duration(milliseconds: 2500),
                              // ));
                            }
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _apiResponse2.data[index].InstituteName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _apiResponse2.data[index].CandidatequalCompletionYear,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
              // Row(
              //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               _apiResponse2.data[index].CourseName,
              //               overflow: TextOverflow.ellipsis,
              //               style: const TextStyle(
              //                 color:Colors.grey,
              //                 fontFamily: "ProximaNova",
              //                 // fontWeight: FontWeight.bold,
              //                 letterSpacing: 1.5,
              //                 fontSize: 12.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "${_apiResponse2.data[index].CandidatequalStartYear}",
              //               overflow: TextOverflow.ellipsis,
              //               style: const TextStyle(
              //                 fontFamily: "ProximaNova",
              //                 color:Colors.grey,
              //                 // fontWeight: FontWeight.bold,
              //                 letterSpacing: 1.5,
              //                 fontSize: 12.0,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ]),
            ]),
          ),
        );
      },
    );
  }

  Widget ItSkillGrid(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _apiResponse.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1 / .43),
          crossAxisSpacing: 5,
          mainAxisSpacing: 6,
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItSkillAdds(
                            uuid: _apiResponse.data[index].candidateitskillUuid,
                        )));
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _apiResponse.data[index].candidateitskillName ?? "",
                      style: const TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 15.0,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: ()async{
                    //     setState(() {
                    //       isLoading = true;
                    //     });
                    //     final insert = ItSkillAdd(
                    //       requestType:"delete",
                    //       candidateitskillItskillId: _apiResponse.data[index].candidateitskillItskillId,
                    //       candidateitskillCandidateId: 1,
                    //       // candidateitskillExperience: int.parse(_apiResponse.data[index].candidateitskillExperience),
                    //       candidateitskillLastused: _apiResponse.data[index].candidateitskillLastused,
                    //       candidateitskillVersion: _apiResponse.data[index].candidateitskillVersion
                    //     );
                    //     print(itSkillId);
                    //     print(itSkillId);
                    //     final result = await apiServices.itSkillDelete(insert);
                    //     setState(() {
                    //       isLoading = false;
                    //     });
                    //     // if(result.data){
                    //     //   Navigator.pop(context);
                    //     // }
                    //     // else{
                    //     //   print("error");
                    //     // }
                    //
                    //
                    //     const title = "Done";
                    //     final text = result.error
                    //         ? (result.errorMessage ?? "An Error Occurred")
                    //         : "Successfully Deleted";
                    //     showDialog(
                    //       context: context,
                    //       builder: (_) => AlertDialog(
                    //         title: const Text(title),
                    //         content: Text(text),
                    //         actions: [
                    //           ElevatedButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text("OK"))
                    //         ],
                    //       ),
                    //     ).then((data) {
                    //       if (result.data) {
                    //         Navigator.of(context).pop();
                    //
                    //       }
                    //     });
                    //   },
                    //     child: Icon(Icons.delete,color: KColors.primary)),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = ItSkillAdd(
                            requestType: "delete",
                            candidateitskillUuid: _apiResponse
                                .data[index].candidateitskillUuid,
                          );
                          print(itSkillId);
                          print(itSkillId);
                          final result =
                              await apiServices.itSkillDelete(insert);
                          setState(() {
                            isLoading = false;
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
                            setState(() {
                              getItSkill();
                            });
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
                        },
                        child: const Icon(Icons.edit_outlined,
                            color: KColors.primary)),
                  ],
                ),
                Text(
                  _apiResponse.data[index].candidateitskillExperience ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 10.5,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "Last Used:",
                      style: const TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 12.5,
                      ),
                      children: [
                        TextSpan(
                          text: _apiResponse
                                  .data[index].candidateitskillLastused
                                  .toString() ??
                              "",
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                    text: "Version:",
                    style: const TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 12.5,
                    ),
                    children: [
                      TextSpan(
                        text: _apiResponse.data[index].candidateitskillVersion
                                .toString() ??
                            "",
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 14.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up the Controllers when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}
// Padding(
// padding: const EdgeInsets.only(
// left: 25.0, right: 25.0, top: 25.0),
// child:  Row(
// mainAxisSize: MainAxisSize.max,
// children: <Widget>[
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,
// children: const <Widget>[
// Text(
// 'Date Of Birth',
// style: TextStyle(
// fontSize: 14.0,
// ),
// ),
// ],
// ),
// ],
// )),
// Padding(
// padding: const EdgeInsets.only(
// left: 25.0, right: 25.0, top: 5.0),
// child:  Row(
// mainAxisSize: MainAxisSize.max,
// children: <Widget>[
// Flexible(
// child:  Text('24/02/2020',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),
//
//
// ),
// ),
// ],
// )),
