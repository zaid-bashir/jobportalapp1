import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/Views/profile_page.dart';
import 'package:job_portal/Views/saved_jobs.dart';
import 'package:job_portal/Views/settings.dart';
import 'package:job_portal/Views/suggested_jobs.dart';

import 'On_Board_Screens/constants/constants.dart';
import 'explore_jobs.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FadeInDown(
              delay: Duration(milliseconds: 500),
              duration: Duration(milliseconds: 500),
              child: Container(
                height: 100,
                child: DrawerHeader(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  <Widget>[
                        CircleAvatar(
                          backgroundColor:Colors.grey.shade300,
                          radius: 30.0,
                          child:  Icon(
                            Icons.person,
                            color: Colors.grey.shade900,size: 35,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text("Vijay Niranjan",   style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 14.5,
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                },
                                child: Text("Update Profile",   style: TextStyle(
                                  color: Color(0xff3e61ed),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 9.5,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            // FadeInLeftBig(
            //   delay: Duration(milliseconds: 500),
            //   duration: Duration(milliseconds: 500),
            //   child: ExpansionTile(
            //     title: DrawerListTile(
            //       title: "Dashboard",
            //       svgSrc: Icons.ten_k,
            //       press: () {},
            //     ),
            //     children: <Widget>[
            //       FadeInRightBig(
            //         delay: const Duration(milliseconds: 500),
            //         duration: const Duration(milliseconds: 500),
            //         child: Padding(
            //           padding: const EdgeInsets.only(left: 15),
            //           child: DrawerListTile(
            //             title: "Dashboard",
            //             svgSrc: Icons.ten_k,
            //             press: () {},
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            FadeInLeftBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: DrawerListTile(
                  title: "Explore Jobs",
                  svgSrc:  Icons.manage_search_outlined,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ExploreJobs()));
                  },
                ),
              ),
            ),
            FadeInRightBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: DrawerListTile(
                  title: "Saved Jobs",
                  svgSrc:  Icons.bookmark_border_outlined,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SavedJobs()));

                  },
                ),
              ),
            ),
            FadeInLeftBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: DrawerListTile(
                  title: "Suggested Jobs",
                  svgSrc:  Icons.work_outline_outlined,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SuggestJobs()));

                  },
                ),
              ),
            ),
            FadeInDownBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Divider(
                color: Colors.grey,
                thickness: 0.8,
                indent: 8.0,
                endIndent: 8.0,
              ),
            ),
            FadeInRightBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: DrawerListTile(
                  title: "E-Learning",
                  svgSrc: Icons.menu_book_outlined,
                  press: () {},
                ),
              ),
            ),
            FadeInLeftBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: DrawerListTile(
                  title: "Chat for help",
                  svgSrc: Icons.question_answer_outlined,
                  press: () {},
                ),
              ),
            ),
            FadeInRightBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: DrawerListTile(
                  title: "Settings",
                  svgSrc: Icons.manage_accounts_outlined,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
              ),
            ),
            FadeInLeftBig(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: DrawerListTile(
                  title: "Sign out",
                  svgSrc: Icons.logout_outlined,
                  press: () {},
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    this.title,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  final String title;
  final IconData svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading:Icon(
        svgSrc,
        color: Color(0xff3e61ed),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: Constants.OPEN_SANS,
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
