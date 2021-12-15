import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
            "Vijay Niranjan",
            style: TextStyle(
              fontFamily: "OpenSans",
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
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
              fontSize: 16.5,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Basic details",
                            style: TextStyle(
                              color: const Color(0xff3e61ed),
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 16.5,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_outlined,
                                  color: Color(0xff3e61ed)))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.work_outlined,
                            color: const Color(0xff3e61ed),
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "2 Years 6 Months",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: const Color(0xff3e61ed),
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Ahmedabad,INDIA",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: const Color(0xff3e61ed),
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "2 Lacks",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: const Color(0xff3e61ed),
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "ballaumer525@gmail.com",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.call_outlined,
                            color: const Color(0xff3e61ed),
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "7889557837",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
