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
import 'package:job_portal/Models/BasicInfoPopulate.dart';
import 'package:job_portal/Models/CareerPreferencePopulate.dart';
import 'package:job_portal/Models/ItSkillAdd.dart';
import 'package:job_portal/Models/ItSkillRetrive.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/KeySkillProfilePopulate.dart';
import 'package:job_portal/Models/PersonalDetailPopulate.dart';
import 'package:job_portal/Models/ProfessionalPopulate.dart';
import 'package:job_portal/Models/QualificationPopulate.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/Sidebar.dart';
import 'package:job_portal/Views/Profile/UpdateBasic%20Detail.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../Candidate/Inbox.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'AddItskill.dart';
import 'AddKeyskill.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key,this.basic}) : super(key: key);
  String basic ;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  with SingleTickerProviderStateMixin{
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
  bool _status = true;
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
    getBasicInfo();
    getQualification();
    populateKeySkills();
    getProfessional();
    populateCareerPreferenceProfile();
    getPersonal();
    fetchITSkill(query: "");
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
  bool isLoading;
  bool isLoadingPopulateKeySkillsProfile = false;
  bool isLoadingPopulateCareerPreferenceProfile = false;
  ApiResponse<List<ItSkillProfile>> _apiResponse;
  ApiResponse<List<BasicInfoPopulate>> _apiResponse2;
  ApiResponse<List<QualificationPopulate>> _apiResponse3;
  ApiResponse<List<PersonalRetrive>> _apiResponse4;
  ApiResponse<List<PopulateKeySkillsProfileModel>> _apiResponseKeySkillPopulate;
  ApiResponse<List<ProfessionalPopulate>> _apiResponse5;
  ApiResponse<List<PopulateCareerPreferenceProfileModel>> _apiResponseCareerPreferencePopulate;
  ApiServices apiServices =ApiServices();



  getItSkill()async{
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.PopulateItSkill();
    setState(() {
      isLoading = false;
    });
  }
  getBasicInfo()async{
    setState(() {
      isLoading = true;
    });
    _apiResponse2 = await apiServices.PopulateBasicInfo();
    setState(() {
      isLoading = false;
    });
  }
  getQualification() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse3 = await apiServices.PopulateQualification();
    setState(() {
      isLoading = false;
    });
  }

  populateKeySkills() async {
    setState(() {
      isLoadingPopulateKeySkillsProfile = true;
    });
    _apiResponseKeySkillPopulate = await apiServices.getKeySkillsProfile();
    setState(() {
      isLoadingPopulateKeySkillsProfile = false;
    });
  }
  getProfessional() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse5 = await apiServices.ProfessionalDetailsPopulate();
    setState(() {
      isLoading = false;
    });
  }
  populateCareerPreferenceProfile() async {
    setState(() {
      isLoadingPopulateCareerPreferenceProfile = true;
    });
    _apiResponseCareerPreferencePopulate = await apiServices.populateCareerPreferenceProfile();
    setState(() {
      isLoadingPopulateCareerPreferenceProfile = false;
    });
  }
  getPersonal() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse4 = await apiServices.PopulatePersonal();
    setState(() {
      isLoading = false;
    });
  }



  List<Widget> GetBasicInfo() {
    List<Widget> childs = _apiResponse2.data.map((e) =>
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right:25,top:25),
              child: Row(

                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Text(e.candidateName??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact No:',style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),

                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(e.candidateMobile1??"" ,style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),

                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left:25,right:25,top:25),
              child: Row(

                children: [
                  Expanded(
                    flex:2,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),

                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(e.candidateEmail1??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender:',style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(e.candidateGenderName??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25,right:25,top:25),
              child: Row(
                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Experience Tenure:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(e.candidateTotalWorkExp.toString()??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Expanded(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Job Role:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(e.candidateJobroleName??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    )
        .toList();
    return childs;
  }


  List<Widget> GetCareerPreferenceInfo() {
    List<Widget> childs =  _apiResponseCareerPreferencePopulate.data.map((e) =>
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right:25,top:25),
              child: Row(

                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preferred Industry:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5),
                          child: Text(_apiResponseCareerPreferencePopulate.data[0].industryName??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preferred Job Type:',style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),

                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(_apiResponseCareerPreferencePopulate.data[0].jobtypeName??"" ,style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),

                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left:25,right:25,top:25),
              child: Row(

                children: [
                  Expanded(
                    flex:2,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preferred Employment Type:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),

                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(_apiResponseCareerPreferencePopulate.data[0].employmenttypeName??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preferred Job Location:',style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(_apiResponseCareerPreferencePopulate.data[0].cityName??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:25,right:25,top:25),
              child: Row(
                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Salary Expectation:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(_apiResponseCareerPreferencePopulate.data[0].candidateExpectedctc??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Expanded(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Preferred Shift:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(_apiResponseCareerPreferencePopulate.data[0].shiftName??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left:25,right:25,top:25),
              child: Row(
                children: [
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Availability To Join:', style: TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 12.5,
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text(_apiResponseCareerPreferencePopulate.data[0].candidateJoindate??"",style:TextStyle(fontSize: 14.0,fontFamily:"ProximaNova",fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
    )
        .toList();
    return childs;
  }




  List<Widget> getPersonalList() {
    List<Widget> childs = _apiResponse4.data
        .map(
          (e) => Column(
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
                        e.candidateAddress,
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
                        e.cityName,
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
                        e.candidatePin,
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
                        '24-02-1995',
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
                        e.maritalstatusName,
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
                        "${e.candidateExservicemenExp}",
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
                        e.candidatePin,
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
                        e.candidatePassportno,
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
                      child: Text(e.countryName,
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
    )
        .toList();
    return childs;
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
                  }, child: const Text("My Resume",style:TextStyle(
                fontFamily: "ProximaNova",
                fontWeight: FontWeight.bold,
                // letterSpacing: 1.5,
                fontSize: 13.5,
              ),)),
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
                  children:  [
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
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateBasicDetails()));

                        },

                        child: Icon(Iconsax.edit5,color:Color(0xff3e61ed))
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20,),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children:GetBasicInfo(),

                    )
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only( top: 10,left:25,right:25 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
                      onTap: () {},
                      child: const Icon(Iconsax.edit5, color: Color(0xff3e61ed)),
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

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
                      onTap: () {},
                      child: const Icon(Iconsax.edit5, color: Color(0xff3e61ed)),
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
                        professionallist(context),

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
                  children:  [
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
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddSkillsPage(),),);
                        },
                        child: const Icon(Iconsax.edit5,color:Color(0xff3e61ed))
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20,),
                child: Container(
                  width:double.infinity,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 25.0),
                            child:  Wrap(
                              children: _apiResponseKeySkillPopulate.data.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(right : 8.0,top: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black45),
                                    ),
                                    child: Wrap(children: [
                                      Text(e.keyskillName,),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.close),
                                      ),
                                    ]),
                                  ),
                                );
                              }).toList(),
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ItSkillAdds())).then((value) => getItSkill()
                          );
                        },

                        child: Icon(Icons.add,color:Color(0xff3e61ed))
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20,),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15,right:15,top: 10),
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
                  children:  [
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
                      onTap: () {},
                      child: const Icon(Iconsax.edit5, color: Color(0xff3e61ed)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20,),
                child: Card(
                  elevation: 5,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        children:GetCareerPreferenceInfo(),

                      )
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
                      onTap: () {},
                      child: const Icon(Iconsax.edit5, color: Color(0xff3e61ed)),
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
                      children:getPersonalList(),
                    ),
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
                        onTap: () {

                        },
                        child: Icon(Icons.edit,color:Color(0xff3e61ed))
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20,),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: selectFile,
                          child: Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                dashPattern: [10, 4],
                                strokeCap: StrokeCap.round,
                                color: Colors.blue.shade400,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade50.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
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
                                            fontSize: 15, color: Colors.grey.shade400),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        _platformFile != null
                            ? Container(
                            padding: EdgeInsets.all(20),
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
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            offset: Offset(0, 1),
                                            blurRadius: 3,
                                            spreadRadius: 2,
                                          )
                                        ]),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.file(
                                              _file,
                                              width: 70,
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _platformFile.name,
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${(_platformFile.size / 1024).ceil()} KB',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey.shade500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                  height: 5,
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  child: LinearProgressIndicator(
                                                    value: loadingController.value,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )),
                                SizedBox(
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
  // professional populate
  Widget professionallist(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      itemCount: _apiResponse5.data.length,
      itemBuilder: (_, index) {
        return Container(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey[500])),
          child: Column(children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _apiResponse5.data[index].candidateexpOrganizationId
                            .toString(),
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
                        _apiResponse5.data[index].OrganizationName,
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
                          _apiResponse5.data[index].Designation,
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
                          _apiResponse5.data[index].Experience,
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
                          _apiResponse5.data[index].StartDate,
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
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _apiResponse5.data[index].EndDate,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: "ProximaNova",
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 12.0,
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
                          "${_apiResponse5.data[index].Salary}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 12.0,
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
                          "${_apiResponse5.data[index].NoticePeriod}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ]),
        );
      },
    );
  }
  // itskill populate
  Widget ItSkillGrid (BuildContext context){
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _apiResponse.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:(1/.43),
          crossAxisSpacing: 5,
          mainAxisSpacing: 6,
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
      itemBuilder: (BuildContext context, int index) {
        return
            Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey[500])
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_apiResponse.data[index].itskillName,style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                        ),),

                        Icon(Iconsax.edit5,color: KColors.primary),

                      ],),


                    Text(_apiResponse.data[index].candidateitskillExperience??"2 years",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 10.5,
                      ),),



                    RichText(text: TextSpan(text:"Last Used:",style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 12.5,
                    ),
                        children: [

                          TextSpan(text: _apiResponse.data[index].candidateitskillLastused.toString(), style: TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),
                        ]),),

                    RichText(text: TextSpan(text:"Version:",style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 12.5,
                    ),
                        children: [

                          TextSpan(text: _apiResponse.data[index].candidateitskillVersion.toString(), style: TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),),
                        ]),),

                  ],
                ));

      },
    );
  }

  Widget qualificationList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      itemCount: _apiResponse2.data.length,
      itemBuilder: (_, index) {
        return Container(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color:  Colors.grey[500])
          ),
          child: Column(children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _apiResponse3.data[index].QualificationName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,

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
                        _apiResponse3.data[index].CourseName == ""
                            ? _apiResponse3.data[index].getBoardName +
                            "-" +
                            _apiResponse3.data[index].SchoolmediumName
                            : _apiResponse3.data[index].CourseName +
                            "-" +
                            _apiResponse3.data[index].StreamName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,

                          fontSize: 15.0,
                        ),
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
                          _apiResponse3.data[index].InstituteName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,

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
                          _apiResponse3.data[index].CandidatequalCompletionYear,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,

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





