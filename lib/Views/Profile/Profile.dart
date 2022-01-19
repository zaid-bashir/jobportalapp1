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
import 'package:job_portal/Models/ItSkillRetrive.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/Sidebar.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../Candidate/Inbox.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
  List<Widget> getItSkills() {
    List<Widget> childs = _apiResponse.data.map((e) =>
        Wrap(children: <Widget>[

          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff3e61ed))
                ),
                child: Text(e.itkillName ?? "",style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 16.5,
                ),)),
          ),

        ]))
        .toList();
    return childs;
  }
  ApiResponse<List<ItSkillProfile>> _apiResponse;
  ApiServices apiServices =ApiServices();

  bool isLoading;



  getItSkill()async{
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
                      onTap: () => showDialog(context: context, builder: (_) => AlertDialog(
                        title:Text("Basic Information"),
                        content:    Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Full Name"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Enter Email ID"),
                                              enabled: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
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
                                          activeBorderColor: const Color(0xff3e61ed),
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
                                          activeBorderColor: const Color(0xff3e61ed),
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
                                          activeBorderColor: const Color(0xff3e61ed),
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
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Enter Tenure"),
                                              enabled: !_status,
                                            ),
                                          ),
                                        ],
                                      )),


                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Enter Role"),
                                              enabled: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Enter Mobile No"),
                                              enabled: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                ]
                            )
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GFButton(
                                    color: const Color(0xff3e61ed),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    }, child: const Text("Save",style:TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 1.5,
                                  fontSize: 13.5,
                                ),)),
                              ],
                            ),
                          )
                        ],),),
                      child: Icon(Icons.edit,color:Color(0xff3e61ed)),
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
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  Text('Isra Riaz',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)
                                    // decoration: const InputDecoration(
                                    //     hintText: "Full Name"),

                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('isra24@gmail.com',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            children: [
                              const Text(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  Text('Female',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)
                                    // decoration: const InputDecoration(
                                    //     hintText: "Full Name"),

                                  ),
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('1 year ',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: Colors.black87))
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Front End  ',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: Colors.black87))
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('123456789',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),

                      ],
                    ),
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
                      onTap: () => showDialog(context: context, builder: (_)=> AlertDialog(
                        title: Text('Qualification Details'),
                        content:
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10, ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(

                              children: [
                                Text('Qualification Details'),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Profile Headline',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Summary"),

                                          ),
                                        ),
                                      ],
                                    )),

                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Highest Qualification',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: " Enter Qualification"),

                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Course',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Course"),

                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Stream',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Stream"),

                                          ),
                                        ),
                                      ],
                                    )),

                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Course Type',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Type"),

                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Institute Qualified From',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Institute Name"),

                                          ),
                                        ),
                                      ],
                                    )),


                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Passing Year',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Year"),

                                          ),
                                        ),
                                      ],
                                    )),

                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Grading System',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Grading"),

                                          ),
                                        ),
                                      ],
                                    )),


                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text(
                                              'Grade Value',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter Value"),

                                          ),
                                        ),
                                      ],
                                    )),

                              ],
                            ),
                          ),
                        ),
                        actions: [Padding(
                          padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GFButton(
                                  color: const Color(0xff3e61ed),
                                  onPressed: () {
                                    // Navigator.pop(context);
                                  }, child: const Text("Save",style:TextStyle(
                                fontFamily: "ProximaNova",
                                fontWeight: FontWeight.bold,
                                // letterSpacing: 1.5,
                                fontSize: 13.5,
                              ),)),
                            ],
                          ),
                        )],


                      )),
                      child: Icon(Icons.edit,color:Color(0xff3e61ed)),
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
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Profile Headline :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Summary of the Profile',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Highest Qualification :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('MBA',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Course :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child: Text('Btech',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Course Type :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Correspondence',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),


                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Institute Qualified From :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('JU',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Passing Year :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('2021',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Grading System :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('CGPA',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Grade Value :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('13',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
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
                        onTap: () =>showDialog(context: context, builder: (_)=> AlertDialog(
                            title:Text('Professional Details'),
                            content: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'Current Organization Name',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child:  TextField(
                                                decoration: const InputDecoration(
                                                    hintText: "Add Organization"),

                                              ),
                                            ),
                                          ],
                                        )), Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'Current Designation',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child:  TextField(
                                                decoration: const InputDecoration(
                                                    hintText: "Add Designation"),

                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'Current Salary',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child:  TextField(
                                                decoration: const InputDecoration(
                                                    hintText: "Add Salary"),

                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'Working Since',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child:  TextField(
                                                decoration: const InputDecoration(
                                                    hintText: "Add Detail"),

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
                                padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GFButton(
                                        color: const Color(0xff3e61ed),
                                        onPressed: () {
                                          // Navigator.pop(context);
                                        }, child: const Text("Save",style:TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontWeight: FontWeight.bold,
                                      // letterSpacing: 1.5,
                                      fontSize: 13.5,
                                    ),)),
                                  ],
                                ),
                              )]



                        )
                        ),
                        child:Icon(Icons.edit,color:Color(0xff3e61ed))
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
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child: Text('Clustech',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )), Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Developer',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('10000',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child: Text('2021',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
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
                        onTap: () =>showDialog(context: context, builder:(_)=> AlertDialog(
                          title:
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10, ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Key Skills',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Skills"),

                                            ),
                                          ),
                                        ],
                                      )),




                                ],
                              ),
                            ),
                          ),
                          actions: [Padding(
                            padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GFButton(
                                    color: const Color(0xff3e61ed),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    }, child: const Text("Save",style:TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 1.5,
                                  fontSize: 13.5,
                                ),)),
                              ],
                            ),
                          )],
                        )),
                        child: Icon(Icons.edit,color:Color(0xff3e61ed))
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
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Add Skills',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold))
                                ),
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
                        onTap: () => showDialog(context: context, builder:(_)=>AlertDialog(
                            // insetPadding:  EdgeInsets.all(40),
                          title:Text('IT-Skills'),
                          content:    SingleChildScrollView(

                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'IT Skills',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                                 child: DropdownSearch<ITSkill>(
                                                validator: (value) {
                                                  if (value == null) {
                                                    return "Please Select Your Skill";
                                                  }
                                                  return null;
                                                },
                                                dropdownSearchDecoration:
                                                InputDecoration(border: UnderlineInputBorder()),
                                                mode: Mode.DIALOG,
                                                items: isLoading
                                                    ? [ITSkill()]
                                                    : _apiResponseITSkill.data,
                                                itemAsString: (ITSkill obj) {
                                                  return obj.itskillName;
                                                },
                                                onFind: (val) async {
                                                  setState(() {
                                                    queries = val;
                                                  });
                                                  return _apiResponseITSkill.data;
                                                },
                                                hint: "Select Skill",
                                                onChanged: (value) {
                                                  skillSearchCont.text = value.itskillId.toString();
                                                  itSkillId = value.itskillId;
                                                  print(value.itskillId);
                                                },
                                                showSearchBox: true,
                                                popupItemBuilder:
                                                    (context, ITSkill item, bool isSelected) {
                                                  return Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                                    child: Card(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Text(item.itskillName),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        )), Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'Version',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child:  TextField(
                                                decoration: const InputDecoration(
                                                    hintText: "Add Version"),

                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'Experience',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child:  TextField(
                                                decoration: const InputDecoration(
                                                    hintText: "Add Experience"),

                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  'Last Used',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0),
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child:  TextField(
                                                decoration: const InputDecoration(
                                                    hintText: "Mention Duration"),

                                              ),
                                            ),
                                          ],
                                        )),




                                  ],
                                ),
                              ),
                            ),
                          ),
                          actions: [Padding(
                            padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GFButton(
                                    color: const Color(0xff3e61ed),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    }, child: const Text("Save",style:TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 1.5,
                                  fontSize: 13.5,
                                ),)),
                              ],
                            ),
                          )],
                        )),

                        child: Icon(Icons.edit,color:Color(0xff3e61ed))
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
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'IT Skills :',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Wrap(
                          children: [
                            Wrap(
                              spacing: 8.0, // gap between adjacent chips
                              runSpacing: 4.0,
                              children:    getItSkills(),
                            ),
                          ],
                        ),
                        // ListView.builder( itemCount: _apiResponse.data.length, itemBuilder: (context, index){
                        //   return   Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 25.0, right: 25.0, top: 5.0),
                        //       child:  Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         children: <Widget>[
                        //           Flexible(
                        //               child:  Text(_apiResponse.data[index].itkillName,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0))
                        //           ),
                        //         ],
                        //       ));
                        // }),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      "Version :",
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('2 ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0))
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Experience : ',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('3 years 4 months ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0))
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Last Used :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child: Text('2021',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0))
                                ),
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
                        onTap: () =>showDialog(context: context, builder: (_)=>AlertDialog(
                          title:Text('Career Preference'),
                          content: Padding(
                            padding: const EdgeInsets.only(
                              top: 10, ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Preferred Industry',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Industry"),

                                            ),
                                          ),
                                        ],
                                      )),


                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Preferred Job Type',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Type"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Preferred Employment Type',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Type"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Preferred Job Location',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Location"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Salary Expectation',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Expectation"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Preferred Shift',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Shift"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Availability To Join',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Location"),

                                            ),
                                          ),
                                        ],
                                      )),


                                ],
                              ),
                            ),
                          ),
                          actions: [Padding(
                            padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GFButton(
                                    color: const Color(0xff3e61ed),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    }, child: const Text("Save",style:TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 1.5,
                                  fontSize: 13.5,
                                ),)),
                              ],
                            ),
                          )],
                        )),


                        child: Icon(Icons.edit,color: Color(0xff3e61ed),)
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
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Automobile',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Automobile',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Contractual',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Bangalore',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('30000',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Flexible',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Immediate',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
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
                        onTap: () =>showDialog(context: context, builder: (_)=>AlertDialog(
                          title:Text('Personal Details'),
                          content: Padding(
                            padding: const EdgeInsets.only(
                              top: 10, ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Address',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Address"),

                                            ),
                                          ),
                                        ],
                                      )),


                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'City',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add City"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Pincode',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Enter Pincode"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'D.O.B',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Enter D.O.B "),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Marital Status',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Status"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Category',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Category"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Ex-Servicemen Experience',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add duration"),

                                            ),
                                          ),
                                        ],
                                      )),


                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Pan Number',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Number"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Nationality',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Nationality"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Passport Number',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add Number"),

                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: const <Widget>[
                                              Text(
                                                'Work Permits',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0),
                                      child:  Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Add value"),

                                            ),
                                          ),
                                        ],
                                      )),

                                ],
                              ),
                            ),
                          ),
                          actions: [Padding(
                            padding: const EdgeInsets.only(right: 20,top: 20,bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GFButton(
                                    color: const Color(0xff3e61ed),
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    }, child: const Text("Save",style:TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 1.5,
                                  fontSize: 13.5,
                                ),)),
                              ],
                            ),
                          )],
                        )),


                        child: Icon(Icons.edit,color: Color(0xff3e61ed),)
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
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Address :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Srinagar',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'City :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Srinagar',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Pincode : ',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('190001',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'D.O.B :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('24-02-1995',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Marital Status :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Single',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Category :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('OM',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Ex-Servicemen Experience :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('2 years',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'PAN Number :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('1234567898',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Nationality :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Indian',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Passport Number :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('123456789',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      'Work Permits :',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                    child:  Text('Yes',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                ),
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


