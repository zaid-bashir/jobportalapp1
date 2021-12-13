// ignore_for_file: unused_element, avoid_print, unused_field, prefer_const_constructors, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:job_portal/Views/setup_profile.dart';

import '../home_page.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  int groupValue = 0;
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      getImagefromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    getImagefromcamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  File _image;

  Future getImagefromcamera() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image :$e");
    }
  }

  Future getImagefromGallery() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image :$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _image == null
                          ? Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/as.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                _image,
                                width: 140.0,
                                height: 140.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 90.0, right: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 25.0,
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
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Form(
                  child: Column(
                    children: [
                      TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'Name',
                          hintText: 'Username',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Iconsax.user,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'Email',
                          hintText: 'e-mail',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: const Icon(
                            Iconsax.message,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'Career',
                          hintText: 'Job Field',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Iconsax.note,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.0),
                          labelText: 'Phone',
                          hintText: 'Mobile Number',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: const Icon(
                            Iconsax.mobile,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: true,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.0),
                          labelText: 'Password',
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(
                            Iconsax.key,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: true,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.0),
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(
                            Iconsax.lock,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GFRadio(
                              size: 20,
                              activeBorderColor: GFColors.SUCCESS,
                              value: 0,
                              groupValue: groupValue,
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value;
                                });
                              },
                              inactiveIcon: null,
                              radioColor: GFColors.SUCCESS,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              "Male",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 14.5,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GFRadio(
                              size: 20,
                              value: 1,
                              groupValue: groupValue,
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value;
                                });
                              },
                              inactiveIcon: null,
                              activeBorderColor: GFColors.SUCCESS,
                              radioColor: GFColors.SUCCESS,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              "Female",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 14.5,
                              ),
                            ),

                          ],
                        ),
                      ),
                      FadeInDown(
                        delay: Duration(milliseconds: 600),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetupProfile()));
                            Future.delayed(Duration(seconds: 2), () {
                              setState(() {
                                _isLoading = false;
                              });
                            });
                          },
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: _isLoading
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  child: const CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    color: Colors.black,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  "Request OTP",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: const [
                          Expanded(child: Divider(
                            endIndent: 20,
                            indent: 10,

                            thickness: 1.3,
                          )),
                          Text("OR"),
                          Expanded(child: Divider(
                            indent: 20,
                            endIndent: 10,
                            thickness: 1.3,

                          )),
                        ],
                      ),
                      const SizedBox(height: 10,),

                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                          side: const BorderSide(color: Colors.black),
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Image(
                                height: 30,
                                width: 20,
                                image: AssetImage(
                                  'assets/google.png',
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Join with Google')
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                          side: const BorderSide(color: Colors.black),
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Image(
                                height: 30,
                                width: 30,
                                image: AssetImage(
                                  'assets/apple-logo.png',
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Join with Apple')
                            ],
                          ),
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
    );
  }
}
