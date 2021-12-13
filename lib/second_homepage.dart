// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_portal/models/category_model.dart';

import 'package:job_portal/models/job_model.dart';
import 'package:job_portal/providers/job_provider.dart';
import 'package:job_portal/theme.dart';
import 'package:job_portal/widgets/post_card.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';


class SecondHomePage extends StatelessWidget {
  final CategoryModel category;

  SecondHomePage(this.category);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      category.imageUrl,
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 180,
                      left: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name,
                          style: jobTitleTextStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '12,309 available',
                          style: jobSubTitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Just Posted',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff272C2F),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FutureBuilder<List<JobModel>>(
                      future: jobProvider.getJobsByCategory(category.name),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: snapshot.data
                                .map(
                                  (job) => PostCard(
                                    job,
                                  ),
                                )
                                .toList(),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    SizedBox(
                      height: 31,
                    ),
                    Text(
                      'New Startup',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff272C2F),
                      ),
                    ),
                    SizedBox(
                      height: 16,
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
