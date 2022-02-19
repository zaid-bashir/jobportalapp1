// class CareerPreferencePopulate {
//   String industryName;
//   String jobtypeName;
//   String employmenttypeName;
//   String cityName;
//   String candidateExpectedctc;
//   String shiftName;
//   String candidateJoindate;
//
//   CareerPreferencePopulate(
//       {this.industryName,
//         this.jobtypeName,
//         this.employmenttypeName,
//         this.cityName,
//         this.candidateExpectedctc,
//         this.shiftName,
//         this.candidateJoindate});
//
//   factory CareerPreferencePopulate.fromJson(Map<String, dynamic> json) => CareerPreferencePopulate(
//     industryName: json["industryName"],
//     jobtypeName: json["jobtypeName"],
//     employmenttypeName: json["employmenttypeName"],
//     cityName: json["cityName"],
//     candidateExpectedctc: json["candidateExpectedctc"],
//     shiftName: json["shiftName"],
//     candidateJoindate: json["candidateJoindate"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "industryName": industryName,
//     "jobtypeName": jobtypeName,
//     "employmenttypeName": employmenttypeName,
//     "cityName": cityName,
//     "candidateExpectedctc": candidateExpectedctc,
//     "shiftName": shiftName,
//     "candidateJoindate": candidateJoindate,
//
//   };
// }
//


// To parse this JSON data, do
//
//     final careerPreferencePopulate = careerPreferencePopulateFromJson(jsonString);

import 'dart:convert';

CareerPreferencePopulate careerPreferencePopulateFromJson(String str) => CareerPreferencePopulate.fromJson(json.decode(str));

String careerPreferencePopulateToJson(CareerPreferencePopulate data) => json.encode(data.toJson());

class CareerPreferencePopulate {
  CareerPreferencePopulate({
    this.industryName,
    this.jobtypeName,
    this.employmenttypeName,
    this.cityName,
    this.candidateExpectedctc,
    this.shiftName,
    this.candidateJoindate,
  });

  String industryName;
  String jobtypeName;
  String employmenttypeName;
  String cityName;
  String candidateExpectedctc;
  String shiftName;
  DateTime candidateJoindate;

  factory CareerPreferencePopulate.fromJson(Map<String, dynamic> json) => CareerPreferencePopulate(
    industryName: json["industryName"],
    jobtypeName: json["jobtypeName"],
    employmenttypeName: json["employmenttypeName"],
    cityName: json["cityName"],
    candidateExpectedctc: json["candidateExpectedctc"],
    shiftName: json["shiftName"],
    candidateJoindate: DateTime.parse(json["candidateJoindate"]),
  );

  Map<String, dynamic> toJson() => {
    "industryName": industryName,
    "jobtypeName": jobtypeName,
    "employmenttypeName": employmenttypeName,
    "cityName": cityName,
    "candidateExpectedctc": candidateExpectedctc,
    "shiftName": shiftName,
    "candidateJoindate": candidateJoindate.toIso8601String(),
  };
}
