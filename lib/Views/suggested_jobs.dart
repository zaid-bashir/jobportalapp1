import 'package:flutter/material.dart';

class SuggestJobs extends StatefulWidget {
  const SuggestJobs({Key key}) : super(key: key);

  @override
  _SuggestJobsState createState() => _SuggestJobsState();
}

class _SuggestJobsState extends State<SuggestJobs> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Suggested Jobs.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "(You can select multiple jobs to apply)",
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        // Image.asset(
                        //   "assets/accent.png",
                        //   width: 99,
                        //   height: 4,
                        // ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                value: isActive,
                                onChanged: (val) {
                                  setState(() {
                                    isActive = val;
                                    if (isActive == true) {
                                      // print("student is active");
                                    } else {}
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      " Java Developer - Pan India",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontSize: 14.5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "Unacademy",
                                      style: TextStyle(
                                        color: Color(0xff3e61ed),
                                        fontFamily: "ProximaNova",
                                        fontWeight: FontWeight.bold,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "remote",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
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
                            children: const [
                              Icon(
                                Icons.work_outline_outlined,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1-5 Yrs",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
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
                            children: const [
                              Icon(
                                Icons.attach_money,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "4,50,000 - 9,50,000",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
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
                            children: const [
                              Icon(
                                Icons.email_outlined,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "unacadmy@godaddy.com",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5,
                                  fontSize: 13.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "6d ago",
                                style: TextStyle(
                                  color: Color(0xff3e61ed),
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 12.5,
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.visibility_off_outlined,
                                    color: Color(0xff3e61ed),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Hide",
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: Color(0xff3e61ed),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Saved",
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                value: isActive,
                                onChanged: (val) {
                                  setState(() {
                                    isActive = val;
                                    if (isActive == true) {
                                      // print("student is active");
                                    } else {}
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Django Developer - Pan India",
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontSize: 14.5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "ClustTech",
                                      style: TextStyle(
                                        color: Color(0xff3e61ed),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Kashmir",
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
                            children: const [
                              Icon(
                                Icons.work_outline_outlined,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1-5 Yrs",
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
                            children: const [
                              Icon(
                                Icons.attach_money,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "4,50,000 - 9,50,000",
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
                            children: const [
                              Icon(
                                Icons.email_outlined,
                                color: Color(0xff3e61ed),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "clusttech@godaddy.com",
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2d ago",
                                style: TextStyle(
                                  color: Color(0xff3e61ed),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 12.5,
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.visibility_off_outlined,
                                    color: Color(0xff3e61ed),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Hide",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: Color(0xff3e61ed),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Saved",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
