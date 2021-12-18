

import 'package:flutter/material.dart';

class UploadPost extends StatefulWidget {
  const UploadPost({Key key}) : super(key: key);

  @override
  _UploadPostState createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(""),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text("Tahseen abass"),
                    SizedBox(
                      height: 5,
                    ),
                    Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text("CT"),
                        ),
                        label: Text("Job Portal"))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              // selectionHeightStyle: BoxHeightStyle.max,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "what's in your mind ?"),
            ),
          ),
          ElevatedButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (context) {
              return  Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text("share your files"),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey
                  ),
                  ListTile(
                    leading: Icon(Icons.link),
                    title: Text("share your link"),
                  ),
                  Divider(
                      height: 2,
                      color: Colors.grey
                  ),
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text("Capture from  camera"),
                  ),
                  Divider(
                      height: 2,
                      color: Colors.grey
                  ), ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("edit here"),
                  ),
                  Divider(
                      height: 2,
                      color: Colors.grey
                  ),

                ],
              );
            });
          }, child: Text("More options"))
        ],
      ),
    );
  }
}
