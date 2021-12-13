// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:job_portal/models/job_model.dart';

import '../detail_page.dart';
import '../theme.dart';

class PostCard extends StatelessWidget {
  final JobModel job;

  PostCard(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(job),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyLogo,
            width: 45,
            height: 45,
          ),
          SizedBox(
            width: 27,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name,
                  style: jobTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  job.companyName,
                  style: companyTextStyle,
                ),
                SizedBox(
                  height: 18,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
