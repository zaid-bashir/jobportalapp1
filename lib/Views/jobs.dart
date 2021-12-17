import 'package:flutter/material.dart';

class JobsList extends StatefulWidget {
  const JobsList({Key key}) : super(key: key);

  @override
  _JobsListState createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(children: [
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
                title: const Text('Jobs',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,fontFamily: "ProximaNova")),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 1.0),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        const SizedBox(
                          height: 20.0,
                        ),
                        ListView.builder(
                          itemCount: 5,
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

                                  title: Text('Frontend Web Developer',style: TextStyle(fontFamily: "ProximaNova"),),
                                  subtitle: Text('Crediometer',style: TextStyle(fontFamily: "ProximaNova")),
                                ));
                          },
                        )
                      ])))
              //
            ])));
  }
}
