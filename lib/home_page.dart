// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_items_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/profile_page.dart';
import 'package:job_portal/providers/job_provider.dart';
import 'package:job_portal/theme.dart';
import 'package:job_portal/widgets/post_card.dart';
import 'package:provider/provider.dart';

import 'models/job_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var userProvider = Provider.of<UserProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);
    final List<String> imageList = [
      "https://images.unsplash.com/photo-1536148935331-408321065b18?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZ3JhbW1lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1596003906949-67221c37965c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZ3JhbW1lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1551033406-611cf9a28f67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZ3JhbW1lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1525373698358-041e3a460346?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2dyYW1tZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1549692520-acc6669e2f0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2dyYW1tZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1542546068979-b6affb46ea8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2dyYW1tZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
    ];
    Widget header() {
      return Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 24,
          right: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                "Vijay Niranjan",
                  style: subTitleTextStyle,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 58,
                    height: 58,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff2A327D),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      'assets/show_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Special Categories',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff272C2F),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child:  GFItemsCarousel(
                rowCount: 3,
                children: imageList.map(
                      (url) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child:
                        Image.network(url, fit: BoxFit.cover, width: 1000.0),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Just Posted',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff272C2F),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (job) => PostCard(job),
                        )
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          selectedItemColor: Color(0xff272C2F),
          unselectedItemColor: Color(0xffB3B5C4),
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/navbar_one.png',
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/navbar_two.png',
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/navbar_three.png',
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/navbar_four.png',
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(
                height: 30,
              ),
              body(),
            ],
          ),
        ),
      ),
    );
  }
}
