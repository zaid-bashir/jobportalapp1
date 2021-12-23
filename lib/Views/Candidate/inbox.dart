import 'package:flutter/material.dart';

class InboxList extends StatefulWidget {
  @override
  _InboxListState createState() => _InboxListState();
}

class _InboxListState extends State<InboxList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Column(children: [
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
                title: Text('Messages',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova")),
              ),
              // ListTile(
              //  leading: IconButton(onPressed: (){
              //    Navigator.of(context).pop();
              //  }, icon:Icon(Icons.arrow_back),color: Colors.black,),
              //
              //   title: Text('Messaging',style: const TextStyle(color:Colors.black),),
              //   actions:  const [
              //     Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
              //      child: Icon(Icons.more_vert,color: Colors.black,),
              //     ),
              //      Padding(
              //        padding: EdgeInsets.only(right: 5.0),
              //        child: Icon(Icons.edit,color: Colors.black,),
              //      ),
              //
              //   ],
              //  // backgroundColor: Colors.white,
              // ),
//
              const SizedBox(
                height: 25.0,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            'assets/apple-logo.png',
                          )),
                      title: Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            fontFamily: "ProximaNova"),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Text',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.grey,
                                fontFamily: "ProximaNova")),
                      ),
                    ),
                    Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 0.5,
                        indent: 70),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            'assets/apple-logo.png',
                          )),
                      title: Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProximaNova",
                          fontSize: 14.0,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Text',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.grey,
                                fontFamily: "ProximaNova")),
                      ),
                    ),
                    Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 0.5,
                        indent: 70),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            'assets/apple-logo.png',
                          )),
                      title: Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            fontFamily: "ProximaNova"),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Text',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.grey,
                                fontFamily: "ProximaNova")),
                      ),
                    ),
                    Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 0.5,
                        indent: 70),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            'assets/apple-logo.png',
                          )),
                      title: Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            fontFamily: "ProximaNova"),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Text',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.grey,
                                fontFamily: "ProximaNova")),
                      ),
                    ),
                    Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 0.5,
                        indent: 70),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            'assets/apple-logo.png',
                          )),
                      title: Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            fontFamily: "ProximaNova"),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Text ',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.grey,
                                fontFamily: "ProximaNova")),
                      ),
                    ),
                    Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 0.5,
                        indent: 70),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            'assets/apple-logo.png',
                          )),
                      title: Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            fontFamily: "ProximaNova"),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Text',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.grey,
                                fontFamily: "ProximaNova")),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 10,
                      thickness: 0.5,
                      indent: 70,
                    ),
                  ])
            ])));
  }
}
