import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/sidebar.dart';
import 'package:job_portal/Views/SignIn/bluecollar.dart';
import 'package:provider/provider.dart';

import 'jobapply.dart';
import 'inbox.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Widget _appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: context.read<MenuController>().controlMenu,
            child: CircleAvatar(
              backgroundImage: AssetImage(Images.user1),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.chat,
              color: Color(0xff3e61ed),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InboxList()));
            },
          )
        ],
      ),
    );
  }

  Widget _carosel(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          const Text("Your profile needs attention !",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.redAccent.withOpacity(0.2),
            ),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("What are you missing out?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("Recruiters reach candidates directly for job roles",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("Recruiters reach candidates directly for job roles",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GFButton(
                  color: const Color(0xff3e61ed),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => BlueCollar()));
                  },
                  shape: GFButtonShape.pills,
                  child: const Text(
                    "Complete profile",
                    style: TextStyle(
                      fontFamily: "ProximaNova",
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hello Isra",
              style: TextStyle(
                fontSize: 15,
                fontFamily: "ProximaNova",
                color: KColors.subtitle,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            height: 6,
          ),
          const Text("Find your perfect job",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "ProximaNova",
                  color: KColors.title,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: KColors.lightGrey,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "What are you looking for?",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "ProximaNova",
                        color: KColors.subtitle),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: KColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 40,
                child: IconButton(
                  color: KColors.primary,
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _recommendedCourses(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 210,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Suggestions for your career ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "ProximaNova",
                color: KColors.title),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  elevation: 5,
                  child: AspectRatio(
                    aspectRatio: 1.6,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: isActive ? KColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  // color: isActive ? Colors.white : KColors.lightGrey,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Icon(
                                  Icons.block,
                                  color: Color(0xff3e61ed),
                                ),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              const Text(
                                "Flutter complete\ncourse(Dart)",
                                style: TextStyle(
                                    color: Color(0xff3e61ed),
                                    fontFamily: "ProximaNova",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "By ClustTech",
                            style: TextStyle(
                              color: Color(0xff3e61ed),

                              fontFamily: "ProximaNova",
                              fontSize: 12,
                              // color: isActive ? Colors.white38 : KColors.subtitle,
                            ),
                          ),
                          const SizedBox(height: 9),
                          Row(
                            children: const [
                              Text(
                                "Duration :",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",

                                  fontSize: 12,
                                  // color: isActive ? Colors.white38 : KColors.subtitle,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "120 Hrs",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "ProximaNova",
                                    color: Color(0xff3e61ed),
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "|",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Mode:",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",

                                  fontSize: 12,
                                  // color: isActive ? Colors.white38 : KColors.subtitle,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Online",
                                style: TextStyle(
                                    fontFamily: "ProximaNova",
                                    color: Color(0xff3e61ed),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: const [
                              Text(
                                "RS :",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",

                                  fontSize: 12,
                                  // color: isActive ? Colors.white38 : KColors.subtitle,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "3500",
                                style: TextStyle(
                                    fontFamily: "ProximaNova",
                                    color: Color(0xff3e61ed),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: AspectRatio(
                    aspectRatio: 1.6,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: isActive ? KColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  // color: isActive ? Colors.white : KColors.lightGrey,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Icon(
                                  Icons.block,
                                  color: Color(0xff3e61ed),
                                ),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              const Text(
                                "Java complete\ncourse",
                                style: TextStyle(
                                    color: Color(0xff3e61ed),
                                    fontFamily: "ProximaNova",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "By Oracle",
                            style: TextStyle(
                              color: Color(0xff3e61ed),

                              fontFamily: "ProximaNova",
                              fontSize: 12,
                              // color: isActive ? Colors.white38 : KColors.subtitle,
                            ),
                          ),
                          const SizedBox(height: 9),
                          Row(
                            children: const [
                              Text(
                                "Duration :",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",

                                  fontSize: 12,
                                  // color: isActive ? Colors.white38 : KColors.subtitle,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "150 Hrs",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "ProximaNova",
                                    color: Color(0xff3e61ed),
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "|",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Mode:",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",

                                  fontSize: 12,
                                  // color: isActive ? Colors.white38 : KColors.subtitle,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Online",
                                style: TextStyle(
                                    fontFamily: "ProximaNova",
                                    color: Color(0xff3e61ed),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: const [
                              Text(
                                "RS :",
                                style: TextStyle(
                                  fontFamily: "ProximaNova",

                                  fontSize: 12,
                                  // color: isActive ? Colors.white38 : KColors.subtitle,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "6500",
                                style: TextStyle(
                                    fontFamily: "ProximaNova",
                                    color: Color(0xff3e61ed),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                    // color: isActive ? Colors.white38 : KColors.subtitle,
                                    ),
                             ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Suggestions for you",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "ProximaNova",
                color: KColors.title),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _recommendedJob(context,
                    company: "Google",
                    img: Images.google,
                    title: "UX Designer",
                    sub: "\$45,000 Remote",
                    isActive: true),
                _recommendedJob(context,
                    company: "DropBox",
                    img: Images.dropbox,
                    title: "Reserch Assist",
                    sub: "\$45,000 Remote",
                    isActive: false),
                _recommendedJob(context,
                    company: "DropBox",
                    img: Images.dropbox,
                    title: "Reserch Assist",
                    sub: "\$45,000 Remote",
                    isActive: false),
                _recommendedJob(context,
                    company: "DropBox",
                    img: Images.dropbox,
                    title: "Reserch Assist",
                    sub: "\$45,000 Remote",
                    isActive: false),
                _recommendedJob(context,
                    company: "DropBox",
                    img: Images.dropbox,
                    title: "Reserch Assist",
                    sub: "\$45,000 Remote",
                    isActive: false)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedJob(
    BuildContext context, {
    String img,
    String company,
    String title,
    String sub,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, JobDetailPage.getJobDetail());
        },
        child: AspectRatio(
          aspectRatio: 1.3,
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? KColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : KColors.lightGrey,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Image.asset(img),
                ),
                const SizedBox(height: 16),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white38 : KColors.subtitle,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: isActive ? Colors.white : KColors.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white38 : KColors.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _strenght(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 25,right: 25, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Isra Riaz",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold),
                    ),
                     Container(
                       padding: const EdgeInsets.only(left: 6,right: 6),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.green
                       ),
                       child: Row(
                         children: [
                           const Icon(Icons.done,color: Colors.white,),
                           const Text("Active",
                             style: TextStyle(
                               color: Colors.white,
                                 fontSize: 14,
                                 fontFamily: "ProximaNova",
                                 fontWeight: FontWeight.bold),),
                         ],
                       ),
                     ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Profile Strength",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w500),),
                const SizedBox(height: 10,),
                const SizedBox(
                  width: 220,
                  child: ProgressLine(
                    color: Color(0xff3e61ed),
                    percentage: 75,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Activity",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500),),
                const SizedBox(height: 10,),
                const SizedBox(
                  width: 220,
                  child: ProgressLine(
                    color: Colors.blueGrey,
                    percentage: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _warning(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 10),
      child: SizedBox(
        // padding:EdgeInsets.all(20),
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recruiter activity",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "2 Recruiters express interest in your profile in pst 60days",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xff3e61ed),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "1",
                      style: TextStyle(
                          // color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                          // color: isActive ? Colors.white38 : KColors.subtitle,
                          ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      " Profile Views",
                      style: TextStyle(
                          // color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                          // color: isActive ? Colors.white38 : KColors.subtitle,
                          ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const SizedBox(
                      width: 220,
                      child: ProgressLine(
                        color: Color(0xff3e61ed),
                        percentage: 75,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "1",
                      style: TextStyle(
                          // color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                          // color: isActive ? Colors.white38 : KColors.subtitle,
                          ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Recruiters Contacted",
                      style: TextStyle(
                          // color: Color(0xff3e61ed),
                          fontFamily: "ProximaNova",
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                          // color: isActive ? Colors.white38 : KColors.subtitle,
                          ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                      width: 220,
                      child: ProgressLine(
                        color: Colors.blueGrey,
                        percentage: 45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _recentPostedJob(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent posted",
            style: TextStyle(fontWeight: FontWeight.bold, color: KColors.title),
          ),
          _jobCard(context,
              img: Images.gitlab,
              title: "Gitlab",
              subtitle: "UX Designer",
              salery: "\$78,000"),
          _jobCard(context,
              img: Images.bitbucket,
              title: "Bitbucket",
              subtitle: "UX Designer",
              salery: "\$45,000"),
          _jobCard(context,
              img: Images.slack,
              title: "Slack",
              subtitle: "UX Designer",
              salery: "\$65,000"),
          _jobCard(context,
              img: Images.dropbox,
              title: "Dropbox",
              subtitle: "UX Designer",
              salery: "\$95,000"),
        ],
      ),
    );
  }

  Widget _jobCard(
    BuildContext context, {
    String img,
    String title,
    String subtitle,
    String salery,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, JobDetailPage.getJobDetail());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: KColors.lightGrey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(img),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: KColors.subtitle),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 14,
                      color: KColors.title,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.background,
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appBar(context),
                _header(context),
                _recommendedSection(context),
                _carosel(context),
                _warning(context),
                _strenght(context),


                _recommendedCourses(context),
                // _recentPostedJob(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key key,
    this.color = primaryColor,
    this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;
  static const primaryColor = Color(0xFF2697FF);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
class Chart extends StatelessWidget {
  const Chart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: defaultPadding),
                Text(
                  "29.1",
                  style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0.5,
                  ),
                ),
                Text("of 128GB")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    // color: primaryColor,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    // color: primaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];