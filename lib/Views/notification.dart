import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notify extends StatefulWidget {
  const  Notify({Key key}) : super(key: key);
  @override
  _NotifyState createState() => _NotifyState();
}

 class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text("Notification",
          style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold), ),
          trailing:  CircleAvatar(
            child: Icon(Icons.search, color: Colors.white,),
            backgroundColor: Colors.blue,
          ),


        ),
        SizedBox( height: 20,),
         Row(
           children: [
             SizedBox(width: 15,),
             Text("Earlier", style: TextStyle( fontSize: 18, fontWeight:FontWeight.bold),)
             
           ],
         ),
        SizedBox( height: 20,),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/show_image"),
            backgroundColor: Colors.blue,
          ),
          title: Text("Tahseen abass viewed your profile "),
          trailing: Icon(Icons.menu),
        )


      ],

    );
  }
}
