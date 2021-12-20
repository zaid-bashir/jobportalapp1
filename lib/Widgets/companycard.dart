import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
class CompanyCard extends StatelessWidget {

  final Company company;
  const CompanyCard({this.company});

  @override
  
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      margin: EdgeInsets.only(right: 18.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                 // image: AssetImage(),
                 // fit: BoxFit.cover
                ),
              ),

               Spacer(),
              Text('salary',style: TextStyle(color: Colors.white),),
            ],
          ),
          SizedBox(height: 15.0),
          Text('Job title',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 15.0,
          ),
          Text(
            //"${company.companyname}"
            'Company name .city',style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
  GFButton(

    onPressed: (){},
    text: "Remote",
    shape: GFButtonShape.pills,
    type: GFButtonType.outline,
    color: Colors.white,
  ),
       GFButton(

         onPressed: (){},
         text: "FullTime",
         shape: GFButtonShape.pills,
         type: GFButtonType.outline,
         color: Colors.white,
       ),
       GFButton(

         onPressed: (){},
         text: "Anywhere",
         shape: GFButtonShape.pills,
         type: GFButtonType.outline,
         color: Colors.white,
       ),
],

          ),
          )

        ],
      ),

    );
  }
}

class Company {
}
