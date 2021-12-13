import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
class Recruiter extends StatefulWidget {
  const Recruiter({Key key}) : super(key: key);

  @override
  _RecruiterState createState() => _RecruiterState();
}

class _RecruiterState extends State<Recruiter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
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
            padding: const EdgeInsets.all(18.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Your introduction to recruiter",
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
                  'Resume headline is what recruiters read first about you .\nAdd your own or select from suggestions ',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
          ),
        ],
    ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Write your one line introduction',
                  hintText: 'Write your one line introduction',
                  labelStyle: TextStyle(
                    color: Colors.blue,
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
            height: 2.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text('Or select from below',style: TextStyle(color: Colors.grey,fontSize: 10.0,),),
          ),

          const SizedBox(
            height: 1.0,
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
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Software Development with\nM.Ed currently living in Gurgaon/\nGurugram ',
                                style: TextStyle(

                                  color: Colors.black87, fontSize: 13.0,
                                fontWeight: FontWeight.w200),
                              ),

                            ],
                          ),
                          const SizedBox(
                            width: 140.0,
                          ),


                          GFButton(
                            onPressed: (){},
                            text: "Select",
                            shape: GFButtonShape.pills,
                            type: GFButtonType.outline,
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
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
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Seasoned professional with 12\nyears of experience.Expert in\nApplication Programming,Android \n Development',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 13.0,
                                  ),
                                ),

                              ]),
                          const SizedBox(
                            width: 130.0,
                          ),
                          GFButton(
                            onPressed: (){},
                            text: "Select",
                            shape: GFButtonShape.pills,
                            type: GFButtonType.outline,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
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
                  onPressed: (){},
                  text: "Next",
                  shape: GFButtonShape.pills,
                  type: GFButtonType.outline,
                  color: Colors.black,
                ),

              ],
            ),
          ),
              ]
    ),
      ),
    ),
    );
  }
}
