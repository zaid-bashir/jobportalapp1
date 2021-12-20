import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';


class FresherWC extends StatefulWidget {


  @override
  _FresherWCState createState() => _FresherWCState();
}

class _FresherWCState extends State<FresherWC> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: const EdgeInsets.only(left: 10.0),
    child: Row(
    children: [
    IconButton(onPressed: (){
    Navigator.of(context).pop();
    }, icon:Icon(Icons.arrow_back),color: Colors.black,)
    ],
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Let's start building your profile!",
    style: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.w900,
    fontFamily: 'Pacifo'),
    ),
    SizedBox(
    height: 10.0,
    ),
    Text(
    'We will help you find the right job opportunities based on the '
    'details you enter here ',
    style: TextStyle(color: Colors.grey, fontSize: 10.0),
    )
    ],
    ),
    ),
    ],
    ),
    Padding(
    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
    child: Form(
    child: Column(
    children: [
    const TextField(
    decoration: InputDecoration(
    contentPadding: EdgeInsets.all(0.0),
    labelText: 'Upload Resume',
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
      const SizedBox(
        height: 20,
      ),
      const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          labelText: 'Highest Degree',
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
      const SizedBox(
        height: 20,
      ),
      const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          labelText: 'Institute Qualified from',
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
      const SizedBox(
        height: 20,
      ),
      const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          labelText: 'Profile Summary',
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
      const SizedBox(
        height: 20,
      ),
      const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          labelText: 'Projects(if any)',
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
      const SizedBox(
        height: 20,
      ),
      const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          labelText: 'Key Skills',
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
      const SizedBox(
        height: 20,
      ),
      const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          labelText: 'IT Skills',
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
      const SizedBox(
        height: 60.0,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GFButton(
                color: const Color(0xff2972ff),
                onPressed: () {

                }, child: const Text("Next",style:TextStyle(
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.bold,
              // letterSpacing: 1.5,
              fontSize: 13.5,
            ),))
          ],
        ),
      ),

      ]
    )

    )
    )
        ]
    )
    )
    );
  }
}
