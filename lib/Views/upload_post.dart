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
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  // backgroundImage: AssetImage("assets/show_image"),
                  backgroundColor: Colors.blue,
                ),

                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text(
                       "Tahseen abass",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Chip(
                        avatar: CircleAvatar(
                            backgroundColor: Colors.grey, child: const Text("umar")),
                        label: const Text("anyone")),
                  ],
                ),


              ],
            ),

            SizedBox(
              height: 15
            ),
            TextField(

              decoration: InputDecoration(
                border: OutlineInputBorder(),

                label: Text("what do you want to talk about"),
              ),




            )
          ],
        ),
      ),
    );
  }
}
