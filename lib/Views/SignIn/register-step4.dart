import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Registerstep4 extends StatefulWidget {
  const Registerstep4({Key key}) : super(key: key);

  @override
  _Registerstep4State createState() => _Registerstep4State();
}

class _Registerstep4State extends State<Registerstep4> {

  List<String> list = [
    "University Of Kashmir",
    "SSM College Of Engineering",
    "Cluster University",
    "IUST",
    "Central University",
  ];

  bool isFresher = true;

  List<String> list1 = [
    "M.Tech",
    "MCA",
    "MBA",
    "B.Tech",
    "BCA",
    "B.sc IT",
    "HSE Part II",
    "Matriculation"
  ];

  List<String> prefferedIndustry = [
    "TextTile Industry",
    "Automobile Industry",
    "IT Industry",
    "Aviation Industry",
  ];

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
    // loadingController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:  Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Attach File From Phone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProximaNova",
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "pdf,doc,png accepted",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontFamily: "ProximaNova",
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Card(
            //   child:
            //   ListTile(
            //     leading: GestureDetector(child: Icon(Iconsax.document_upload,size: 40,),onTap: (){
            //       selectFile();
            //     },),
            //     title: Text("Upload Your Resume"),
            //     subtitle: Text("pdf,docx,jpg,png"),
            //   ),
            // ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("About",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          // const SizedBox(
          //   height: 3,
          // ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Profile Summary",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          isFresher ?  Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Education",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ) :  Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Experience",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          const SizedBox(
            height: 3,
          ),
          isFresher ? Column() : Card(
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
                                'Previous Salary',
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
                                  hintText: "Annually"),

                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),

          isFresher ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Institute Qualified From",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ) : Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Preferred Industry",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
         const SizedBox(
            height: 3,
          ),
          isFresher ? GFSearchBar(
            searchList: list,
            searchQueryBuilder: (query,list){
              return list.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
            },
            overlaySearchListItemBuilder: (item){
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(item,style: TextStyle(fontSize: 18),),
              );
            },
            onItemSelected: (item){
              setState(() {
                print(item);
              });
            },
          ) : GFSearchBar(
            searchList: prefferedIndustry,
            searchQueryBuilder: (query,list){
              return list.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
            },
            overlaySearchListItemBuilder: (item){
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(item,style: TextStyle(fontSize: 18),),
              );
            },
            onItemSelected: (item){
              setState(() {
                print(item);
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Highest Degree",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          GFSearchBar(
            searchList: list1,
            searchQueryBuilder: (query,list){
              return list.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
            },
            overlaySearchListItemBuilder: (item){
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(item,style: TextStyle(fontSize: 18),),
              );
            },
            onItemSelected: (item){
              setState(() {
                print(item);
              });
            },
          ),

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Projects",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.add),
                title: Text("Add Projects"),
                subtitle: Text(""),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          isFresher ? Container() : Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Accomplishments",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          isFresher ? Container() : Card(
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

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text("Skills",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          const SizedBox(
            height: 4,
          ),
           Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Row(
                children: const [
                  Expanded(flex: 1 ,child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Key Skills"),
                    subtitle: Text(""),
                  ),),

                  Expanded(flex: 1 ,child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text("IT Skills"),
                    subtitle: Text(""),
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
