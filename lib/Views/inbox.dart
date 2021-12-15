import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InboxList extends StatefulWidget {


  @override
  _InboxListState createState() => _InboxListState();
}

class _InboxListState extends State<InboxList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
       leading: IconButton(onPressed: (){
         Navigator.of(context).pop();
       }, icon:Icon(Icons.arrow_back),color: Colors.black,),

        title: Text('Messaging',style: const TextStyle(color:Colors.black),),
        actions:  const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
           child: Icon(Icons.more_vert,color: Colors.black,),
          ),
           Padding(
             padding: EdgeInsets.only(right: 5.0),
             child: Icon(Icons.edit,color: Colors.black,),
           ),

        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 1.0),
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    const SizedBox(
    height: 25.0,
    ),
      ListView.builder(

        itemCount: 10,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder:(context,index) {
          return   const Card(
            //elevation: 0.0,
           // margin: const EdgeInsets.only(right: 10.0,top: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/apple-logo.png',)
              ),
              // Container(
              //     width: 50.0,
              //     height: 50.0,
              //     decoration: BoxDecoration(
              //
              //       borderRadius: BorderRadius.circular(12.0),
              //       image:DecorationImage(
              //         image: AssetImage('assets/user/user1.jpg'),fit: BoxFit.cover
              //     )
              // ),
              // ),
              title: Text('Username'),
              subtitle: Text('Text'),



          )
          );



        },

      )



]
    )
    )
      )
    );
  }
}
