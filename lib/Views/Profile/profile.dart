import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/sidebar.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../Candidate/inbox.dart';

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
  bool _status2 = true;
  bool _status3 = true;
  bool _status4 = true;
  bool _status5 = true;
  bool _status6 = true;
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                                  'Date Of Birth',
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
                                                    hintText: "Date Of Birth"),
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
                                        child:  Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const <Widget>[
                                                Text(
                                                  ' Mobile Number',
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
                                                    hintText: "Enter Mobile Number"),
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

                        child:Icon(Icons.edit,color: Color(0xff3e61ed),),
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
                                      ' Name',
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
                                left: 28.0, right: 28.0, top: 5.0),
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
                          child: Row(
                            children: [
                              const Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              GFRadio(
                                size: 20,
                                activeBorderColor: const Color(0xff3e61ed),
                                value: 0,
                                // enabled: !_status,
                                autofocus: !_status,
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
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              // GFRadio(
                              //   // enabled: !_status,
                              //   autofocus: !_status,
                              //   size: 20,
                              //   value: 1,
                              //   groupValue: groupValue,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       groupValue = value;
                              //     });
                              //   },
                              //   inactiveIcon: null,
                              //   activeBorderColor: const Color(0xff3e61ed),
                              //   radioColor: const Color(0xff3e61ed),
                              // ),
                              // const SizedBox(
                              //   width: 7,
                              // ),
                              // const Text(
                              //   "Female",
                              //   style: TextStyle(
                              //       fontSize: 16.0,
                              //       fontWeight: FontWeight.bold),
                              // ),
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              // GFRadio(
                              //   size: 20,
                              //   activeBorderColor: const Color(0xff3e61ed),
                              //   value: 3,
                              //   // enabled: !_status,
                              //   autofocus: !_status,
                              //   groupValue: groupValue,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       groupValue = value;
                              //     });
                              //   },
                              //   inactiveIcon: null,
                              //   radioColor: const Color(0xff3e61ed),
                              // ),
                              // const SizedBox(
                              //   width: 7,
                              // ),
                              // const Text(
                              //   "Others",
                              //   style: TextStyle(
                              //       fontSize: 16.0,
                              //       fontWeight: FontWeight.bold),
                              // ),
                            ],
                          ),
                        ),
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
                                      'Date Of Birth',
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
                                  child:  Text('24/02/2020',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),


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
                                      'Email ID',
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
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Text(
                                      ' Mobile Number',
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
                                  child:  Text('123456789',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: Colors.black87))
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
                      "PROFILE SUMMARY",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                     GestureDetector(

                        onTap: () => showDialog(context: context, builder: (_) =>AlertDialog(

                          title: Text('Profile Summary'),
                          content:  Padding(
                            padding: const EdgeInsets.only(
                              top: 10, ),
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
                                              'About',
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
                                                hintText: "Summary"),

                                          ),
                                        ),
                                      ],
                                    )),




                              ],
                            ),
                          ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
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
                                      'About',
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
                                  child: Text('Summary of the user',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: Colors.black87

                            )
                                  ),
                                ),
                              ],
                            )),



                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                key: itemKey,
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "LOCATION",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                     GestureDetector(
                      onTap: () => showDialog(context: context, builder: (_) => AlertDialog(
                        title: Text('Location'),
                        content:     Padding(
                          padding: const EdgeInsets.only(),
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
                                              'Candidate Address',
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
                                                hintText: "Address"),

                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                       top: 25.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        const Expanded(
                                          child: Text(
                                            'Country',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child:  const Text(
                                              'Zip Code',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0),
                                    child:  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child:  TextField(
                                              decoration: const InputDecoration(
                                                  hintText: "Select Country"),

                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Flexible(
                                          child:  TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Enter ZipCode"),

                                          ),
                                          flex: 2,
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0)),
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
                                      'Candidate Address',
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
                                  child:  Text('Address',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: Colors.black87

                                  ),
                                ),
                                )],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Expanded(
                                  child: Text(
                                    'Country',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child:  const Text(
                                      'Zip Code',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          ),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child:  Text('Select Country',style:
                                    TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child:  Text('Enter zipcode',style:TextStyle(fontSize:15,fontWeight:FontWeight.bold)),
                                  flex: 2,
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
                      "EDUCATION",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                     GestureDetector(
                      onTap: () => showDialog(context: context, builder: (_)=> AlertDialog(
                        title: Text('Education'),
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
                                              'High School Education',
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
                                                hintText: "School Name"),

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
                                              'Higher Secondary Education',
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
                                                hintText: " School Name"),

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
                                              'Highest Degree',
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
                                                hintText: "Highest Degree"),

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
                                                hintText: "College Name"),

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
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 16.5,
                        ),
                      ),
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
                                      'High School Education',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "School Name"),

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
                                      'Higher Secondary Education',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: " School Name"),

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
                                      'Highest Degree',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Highest Degree"),

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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "College Name"),

                                  ),
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
                      "EXPERIENCE",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>showDialog(context: context, builder: (_)=> AlertDialog(
                        title:Text('Experience'),
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
                                              'Years of experience',
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
                                                hintText: "Add Years"),

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
                                              'Tenure of last job',
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
                                                hintText: "Add Tenure"),

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
                                              'Name of Firm',
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
                                                hintText: "Add Name"),

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
                                              'Job Title',
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
                                                hintText: "Add Title"),

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
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 16.5,
                        ),
                      ),
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
                                      'Years of experience',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Years"),

                                  ),
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
                                      'Tenure of last job',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Tenure"),

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
                                      'Name of Firm',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Name"),

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
                                      'Job Title',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Title"),

                                  ),
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
                      "SKILLS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                     GestureDetector(
                      onTap: () =>showDialog(context: context, builder:(_)=> AlertDialog(
                        title: Text('Skills'),
                        content:  Padding(
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
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 16.5,
                        ),
                      ),
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
                                left: 25.0, right: 25.0, top: 2.0),
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
                                left: 25.0, right: 25.0, top: 2.0),
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text(
                      "ACCOMPLISHMENTS/PROJECTS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                     GestureDetector(
                      onTap: () => showDialog(context: context, builder:(_)=>AlertDialog(
                        title:Text('Accomplishments/Projects'),
                        content:    Padding(
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
                                              'Add Projects',
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
                                                hintText: "Add Projects"),

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
                                              'Add Patents',
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
                                                hintText: "Add Patents"),

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
                                              'Add Publications',
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
                                                hintText: "Add Publications"),

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
                                              'Add Volunteer Experience',
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
                                                hintText: "Add experience"),

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

                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 16.5,
                        ),
                      ),
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
                                      'Add Projects',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Projects"),

                                  ),
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
                                      'Add Patents',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Patents"),

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
                                      'Add Publications',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Publications"),

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
                                      'Add Volunteer Experience',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add experience"),

                                  ),
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
                      "LANGUAGES",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                     GestureDetector(
                      onTap: () =>showDialog(context: context, builder: (_)=>AlertDialog(
                        title:Text('Languages'),
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
                                              'Add Languages',
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
                                                hintText: "Add Language"),

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


                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Color(0xff3e61ed),
                          fontFamily: "PoroximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 16.5,
                        ),
                      ),
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
                                      'Add Languages',
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
                                left: 25.0, right: 25.0, top: 2.0),
                            child:  Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child:  TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Add Language"),

                                  ),
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
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 16.5,
                        ),
                      ),
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


