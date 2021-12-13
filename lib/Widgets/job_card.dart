
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/models/category_model.dart';

import '../second_homepage.dart';

class JobCard extends StatelessWidget {
  final CategoryModel category;

  const JobCard({Key key, this.category}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondHomePage(category),
          ),
        );
      },
      child: Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.only(right: 24),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              bottom: 16,
              right: 16,
            ),
            child: Text(
              category.name,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.imageUrl),
          ),
        ),
      ),
    );
  }
}
