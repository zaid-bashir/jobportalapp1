// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/theme.dart';
import 'package:job_portal/widgets/requirements_text.dart';

import 'models/job_model.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;

  DetailPage(this.job);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    Widget applyButton() {
      return Center(
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
            onPressed: () {
              setState(() {
                isApplied = !isApplied;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff4141A4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66),
              ),
            ),
            child: Text(
              'Apply for Job',
              style: buttonTextStyle,
            ),
          ),
        ),
      );
    }

    Widget cancelApplyButton() {
      return Center(
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
            onPressed: () {
              setState(() {
                isApplied = !isApplied;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xffFD4F56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66),
              ),
            ),
            child: Text(
              'Cancel Apply',
              style: buttonTextStyle,
            ),
          ),
        ),
      );
    }

    Widget successAppliedMessage() {
      return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
          width: 312,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xffECEDF1),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 9),
          child: Text(
            'You have applied this job and the recruiter will contact you',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Color(0xffA2A6B4),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              isApplied ? successAppliedMessage() : Container(),
              SizedBox(
                height: isApplied ? 30 : 80,
              ),
              Center(
                child: Image.network(
                  widget.job.companyLogo,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.job.companyName,
                style: jobDetailTitleTextStyle,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                '${widget.job.companyName} • ${widget.job.location}',
                style: companyTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About the job',
                      style: titleRequirementsTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: widget.job.about
                          .map(
                            (about) => RequirementsText(
                              requirementText: about,
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Qualifications',
                      style: titleRequirementsTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: widget.job.qualifications
                          .map((qualification) => RequirementsText(
                                requirementText: qualification,
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Responsibilities',
                      style: titleRequirementsTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: widget.job.responsibilities
                          .map((responsibility) => RequirementsText(
                                requirementText: responsibility,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 51,
              ),
              isApplied ? cancelApplyButton() : applyButton(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Message Recruiter',
                  style: buttonLightTextStyle,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
