import 'package:flutter/material.dart';
import 'package:job_portal/Controller/menu_controller.dart';
import 'package:provider/provider.dart';

import '../jobs.dart';
import '../notification.dart';
import '../profile_page.dart';
import '../upload_post.dart';
import 'home_page.dart';



class Navbar extends StatelessWidget {
  Navbar({Key key}) : super(key: key);

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
          title: 'Flutter Demo',

          theme: ThemeData(
            // primaryColor: Color(0xFFC41A3B),
            // primaryColorDark:  Color(0xFFC41A3B),
            primaryColorLight: const Color(0xFFFBE0E6),
            // accentColor: const Color(0xFFC41A3B),
            accentColor: Colors.lightBlueAccent[700],
          ),
          home: Navlist(),
        ),
     );

  }
}

class Navlist extends StatefulWidget {
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
    _tabController = TabController(length: 5, vsync: this);
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
          HomePage(),
          Notify(),
          UploadPost(),
          JobsList(),
          ProfilePage(),
        ],
        // If you want to disable swiping in tab the use below code
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          // borderRadius: const BorderRadius.all(
          //   Radius.circular(50.0),
          // ),
          child: Container(
            // color: Colors.lightBlueAccent[700].withOpacity(0.4),
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
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(
                    Icons.notifications,
                    size: 24.0,
                  ),
                  text: 'Notifications',
                ),
                Tab(
                  icon: Icon(
                    Icons.add,
                    size: 24.0,
                  ),
                  text: 'Post',
                ),
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