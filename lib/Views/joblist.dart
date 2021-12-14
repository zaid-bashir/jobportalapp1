import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/Widgets/companycard.dart';

class JobList extends StatefulWidget {
  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade100,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 18.0,
            top: 12.0,
            bottom: 12.0,
            right: 12.0,
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          SizedBox(
            width: 18.0,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                "Hi Robert,\nFind your Dream Job",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              const SizedBox(height: 25.0),
              Container(
                width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.only(right: 18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const TextField(
                          cursorColor: Colors.black38,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25.0,
                            ),
                            border: InputBorder.none,
                            hintText: "Search for job title",
                            hintStyle: TextStyle(color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      margin: EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'Popular Company ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                height: 190.0,
                child: ListView.builder(
                     itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                        return CompanyCard();

                    }),
              ),
              const SizedBox(
                height: 35.0,
              ),
              const Text("Recent Jobs",style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300)),
              ListView.builder(

              itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder:(context,index) {
                return Card(
                  elevation: 0.0,
                    margin: EdgeInsets.only(right: 18.0,top: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                      // image:DecorationImage(
             //   image: AssetImage(),fit: BoxFit.cover
                        )
                      ),
                    title: Text('Senior Flutter Developer'),
subtitle: Text('Company name'),
                    trailing: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                    ),

                  );



                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
