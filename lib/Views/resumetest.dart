
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
class UploadTest extends StatefulWidget {




  @override
  _UploadTestState createState() => _UploadTestState();
}

class _UploadTestState extends State<UploadTest>
    with SingleTickerProviderStateMixin{
  AnimationController loadingController;
  File _file;
  PlatformFile _platformFile;

  selectFile()async{
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom , allowedExtensions: ['png', 'jpg', 'jpeg','pdf']);
    if (file!= null){
      setState(() {
        _file = File(file.files.single.path);
        _platformFile = file.files.first;
      });
    }
    loadingController.forward();

  }
  @override
  void initState() {
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
    return Scaffold(
        body:
        _platformFile != null
        ?Container(
        //     padding: EdgeInsets.all(20),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //       Text(
        //       'Selected File',
        //       style: TextStyle(
        //         color: Colors.grey.shade400,
        //         fontSize: 15,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),


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
                  'Updated on 16/12/2021',
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
      ],
        ),
    )
            : Container(),

    );

  }
}
