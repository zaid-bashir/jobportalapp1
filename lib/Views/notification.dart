import 'package:flutter/material.dart';

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
        const ListTile(
          leading: Text("Notification",
          style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold), ),
          trailing:  CircleAvatar(
            child: Icon(Icons.search, color: Colors.white,),
            backgroundColor: Colors.blue,
          ),
        ),
        const SizedBox( height: 20,),
         Row(
           children: const [
             SizedBox(width: 15,),
             Text("Earlier", style: TextStyle( fontSize: 18, fontWeight:FontWeight.bold),)
             
           ],
         ),
        const SizedBox( height: 20,),
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/show_image"),
            backgroundColor: Colors.blue,
          ),
          title: Text("Tahseen abass viewed your profile "),
          trailing: Icon(Icons.menu),
        ),


      ],

    );
  }
}
