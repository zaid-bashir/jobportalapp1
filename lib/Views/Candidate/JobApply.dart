import 'package:flutter/material.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({Key key}) : super(key: key);

  static Route<T> getJobDetail<T>() {
    return MaterialPageRoute(
      builder: (_) => JobDetailPage(),
    );
  }

  @override
  _JobDetailPageState createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 26),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(Images.gitlab, height: 40),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Gitlab",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: KColors.title,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "UX Designer",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: KColors.subtitle,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 32),
          // Row(
          //   children: [
          //     _headerStatic("Job-Type", "Full-Time"),
          //     _headerStatic("Applicants", "45"),
          //     _headerStatic("Time", "6 days ago"),
          //   ],
          // ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Icon(
                      Icons.work_outline_outlined,
                      color: Color(0xff3e61ed),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Full-Time",
                      style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: const [
                    Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xff3e61ed),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "10 Applicants",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: const [
                    Icon(
                      Icons.schedule_outlined,
                      color: Color(0xff3e61ed),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "6 days ago",
                      style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: Color(0xff3e61ed),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Delhi(On-Site)",
                      style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text("Full-Time"),
          //     Text("45 Applicants"),
          //     Text("4 days ago"),
          //     Text("Delhi"),
          //   ],
          // ),
          const Divider(
            color: KColors.icon,
            height: 25,
          )
        ],
      ),
    );
  }

  // Widget _headerStatic(String title, String sub) {
  //   return Expanded(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 12,
  //             fontWeight: FontWeight.w400,
  //             color: KColors.subtitle,
  //           ),
  //         ),
  //         SizedBox(height: 5),
  //         Text(
  //           sub,
  //           style: TextStyle(
  //             fontSize: 14,
  //             fontWeight: FontWeight.bold,
  //             color: KColors.title,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _jobDescription(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Job Description",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "You will be Gitlab's dedicated UI/Ux designer, reporting to the chief Technology Officer. You will come up with the user experience for few product features, including developing conceptual design to test with clients and then. Share the...",
                style: TextStyle(fontSize: 14, color: KColors.subtitle),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                child: const Text("Learn more",
                    style: TextStyle(fontSize: 14, color: KColors.primary)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyDescription(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Company Details",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "You will be Gitlab's dedicated UI/Ux designer, reporting to the chief Technology Officer. You will come up with the user experience for few product features, including developing conceptual design to test with clients and then. Share the...",
                style: TextStyle(fontSize: 14, color: KColors.subtitle),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero)),
                child: const Text("Learn more",
                    style: TextStyle(fontSize: 14, color: KColors.primary)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _recruiterDescription(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recruiters Details",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Recruiter",
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "ProximaNova" ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Company Recruiter at Cactus",
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: "ProximaNova", color: KColors.subtitle),
              ),
              const SizedBox(height: 5),
              const Text(
                "Communications Pvt.Ltd",
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: "ProximaNova", color: KColors.subtitle),
              ),
              const SizedBox(height: 5),
              const Text(
                "Mumbai",
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: "ProximaNova", color: KColors.subtitle ),
              ),
              Row(
                children: [
                  const Icon(Icons.language_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero)),
                    child: const Text("http://www.romaan.com",
                        style: TextStyle(fontSize: 14, color: KColors.primary)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ourPeople(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Our People",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _people(context, img: Images.user1, name: "J. Smith"),
                _people(context, img: Images.user2, name: "L. James"),
                _people(context, img: Images.user3, name: "Emma"),
                _people(context, img: Images.user4, name: "Mattews"),
                _people(context, img: Images.user5, name: "Timothy"),
                _people(context, img: Images.user6, name: "Kyole"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _people(BuildContext context, {String img, String name}) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 10, color: KColors.subtitle)),
        ],
      ),
    );
  }

  Widget _apply(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 54),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(KColors.primary),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16))),
              onPressed: () {},
              child: const Text(
                "Apply Now",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 50,
            width: 60,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(color: KColors.primary),
                ),
              ),
              child: const Icon(
                Icons.bookmark_border,
                color: KColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KColors.background,
          iconTheme: const IconThemeData(color: KColors.primary),
          elevation: 1,
          actions: [
            IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(context),
                _jobDescription(context),
                const SizedBox(
                  height: 10,
                ),
                _recruiterDescription(context),
                const SizedBox(
                  height: 10,
                ),
                _companyDescription(context),
                _ourPeople(context),
                _apply(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
