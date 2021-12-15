import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Views/setup_profile.dart';
import 'package:job_portal/Views/skills_and_eduction.dart';

class ProfileChoice extends StatefulWidget {
  const ProfileChoice({Key key}) : super(key: key);

  @override
  _ProfileChoiceState createState() => _ProfileChoiceState();
}

class _ProfileChoiceState extends State<ProfileChoice> {





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
        SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // mainAxisAlignment: MainAxisAlignment.start,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I am a student/have never worked',
                            style: TextStyle(

                                color: Colors.black87, fontSize: 14.0,),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Eg: Fresh graduates,graduates having no work'
                            'experience',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.grey, ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 140.0,
                      ),
                      Image(
                        color: Color(0xff2972ff),
                        height: 40,
                        width: 30,
                        image: AssetImage(
                          'assets/school-bag.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // mainAxisAlignment: MainAxisAlignment.start,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'I am working / have worked before',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Eg: Working or worked in Company,agency,office,'
                              'business,organization',
                              style:
                                  TextStyle(fontSize: 10.0, color: Colors.grey),
                            ),
                          ]),
                      const SizedBox(
                        width: 80.0,
                      ),
                      const Image(
                        color: Color(0xff2972ff),
                        height: 40,
                        width: 30,
                        image: AssetImage(
                          'assets/briefcase.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Current city',
                hintText: 'Current city',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            )),
        const SizedBox(
          height: 140.0,
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
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => SetupProfile()));
                  }, child: const Text("Next",style:TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                // letterSpacing: 1.5,
                fontSize: 13.5,
              ),))
            ],
          ),
        ),
      ],
    )));
  }
}
