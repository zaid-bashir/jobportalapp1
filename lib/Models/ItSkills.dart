import 'dart:convert';

import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Utility/ApiUrls.dart';
import 'package:http/http.dart' as http;

class ITSkill{
  String itskillId;
  String itskillName;


// changes
  ITSkill({
    this.itskillId,
    this.itskillName,
  });

  factory ITSkill.fromJson(Map<String, dynamic> item) {
    return ITSkill(
      itskillId: item["itskillId"],
      itskillName: item["itskillName"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "itskillId": itskillId,
      "itskillName": itskillName,
    };
  }
}
class Service{
   static Future<List<ITSkill>> getITSkill(String query) async {
    final url = Uri.parse(ApiUrls.kItskill + query);
    print(ApiUrls.kItskill + "=" + query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if(response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((json) => ITSkill.fromJson(json)).where((data) {
        final nameLower = data.itskillName.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    }else{
     throw Exception("ERRORRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR");
    }

  }
}
