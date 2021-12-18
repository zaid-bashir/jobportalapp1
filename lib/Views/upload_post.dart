// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class UploadPost extends StatefulWidget {
  const UploadPost({Key key}) : super(key: key);

  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Upload Post",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: CircleAvatar(
                  child: Image.asset("assets/show_image.png"),
                  radius: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Zaid Bashir",style: GoogleFonts.lato(fontSize: 26),),
                    SizedBox(height: 4,),
                    Text("What's on your mind",style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.normal,color: Colors.grey[500]),),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'What\'s on your mind',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 15.5,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff2972ff),
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.bold,
                            // letterSpacing: 1.5,
                            fontSize: 17.5,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff2972ff),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Iconsax.activity,color: Colors.grey[500],),
                        SizedBox(width: 40,),
                        TextButton(onPressed: (){}, child: Text("Add Activity",style: TextStyle(color: Colors.grey[500],),),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Iconsax.location,color: Colors.grey[500],),
                        SizedBox(width: 40,),
                        TextButton(onPressed: (){}, child: Text("Check In",style: TextStyle(color: Colors.grey[500],),),),
                      ],
                    ),
                     SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Iconsax.tag,color: Colors.grey[500],),
                        SizedBox(width: 40,),
                        TextButton(onPressed: (){}, child: Text("Tag Friends",style: TextStyle(color: Colors.grey[500],),),),
                      ],
                    ),
                     SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Iconsax.gallery,color: Colors.grey[500],),
                        SizedBox(width: 40,),
                        TextButton(onPressed: (){}, child: Text("Add Photos",style: TextStyle(color: Colors.grey[500],),),),
                      ],
                    ),
                     SizedBox(height: 20,),
                     Row(
                      children: [
                        Icon(Icons.live_tv,color: Colors.grey[500],),
                        SizedBox(width: 40,),
                        TextButton(onPressed: (){}, child: Text("Go Live",style: TextStyle(color: Colors.grey[500],),),),
                      ],
                    ),
                    
                   
                  ],
                ),
        ),
      ]),
    );
  }
}
