import 'package:flutter/material.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/GetJobList.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/Sidebar.dart';
import 'package:provider/src/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'Inbox.dart';
import 'JobApply.dart';

class JobsList extends StatefulWidget {
  const JobsList({Key key}) : super(key: key);

  @override
  _JobsListState createState() => _JobsListState();
}


class _JobsListState extends State<JobsList> {

  ApiResponse<List<GetJobList>> _apiResponse;
  ApiServices apiServices =ApiServices();

  bool isLoading;

  @override
  void initState() {
    print("--------");

    getJob();
    print("--------");
    super.initState();
  }

    getJob()async{
      setState(() {
        isLoading = true;
      });
      _apiResponse = await apiServices.getJobList();
      setState(() {
        isLoading = false;
      });
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: context.read<MenuController>().scaffoldKeys,
            drawer: const SideMenu(),
            body: SingleChildScrollView(
                child: Column(children: [
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
                          style:
                              TextStyle(fontSize: 15, color: KColors.subtitle),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.chat,
                        color: Color(0xff3e61ed),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InboxList()));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
                  Container(
                    margin: EdgeInsets.only(left: 1.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 20.0,
                            ),
                              Builder(builder: (_) {
                                if (isLoading) {
                                  return  Center(
                                    child: Shimmer.fromColors( baseColor: Colors.grey, highlightColor: Colors.white)
                                  );
                                }
                                if (_apiResponse.error) {
                                  return Center(
                                    child: Text(_apiResponse.errorMessage),
                                  );
                                }
                                return
                                  ListView.builder(
                                  itemCount: _apiResponse.data.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      //elevation: 0.0,
                                      // margin: const EdgeInsets.only(right: 10.0,top: 10.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(),
                                        ),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.grey.shade100,
                                            child: Icon(
                                              Icons.work,
                                              color:  Color(0xff3e61ed),
                                            ),
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
                                          trailing: const Icon(
                                            Icons.more_vert,
                                            color: Colors.black,
                                          ),

                                          title: Text(_apiResponse.data[index].jobHeadline,style: TextStyle(fontFamily: "ProximaNova"),),
                                          subtitle: Text(_apiResponse.data[index].companyName,style: TextStyle(fontFamily: "ProximaNova")),
                                          onTap: (){
                                            Navigator.push(context, JobDetailPage.getJobDetail());
                                          },
                                        ));
                                  },
                                );
                              })

                          ]
                      )

                  )

            ]))));
  }
}

