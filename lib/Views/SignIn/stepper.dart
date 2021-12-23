// // ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, prefer_final_fields, unused_field, unnecessary_const, sized_box_for_whitespace, unnecessary_new, curly_braces_in_flow_control_structures
//
// import 'dart:async';
// import 'dart:io';
//
// import 'package:animate_do/animate_do.dart';
// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_verification_code/flutter_verification_code.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CustumStepper extends StatefulWidget {
//   const CustumStepper({Key key}) : super(key: key);
//
//   @override
//   _CustumStepperState createState() => _CustumStepperState();
// }
//
// class _CustumStepperState extends State<CustumStepper> {
//   List<String> salutation = [
//     "Mr",
//     "Ms",
//     "Miss",
//     "Mrs",
//     "Mx",
//   ];
//
//   String mySelection = "Mr";
//
//
//   //FOR OTP
//   int currentStep = 0;
//   var formKey = GlobalKey<FormState>();
//   var mobileController = TextEditingController();
//
//   //FOR BASIC DETAILS ---> VARIABLES
//   bool _isLoading = false;
//   int genderGroupValue = 0;
//   int experienceGroupValue = 0;
//   String dropdownValue;
//
//   //FOR BASIC DETAILS ---> FUNCTIONS
//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                     leading: const Icon(Icons.photo_library),
//                     title: const Text('Photo Library'),
//                     onTap: () {
//                       getImagefromGallery();
//                       Navigator.of(context).pop();
//                     }),
//                 ListTile(
//                   leading: const Icon(Icons.photo_camera),
//                   title: const Text('Camera'),
//                   onTap: () {
//                     getImagefromcamera();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           );
//         });
//   }
//
//   File _image;
//
//   Future getImagefromcamera() async {
//     try {
//       var image = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (image == null) return;
//       final imageTemp = File(image.path);
//       setState(() {
//         _image = imageTemp;
//       });
//     } on PlatformException catch (e) {
//       print("Failed to pick image :$e");
//     }
//   }
//
//   Future getImagefromGallery() async {
//     try {
//       var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemp = File(image.path);
//       setState(() {
//         _image = imageTemp;
//       });
//     } on PlatformException catch (e) {
//       print("Failed to pick image :$e");
//     }
//   }
//
//   //AutoComplete Textfield
//   AutoCompleteTextField searchTextField;
//
//   //Verification Variables and Functions
//   bool _isResendAgain = false;
//   bool _isVerified = false;
//   bool _isLoadingOTP = false;
//
//   String _code = '';
//
//   Timer _timer;
//   int _start = 60;
//   int _currentIndex = 0;
//
//   void resend() {
//     setState(() {
//       _isResendAgain = true;
//     });
//
//     const oneSec = Duration(seconds: 1);
//     _timer = new Timer.periodic(oneSec, (timer) {
//       setState(() {
//         if (_start == 0) {
//           _start = 60;
//           _isResendAgain = false;
//           timer.cancel();
//         } else {
//           _start--;
//         }
//       });
//     });
//   }
//
//   verify() {
//     setState(() {
//       _isLoadingOTP = true;
//     });
//
//     const oneSec = Duration(milliseconds: 2000);
//     _timer = new Timer.periodic(oneSec, (timer) {
//       setState(() {
//         _isLoadingOTP = false;
//         _isVerified = true;
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     Timer.periodic(Duration(seconds: 5), (timer) {
//       setState(() {
//         _currentIndex++;
//
//         if (_currentIndex == 3) _currentIndex = 0;
//       });
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Theme(
//           data: Theme.of(context).copyWith(
//             // ignore: missing_required_param
//             colorScheme: ColorScheme.light(primary: Colors.blue),
//           ),
//           child: Stepper(
//             type: StepperType.vertical,
//             steps: getSteps(),
//             currentStep: currentStep,
//             // onStepTapped: (step) {
//             //   return setState(() {
//             //     currentStep = step;
//             //   });
//             // },
//             onStepContinue: () {
//               final isLastStep = currentStep == getSteps().length - 1;
//               if (isLastStep) {
//                 print("Completed");
//                 //SEND DATA TO SERVER...
//               } else {
//                 setState(() {
//                   currentStep = currentStep + 1;
//                 });
//               }
//             },
//             onStepCancel: () {
//               currentStep == 0
//                   ? null
//                   : () {
//                 setState(() {
//                   currentStep = currentStep - 1;
//                 });
//               };
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Step> getSteps() {
//     return [
//       Step(
//         state: currentStep > 0 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 0,
//         title: Text("Register With OTP"),
//         content: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 40, bottom: 40, left: 10),
//               child: Text(
//                 "Let\'s Create Your Account - Step 1",
//                 textAlign: TextAlign.left,
//                 style: GoogleFonts.lato(
//                   textStyle:
//                   TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
//                 ),
//               ),
//             ),
//             Image.asset(
//               "assets/illustration_one.png",
//               height: 180,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Text(
//                 "Register with a Mobile Number",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: Text(
//                 "Enter Your Mobile Number we will send you OTP to Verify",
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       height: 47,
//                       width: 50,
//                       margin: const EdgeInsets.fromLTRB(0, 10, 3, 30),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         border: Border.all(color: Colors.grey),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "+91",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w900),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 5,
//                     child: Form(
//                       key: formKey,
//                       child: TextFormField(
//                         controller: mobileController,
//                         maxLines: 1,
//                         maxLength: 10,
//                         decoration: const InputDecoration(
//                           contentPadding: const EdgeInsetsDirectional.all(10),
//                           hintText: "Enter Your Mobile Number",
//                           enabledBorder: OutlineInputBorder(
//                             borderSide:
//                             BorderSide(color: Colors.grey, width: 1),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         autocorrect: true,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return "Mobile Number can not be empty";
//                           }
//                           if (value.length < 10) {
//                             return "Please enter 10 digits mobile number";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//       Step(
//           state: currentStep > 1 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 1,
//           title: Text("OTP Verification"),
//           content: SingleChildScrollView(
//             child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 height: MediaQuery.of(context).size.height,
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 250,
//                       child: Stack(children: [
//                         Positioned(
//                           top: 0,
//                           left: 0,
//                           right: 0,
//                           bottom: 0,
//                           child: AnimatedOpacity(
//                             opacity: _currentIndex == 0 ? 1 : 0,
//                             duration: Duration(
//                               seconds: 1,
//                             ),
//                             curve: Curves.linear,
//                             child: Image.asset("assets/illustration_one.png"),
//                           ),
//                         ),
//                         Positioned(
//                           top: 0,
//                           left: 0,
//                           right: 0,
//                           bottom: 0,
//                           child: AnimatedOpacity(
//                             opacity: _currentIndex == 1 ? 1 : 0,
//                             duration: Duration(seconds: 1),
//                             curve: Curves.linear,
//                             child: Image.asset("assets/illustration_one.png"),
//                           ),
//                         ),
//                         Positioned(
//                           top: 0,
//                           left: 0,
//                           right: 0,
//                           bottom: 0,
//                           child: AnimatedOpacity(
//                             opacity: _currentIndex == 2 ? 1 : 0,
//                             duration: Duration(seconds: 1),
//                             curve: Curves.linear,
//                             child: Image.asset("assets/illustration_one.png"),
//                           ),
//                         )
//                       ]),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     FadeInDown(
//                         duration: Duration(milliseconds: 500),
//                         child: Text(
//                           "Verification",
//                           style: TextStyle(
//                               fontSize: 30, fontWeight: FontWeight.bold),
//                         )),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     FadeInDown(
//                       delay: Duration(milliseconds: 500),
//                       duration: Duration(milliseconds: 500),
//                       child: Text(
//                         "Please enter the 4 digit code sent to \n +93 706-399-999",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey.shade500,
//                             height: 1.5),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//
//                     // Verification Code Input
//                     FadeInDown(
//                       delay: Duration(milliseconds: 600),
//                       duration: Duration(milliseconds: 500),
//                       child: VerificationCode(
//                         length: 4,
//                         textStyle: TextStyle(fontSize: 20, color: Colors.black),
//                         underlineColor: Colors.black,
//                         keyboardType: TextInputType.number,
//                         underlineUnfocusedColor: Colors.black,
//                         onCompleted: (value) {
//                           setState(() {
//                             _code = value;
//                           });
//                         },
//                         onEditing: (value) {},
//                       ),
//                     ),
//
//                     SizedBox(
//                       height: 20,
//                     ),
//                     FadeInDown(
//                       delay: Duration(milliseconds: 700),
//                       duration: Duration(milliseconds: 500),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don't resive the OTP?",
//                             style: TextStyle(
//                                 fontSize: 14, color: Colors.grey.shade500),
//                           ),
//                           TextButton(
//                               onPressed: () {
//                                 if (_isResendAgain) return;
//                                 resend();
//                               },
//                               child: Text(
//                                 _isResendAgain
//                                     ? "Try again in " + _start.toString()
//                                     : "Resend",
//                                 style: TextStyle(color: Colors.blueAccent),
//                               ))
//                         ],
//                       ),
//                     ),
//                     // SizedBox(height: 50,),
//                     // FadeInDown(
//                     //   delay: Duration(milliseconds: 800),
//                     //   duration: Duration(milliseconds: 500),
//                     //   child: MaterialButton(
//                     //     elevation: 0,
//                     //     onPressed: (){
//                     //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register(),),);
//                     //     },
//                     //     color: Colors.blue,
//                     //     minWidth: MediaQuery.of(context).size.width * 0.8,
//                     //     height: 50,
//                     //     child: _isLoadingOTP ? Container(
//                     //       width: 20,
//                     //       height: 20,
//                     //       child: CircularProgressIndicator(
//                     //         backgroundColor: Colors.white,
//                     //         strokeWidth: 3,
//                     //         color: Colors.black,
//                     //       ),
//                     //     ) : _isVerified ? Icon(Icons.check_circle, color: Colors.white, size: 30,) : Text("Verify", style: TextStyle(color: Colors.white),),
//                     //   ),
//                     // )
//                   ],
//                 )),
//           )),
//       Step(
//         state: currentStep > 2 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 2,
//         title: Text("Basic Details"),
//         content: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 10),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: Icon(Icons.arrow_back),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       "Register new\naccount ",
//                       style: TextStyle(
//                         fontFamily: "OpenSans",
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.5,
//                         fontSize: 20.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Stack(fit: StackFit.loose, children: <Widget>[
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       _image == null
//                           ? Container(
//                         width: 140.0,
//                         height: 140.0,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             image: ExactAssetImage('assets/as.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       )
//                           : ClipOval(
//                         child: Image.file(
//                           _image,
//                           width: 140.0,
//                           height: 140.0,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.only(top: 90.0, right: 100.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           GestureDetector(
//                             onTap: () {
//                               _showPicker(context);
//                             },
//                             child: const CircleAvatar(
//                               backgroundColor: Colors.blueGrey,
//                               radius: 25.0,
//                               child: Icon(
//                                 Icons.camera_alt,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                 ]),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//                 child: Form(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(child: DropdownButtonFormField(
//                             decoration:const InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                               ),
//                             ),
//                             hint: Text(salutation[0]),
//                             // items: salutation,
//                             onChanged: (newVal) {
//                               setState(() {
//                                 mySelection = newVal;
//                               });
//                             },
//                             value: mySelection,
//                           ),),
//                           Expanded(
//                             child: const TextField(
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.all(0.0),
//                                 labelText: 'First Name',
//                                 labelStyle: TextStyle(
//                                   color: Colors.blueGrey,
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.w500,
//                                   letterSpacing: 1.5,
//                                   fontSize: 15.5,
//                                 ),
//                                 floatingLabelStyle: TextStyle(
//                                   color: Color(0xff2972ff),
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.bold,
//                                   // letterSpacing: 1.5,
//                                   fontSize: 17.5,
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0xff2972ff),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(
//                         height: 20,
//                       ),
//
//                       Row(
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           Expanded(
//                             child: const TextField(
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.all(0.0),
//                                 labelText: 'Middle Name',
//                                 labelStyle: TextStyle(
//                                   color: Colors.blueGrey,
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.w500,
//                                   letterSpacing: 1.5,
//                                   fontSize: 15.5,
//                                 ),
//                                 floatingLabelStyle: TextStyle(
//                                   color: Color(0xff2972ff),
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.bold,
//                                   // letterSpacing: 1.5,
//                                   fontSize: 17.5,
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0xff2972ff),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: const TextField(
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.all(0.0),
//                                 labelText: 'Last Name Name',
//                                 labelStyle: TextStyle(
//                                   color: Colors.blueGrey,
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.w500,
//                                   letterSpacing: 1.5,
//                                   fontSize: 15.5,
//                                 ),
//                                 floatingLabelStyle: TextStyle(
//                                   color: Color(0xff2972ff),
//                                   fontFamily: "ProximaNova",
//                                   fontWeight: FontWeight.bold,
//                                   // letterSpacing: 1.5,
//                                   fontSize: 17.5,
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0xff2972ff),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const TextField(
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.all(0.0),
//                           labelText: 'E-mail',
//                           labelStyle: TextStyle(
//                             color: Colors.blueGrey,
//                             fontFamily: "ProximaNova",
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 1.5,
//                             fontSize: 15.5,
//                           ),
//                           floatingLabelStyle: TextStyle(
//                             color: Color(0xff2972ff),
//                             fontFamily: "ProximaNova",
//                             fontWeight: FontWeight.bold,
//                             // letterSpacing: 1.5,
//                             fontSize: 17.5,
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0xff2972ff),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 20, bottom: 20, top: 10),
//                         child: Text(
//                           "Gender",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: Colors.blueGrey,
//                             fontFamily: "ProximaNova",
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 1.5,
//                             fontSize: 15.5,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, bottom: 20),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             GFRadio(
//                               size: 20,
//                               activeBorderColor: Color(0xff2972ff),
//                               value: 0,
//                               groupValue: genderGroupValue,
//                               onChanged: (value) {
//                                 setState(() {
//                                   genderGroupValue = value;
//                                 });
//                               },
//                               inactiveIcon: null,
//                               radioColor: Color(0xff2972ff),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             const Text(
//                               "Male",
//                               style: TextStyle(
//                                 fontFamily: "Poppins",
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.5,
//                                 fontSize: 14.5,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             GFRadio(
//                               size: 20,
//                               value: 1,
//                               groupValue: genderGroupValue,
//                               onChanged: (value) {
//                                 setState(() {
//                                   genderGroupValue = value;
//                                 });
//                               },
//                               inactiveIcon: null,
//                               activeBorderColor: Color(0xff2972ff),
//                               radioColor: Color(0xff2972ff),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             const Text(
//                               "Female",
//                               style: TextStyle(
//                                 fontFamily: "Poppins",
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.5,
//                                 fontSize: 14.5,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             GFRadio(
//                               size: 20,
//                               activeBorderColor: Color(0xff2972ff),
//                               value: 3,
//                               groupValue: genderGroupValue,
//                               onChanged: (value) {
//                                 setState(() {
//                                   genderGroupValue = value;
//                                 });
//                               },
//                               inactiveIcon: null,
//                               radioColor: Color(0xff2972ff),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             const Text(
//                               "Others",
//                               style: TextStyle(
//                                 fontFamily: "Poppins",
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.5,
//                                 fontSize: 14.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, bottom: 20),
//                         child: Text(
//                           "Experience",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: Colors.blueGrey,
//                             fontFamily: "ProximaNova",
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 1.5,
//                             fontSize: 15.5,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, bottom: 20),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             GFRadio(
//                               size: 20,
//                               activeBorderColor: Color(0xff2972ff),
//                               value: 0,
//                               groupValue: experienceGroupValue,
//                               onChanged: (value) {
//                                 setState(() {
//                                   experienceGroupValue = value;
//                                 });
//                               },
//                               inactiveIcon: null,
//                               radioColor: Color(0xff2972ff),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             const Text(
//                               "Fresher",
//                               style: TextStyle(
//                                 fontFamily: "Poppins",
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.5,
//                                 fontSize: 14.5,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             GFRadio(
//                               size: 20,
//                               value: 1,
//                               groupValue: experienceGroupValue,
//                               onChanged: (value) {
//                                 setState(() {
//                                   experienceGroupValue = value;
//                                 });
//                               },
//                               inactiveIcon: null,
//                               activeBorderColor: Color(0xff2972ff),
//                               radioColor: Color(0xff2972ff),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             const Text(
//                               "Experienced",
//                               style: TextStyle(
//                                 fontFamily: "Poppins",
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.5,
//                                 fontSize: 14.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       GFListTile(
//                         avatar: Icon(Iconsax.location),
//                         title: Text(
//                           "Current Location",
//                           style: TextStyle(
//                             color: Colors.blueGrey,
//                             fontFamily: "ProximaNova",
//                             fontWeight: FontWeight.w500,
//                             letterSpacing: 1.5,
//                             fontSize: 15.5,
//                           ),
//                         ),
//                         onTap: () {
//                           print("Get Location");
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Center(
//                         child: Column(
//                           children: [
//                             // ignore: missing_required_param
//                             searchTextField = AutoCompleteTextField(
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16.0,
//                               ),
//                               decoration: InputDecoration(
//                                 suffixIcon: Container(
//                                   width: 85.0,
//                                   height: 60.0,
//                                 ),
//                                 contentPadding:
//                                 EdgeInsets.fromLTRB(10, 30, 10, 20),
//                                 filled: true,
//                                 hintText: "Job Category",
//                                 hintStyle: TextStyle(color: Colors.black),
//                               ),
//                               itemBuilder: (context, item) {
//                                 return Row(
//                                   children: [
//
//                                   ],
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       // Container(
//                       //   width: double.infinity,
//                       //   child: GFButton(
//                       //     color: Color(0xff2972ff),
//                       //     onPressed: () {
//                       //       Navigator.push(
//                       //           context,
//                       //           MaterialPageRoute(
//                       //               builder: (context) => ProfileChoice()));
//                       //     },
//                       //     text: "Register",
//                       //     textStyle: TextStyle(
//                       //       color: Colors.white,
//                       //       fontFamily: "Poppins",
//                       //       fontWeight: FontWeight.bold,
//                       //       // letterSpacing: 1.5,
//                       //       fontSize: 14.5,
//                       //     ),
//                       //   ),
//                       // ),
//                       // FadeInDown(
//                       //   delay: Duration(milliseconds: 600),
//                       //   child: MaterialButton(
//                       //     minWidth: double.infinity,
//                       //     onPressed: () {
//                       //       setState(() {
//                       //         _isLoading = true;
//                       //       });
//                       //       Navigator.push(
//                       //           context,
//                       //           MaterialPageRoute(
//                       //               builder: (context) => SetupProfile()));
//                       //       Future.delayed(Duration(seconds: 2), () {
//                       //         setState(() {
//                       //           _isLoading = false;
//                       //         });
//                       //       });
//                       //     },
//                       //     color: Colors.black,
//                       //     shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(5)),
//                       //     padding: const EdgeInsets.symmetric(
//                       //         vertical: 15, horizontal: 30),
//                       //     child: _isLoading
//                       //         ? Container(
//                       //             width: 20,
//                       //             height: 20,
//                       //             child: const CircularProgressIndicator(
//                       //               backgroundColor: Colors.white,
//                       //               color: Colors.black,
//                       //               strokeWidth: 2,
//                       //             ),
//                       //           )
//                       //         : Text(
//                       //             "Request OTP",
//                       //             style: TextStyle(color: Colors.white),
//                       //           ),
//                       //   ),
//                       // ),
//                       // const SizedBox(
//                       //   height: 20,
//                       // ),
//                       // Row(
//                       //   children: const [
//                       //     Expanded(
//                       //         child: Divider(
//                       //       endIndent: 20,
//                       //       indent: 10,
//                       //       thickness: 1.3,
//                       //     )),
//                       //     Text("OR"),
//                       //     Expanded(
//                       //         child: Divider(
//                       //       indent: 20,
//                       //       endIndent: 10,
//                       //       thickness: 1.3,
//                       //     )),
//                       //   ],
//                       // ),
//                       // const SizedBox(
//                       //   height: 10,
//                       // ),
//                       // ignore: deprecated_member_use
//                       // FlatButton(
//                       //   shape: RoundedRectangleBorder(
//                       //     borderRadius: BorderRadius.circular(36),
//                       //     side: const BorderSide(color: Colors.black),
//                       //   ),
//                       //   onPressed: () {},
//                       //   child: Container(
//                       //     padding: const EdgeInsets.symmetric(vertical: 8),
//                       //     child: Row(
//                       //       mainAxisAlignment: MainAxisAlignment.center,
//                       //       children: const <Widget>[
//                       //         Image(
//                       //           height: 30,
//                       //           width: 20,
//                       //           image: AssetImage(
//                       //             'assets/google.png',
//                       //           ),
//                       //         ),
//                       //         SizedBox(
//                       //           width: 20,
//                       //         ),
//                       //         Text('Join with Google')
//                       //       ],
//                       //     ),
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 15),
//                       // FlatButton(
//                       //   shape: RoundedRectangleBorder(
//                       //     borderRadius: BorderRadius.circular(36),
//                       //     side: const BorderSide(color: Colors.black),
//                       //   ),
//                       //   onPressed: () {},
//                       //   child: Container(
//                       //     padding: const EdgeInsets.symmetric(vertical: 8),
//                       //     child: Row(
//                       //       mainAxisAlignment: MainAxisAlignment.center,
//                       //       children: const <Widget>[
//                       //         Image(
//                       //           height: 30,
//                       //           width: 30,
//                       //           image: AssetImage(
//                       //             'assets/apple-logo.png',
//                       //           ),
//                       //         ),
//                       //         SizedBox(
//                       //           width: 20,
//                       //         ),
//                       //         Text('Join with Apple')
//                       //       ],
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Step(
//         state: currentStep > 3 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 3,
//         title: Text("Candidate Details"),
//         content: Container(
//           child: Center(
//             child: Text("Step 4 Registration"),
//           ),
//         ),
//       ),
//     ];
//   }
// }
