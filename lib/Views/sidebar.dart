import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'On_Board_Screens/constants/constants.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          FadeInDown(
            delay: Duration(milliseconds: 500),
            duration: Duration(milliseconds: 500),
            child: DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(fit: StackFit.loose, children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 140.0,
                            height: 140.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: ExactAssetImage('assets/as.png'),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 90.0, right: 100.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 25.0,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ]),
                )),
          ),
          FadeInLeftBig(
            delay: Duration(milliseconds: 500),
            duration: Duration(milliseconds: 500),
            child: ExpansionTile(
              title: DrawerListTile(
                title: "Dashboard",
                svgSrc: Icons.ten_k,
                press: () {},
              ),
              children: <Widget>[
                FadeInRightBig(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: DrawerListTile(
                      title: "Dashboard",
                      svgSrc: Icons.ten_k,
                      press: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInRightBig(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: DrawerListTile(
                title: "Notifications",
                svgSrc:  Icons.notifications,
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
                title: "Companies",
                svgSrc: Icons.business,
                press: () {},
              ),
            ),
          ),
          FadeInRightBig(
            delay: Duration(milliseconds: 500),
            duration: Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: DrawerListTile(
                title: "Documents",
                svgSrc:  Icons.ten_k,
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
                title: "Store",
                svgSrc:  Icons.ten_k,
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
                title: "Notification",
                svgSrc:  Icons.ten_k,
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
                title: "Profile",
                svgSrc:  Icons.ten_k,
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
                svgSrc: Icons.ten_k,
                press: () {},
              ),
            ),
          ),
        ],
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
        color: Colors.lightBlueAccent[700],
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
