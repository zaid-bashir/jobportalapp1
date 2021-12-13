// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:job_portal/widgets/custum_button.dart';
import 'package:job_portal/widgets/custum_listtile.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //bool variable to check switch button
  //====================================

  bool _turnOnNotifications = false;
  bool _turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(60),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.black,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage("assets/images/userdemo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Zaid Bashir",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "+91 9657546543",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustumButton(text: "Edit"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Account",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustumListile(
                        icon: Icons.location_on,
                        text: "Location",
                      ),
                      CustumListile(
                        icon: Icons.visibility,
                        text: "Change Password",
                      ),
                      CustumListile(
                        icon: Icons.shopping_cart,
                        text: "Shipping",
                      ),
                      CustumListile(
                        icon: Icons.payment,
                        text: "Payment",
                      ),
                      CustumListile(
                        icon: Icons.logout,
                        text: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Notifications",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "App Notification",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Switch(
                              value: _turnOnNotifications,
                              onChanged: (value) {
                                setState(() {
                                  _turnOnNotifications = value;
                                  print(
                                      "Value is : " + "$_turnOnNotifications");
                                });
                              }),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Location Tracking",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Switch(
                              value: _turnOnLocation,
                              onChanged: (value) {
                                setState(() {
                                  _turnOnLocation = value;
                                  print("Value is : " + "$_turnOnLocation");
                                });
                              }),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Others",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Languages",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Currency",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
