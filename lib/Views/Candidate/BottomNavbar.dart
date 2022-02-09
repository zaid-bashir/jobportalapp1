// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Views/Profile/Profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'Job.dart';
import 'Notification.dart';
class Navbar extends StatelessWidget {
  Navbar({Key key,this.keyjwt,this.prefLogin}) : super(key: key);
  String keyjwt;
  SharedPreferences prefLogin;
  @override
  Widget build(BuildContext context) {
    return
     MultiProvider(
       providers: [
         ChangeNotifierProvider(
           create: (context) => MenuController(),
         ),
       ],
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Job Portal',
          theme: ThemeData(
            // primaryColor: Color(0xFFC41A3B),
            // primaryColorDark:  Color(0xFFC41A3B),
            primaryColorLight: const Color(0xFFFBE0E6),
            // accentColor: const Color(0xFFC41A3B),
            accentColor:const Color(0xff3e61ed),
          ),
          home: Navlist(keyjwt: keyjwt,),
        ),
     );

  }
}

class Navlist extends StatefulWidget {
  Navlist({Key key,this.keyjwt}) : super(key: key);
  String keyjwt;
  @override
  _NavlistState createState() => _NavlistState();
}

class _NavlistState extends State<Navlist>
    with SingleTickerProviderStateMixin {
  String title = 'BottomNavigationBar';

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      //   centerTitle: true,
      // ),
      body: TabBarView(
        children: <Widget>[
          HomePage(keyjwt: widget.keyjwt,),
          Notify(),
          // UploadPost(),
          JobsList(),
          ProfilePage(),
        ],
        // If you want to disable swiping in tab the use below code
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        // padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: ClipRRect(

            child: TabBar(
              labelColor:Theme.of(context).accentColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontSize: 10.0),
              // indicator: const UnderlineTabIndicator(
              //   borderSide: BorderSide(color: Colors.black54, width: 0.0),
              //   insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              // ),
              //For Indicator Show and Customization
              // indicatorColor: Colors.black54,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  text: 'Candidate',
                ),
                Tab(
                  icon: Icon(
                    Icons.notifications,
                    size: 24.0,
                  ),
                  text: 'Notifications',
                ),
                // Tab(
                //   icon: Icon(
                //     Icons.add,
                //     size: 24.0,
                //   ),
                //   text: 'Post',
                // ),
                Tab(
                  icon: Icon(
                    Icons.work,
                    size: 24.0,
                  ),
                  text: 'Jobs',
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  text: 'Profile',
                ),
                // Tab(
                //   icon: Icon(
                //     Icons.more,
                //     size: 24.0,
                //   ),
                //   text: 'More',
                // ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}