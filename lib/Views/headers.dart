// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:job_portal/Controller/menucontroller.dart';
// import 'package:job_portal/Views/theme/images.dart';
// import 'package:provider/provider.dart';
//
// import 'inbox.dart';
//
// class headers extends StatefulWidget {
//   const headers({Key key}) : super(key: key);
//
//   @override
//   _headersState createState() => _headersState();
// }
//
// class _headersState extends State<headers> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//           GestureDetector(
//             onTap:context.read<MenuController>().controlMenu,
//             child: CircleAvatar(
//               backgroundImage: AssetImage(Images.user1),
//             ),
//           ),
//
//           IconButton(
//             icon: Icon(Icons.chat, color: Color(0xff3e61ed),),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => InboxList()));
//             },
//           ),
//           ],
//           ),
//     );
//
//   }
//
//
// }
//
//
// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: "Search",
//         // fillColor: secondaryColor,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//         ),
//         suffixIcon: InkWell(
//           onTap: () {},
//           child: Container(
//             // padding: EdgeInsets.all(10),
//             // margin: EdgeInsets.symmetric(horizontal:10),
//             decoration: BoxDecoration(
//               // color: primaryColor,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             child: SvgPicture.asset(
//               "assets/map.png", color: Colors.lightBlueAccent[700],),
//           ),
//         ),
//       ),
//     );
//   }
// }
