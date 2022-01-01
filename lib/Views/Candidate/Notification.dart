import 'package:flutter/material.dart';

// import 'package:iconsax/iconsax.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/Sidebar.dart';
import 'package:provider/src/provider.dart';

import 'Inbox.dart';

class Notify extends StatefulWidget {
  const Notify({Key key}) : super(key: key);

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: context.read<MenuController>().scaffoldKeys,
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: context.read<MenuController>().controlMenu2,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Images.user1),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: KColors.lightGrey,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "What are you looking for?",
                        style: TextStyle(fontSize: 15, color: KColors.subtitle),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.chat,
                      color: Color(0xff3e61ed),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InboxList()));
                    },
                  ),
                ],
              ),
            ),

            Column(
              children: const [
                // const ListTile(
                //   leading: Text("Notification",
                //     style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold), ),
                //   trailing:  CircleAvatar(
                //     child: Icon(Icons.search, color: Colors.white,),
                //
                //     backgroundColor: Colors.blue,
                //   ),
                // ),
                // const SizedBox( height: 20,),
                // Row(
                //   children: const [
                //     SizedBox(width: 15,),
                //     Text("Earlier", style: TextStyle( fontSize: 18, fontWeight:FontWeight.bold),)
                //
                //   ],
                // ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("Tahseen abass viewed your profile "),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("zaid bashir checked the profile"),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("Tahseen abass viewed your profile "),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("isra riaz viewed your profile "),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title:
                      Text("zaid bashir accepted your connection request"),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("you have a new connection request"),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("Tahseen abass viewed your profile "),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("isra riaz viewed your profile"),
                  trailing: Icon(Icons.menu),
                ),

                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title:
                      Text("zaid bashir accepted your request for connection "),
                  trailing: Icon(Icons.menu),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/show_image.png"),
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("you have a new connection request"),
                  trailing: Icon(Icons.menu),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
