// ignore_for_file: avoid_print, unnecessary_string_interpolations, unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_portal/Models/Country.dart';
import 'package:job_portal/Models/CurerntLocation.dart';
import 'package:job_portal/Models/EmploymentType.dart';
import 'package:job_portal/Models/GetCategory.dart';
import 'package:job_portal/Models/GetCompany.dart';
import 'package:job_portal/Models/GetIndustry.dart';
import 'package:job_portal/Models/GetMarital.dart';
import 'package:job_portal/Models/InstituteQualified.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/JobType.dart';
import 'package:job_portal/Models/Nationality.dart';
import 'package:job_portal/Models/PersonalDetails-post.dart';
import 'package:job_portal/Models/ProfessionDetails.dart';
import 'package:job_portal/Models/QualificationDetails.dart';
import 'package:job_portal/Models/Stream.dart';
import 'package:job_portal/Models/basicdetailresponse.dart';
import 'package:job_portal/Models/basicdetials.dart';
import 'package:job_portal/Models/getjobcategory.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/getgender.dart';
import 'package:job_portal/Models/GetOtp.dart';
import 'package:job_portal/Models/GetShift.dart';
import 'package:job_portal/Models/GetTitle.dart';
import 'package:job_portal/Models/GradingSystem.dart';
import 'package:job_portal/Models/PassingYear.dart';
import 'package:job_portal/Models/VerifyOtp.dart';
import 'package:job_portal/Models/location.dart';
import 'package:job_portal/Models/qualification-post.dart';
import 'package:job_portal/Utility/apiurls.dart';
import 'package:logger/logger.dart';

class ApiServices {
  var log = Logger();
  Future<ApiResponse<int>> getOTP(GetOTP objGetOtp) async {
    final url = Uri.parse(ApiUrls.kgetOTP);
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode({"registerMobile": objGetOtp.registerMobile});
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final int data = jsonData;
      print(data);
      return ApiResponse<int>(data: data);
    }
    return ApiResponse<int>(
        error: true,
        errorMessage: "Failed to Receive the OTP, Please try Again");
  }

  Future<ApiResponse<String>> otpVerify(OTPVerify objOtpVerify) async {
    final url = Uri.parse(ApiUrls.kverifyOTP+"/"+"${objOtpVerify.otp}");
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode(OTPVerify.fromJson({
      "registerMobile": "${objOtpVerify.registerMobile}",
      "otp": objOtpVerify.otp
    }));
    final response = await http.post(url, headers: headers, body: jsonData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final String data = jsonData;
      return ApiResponse<String>(data: data);
    }
    return ApiResponse<String>(error: true, errorMessage: "An Error Occurred");
  }



  // industry in Professional details page

  Future<ApiResponse<List<Industry>>> getIndustry({String query}) async {
    final url = Uri.parse(ApiUrls.kindustry+query);
    print(ApiUrls.kindustry+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Industry>[];
      for (var item in jsonData) {
        list.add(Industry.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Industry>>(data: list);
    }
    return ApiResponse<List<Industry>>(
        error: true, errorMessage: "An error occurred");
  }


  // company in Professional details page

  Future<ApiResponse<List<Company>>> getCompany({String query}) async {
    final url = Uri.parse(ApiUrls.kcompany+query);
    print(ApiUrls.kcompany+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Company>[];
      for (var item in jsonData) {
        list.add(Company.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Company>>(data: list);
    }
    return ApiResponse<List<Company>>(
        error: true, errorMessage: "An error occurred");

  }

   //  Nationality Dropdown

  Future<ApiResponse<List<Nationality>>> getNationality({String query}) async {
    final url = Uri.parse(ApiUrls.kNationality + query);
    print(ApiUrls.kNationality + "=" + query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Nationality>[];
      for (var item in jsonData) {
        list.add(Nationality.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Nationality>>(data: list);
    }
    return ApiResponse<List<Nationality>>(
        error: true, errorMessage: "An error occurred");
  }

  //CURRENT LOCATION STARTS HERE
  Future<ApiResponse<List<CurrentLocation>>> getCurrentLocation({String query}) async {
    final url = Uri.parse(ApiUrls.kLocation+query);
    print(ApiUrls.kLocation+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <CurrentLocation>[];
      for (var item in jsonData) {
        list.add(CurrentLocation.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<CurrentLocation>>(data: list);
    }
    return ApiResponse<List<CurrentLocation>>(
        error: true, errorMessage: "An error occurred");
  }

  Future<ApiResponse<List<GetTitle>>> getTitle() async {
    final url = Uri.parse(ApiUrls.ktitles);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <GetTitle>[];
      for (var item in jsonData) {
        list.add(GetTitle.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<GetTitle>>(data: list);
    }
    return ApiResponse<List<GetTitle>>(
        error: true, errorMessage: "An error occurred");
  }

  Future<ApiResponse<List<GetGender>>> getGender () async {
    final url = Uri.parse(ApiUrls.kgender);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <GetGender>[];
      for (var item in jsonData) {
        list.add(GetGender.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<GetGender>>(data: list);
    }
    return ApiResponse<List<GetGender>>(
        error: true, errorMessage: "An error occurred");
  }


  // PASSING YEAR DROPDOWN IN Qualification PAGE
  Future<ApiResponse<List<PassingYear>>> getPassingYear() async {
    final url = Uri.parse(ApiUrls.kPassingYear);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <PassingYear>[];
      for (var item in jsonData) {
        list.add(PassingYear.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<PassingYear>>(data: list);
    }
    return ApiResponse<List<PassingYear>>(
        error: true, errorMessage: "An error occurred");
  }
  // GRADING DROPDOWN IN Qualification PAGE
  Future<ApiResponse<List<GradingSystem>>> getGradingSystem() async {
    final url = Uri.parse(ApiUrls.kGradingSystem);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <GradingSystem>[];
      for (var item in jsonData) {
        list.add(GradingSystem.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<GradingSystem>>(data: list);
    }
    return ApiResponse<List<GradingSystem>>(
        error: true, errorMessage: "An error occurred");
  }


  // PREFERRED SHIFT IN CAREER PREFERENCES//
  Future<ApiResponse<List<PreferredShift>>> getShift() async {
    final url = Uri.parse(ApiUrls.kShift);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <PreferredShift>[];
      for (var item in jsonData) {
        list.add(PreferredShift.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<PreferredShift>>(data: list);
    }
    return ApiResponse<List<PreferredShift>>(
        error: true, errorMessage: "An error occurred");
  }

  //Get Job Category

  Future<ApiResponse<List<JobCategory>>> getJobCategory({String query}) async {
    final url = Uri.parse(ApiUrls.kjobrole+query);
    print(ApiUrls.kjobrole+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <JobCategory>[];
      for (var item in jsonData) {
        list.add(JobCategory.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<JobCategory>>(data: list);
    }
    return ApiResponse<List<JobCategory>>(
        error: true, errorMessage: "An error occurred");
  }

  //Get Highest Qualification

  Future<ApiResponse<List<Qualification>>> getQualification({String query}) async {
    final url = Uri.parse(ApiUrls.kHighestQualification+query);
    print(ApiUrls.kHighestQualification+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Qualification>[];
      for (var item in jsonData) {
        list.add(Qualification.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Qualification>>(data: list);
    }
    return ApiResponse<List<Qualification>>(
        error: true, errorMessage: "An error occurred");
  }

  //Get Course

  Future<ApiResponse<List<Qualification>>> getCourse({String query}) async {
    final url = Uri.parse(ApiUrls.kCourse+query);
    print(ApiUrls.kCourse+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Qualification>[];
      for (var item in jsonData) {
        list.add(Qualification.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Qualification>>(data: list);
    }
    return ApiResponse<List<Qualification>>(
        error: true, errorMessage: "An error occurred");
  }

  //Get Course

  Future<ApiResponse<List<Streams>>> getStream({String query}) async {
    final url = Uri.parse(ApiUrls.kStream+query);
    print(ApiUrls.kStream+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Streams>[];
      for (var item in jsonData) {
        list.add(Streams.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Streams>>(data: list);
    }
    return ApiResponse<List<Streams>>(
        error: true, errorMessage: "An error occurred");
  }

  // JOB TYPE
  Future<ApiResponse<List<JobType>>> getjobType() async {
    final url = Uri.parse(ApiUrls.kJobType);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <JobType>[];
      for (var item in jsonData) {
        list.add(JobType.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<JobType>>(data: list);
    }
    return ApiResponse<List<JobType>>(
        error: true, errorMessage: "An error occurred");
  }



  // EMPLOYMENT
  Future<ApiResponse<List<EmploymentType>>> getEmploymentType() async {
    final url = Uri.parse(ApiUrls.kEmpType);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <EmploymentType>[];
      for (var item in jsonData) {
        list.add(EmploymentType.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<EmploymentType>>(data: list);
    }
    return ApiResponse<List<EmploymentType>>(
        error: true, errorMessage: "An error occurred");
  }

  //  Nationality Dropdown
  Future<ApiResponse<BasicDetailResponse>> postBasicDetials(
      BasicDetialModel obj) async {
    final url = Uri.parse(ApiUrls.kBasicDetial);
    final header = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode({
      "candidateTitleId": obj.candidateTitleId,
      "candidateMobile1" : obj.candidateMobile1,
      "candidateFirstName": obj.candidateFirstName,
      "candidateMiddleName": obj.candidateMiddleName,
      "candidateLastName" : obj.candidateLastName,
      "candidateEmail1" : obj.candidateEmail1,
      "candidateGenderId" : obj.candidateGenderId,
      "candidateTotalworkexp" : obj.candidateTotalworkexp,
      "candidateName" : obj.candidateName,
      "candidateJobroleId" : obj.candidateJobroleId,
      "candidateCityId" : obj.candidateCityId,
    });
    final response = await http.post(
      url,
      headers: header,
      body: jsonData,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      final BasicDetailResponse basicDetailResponse = BasicDetailResponse.fromJson(jsonDecode(response.body));
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<BasicDetailResponse>(data: basicDetailResponse);
    }
    return ApiResponse<BasicDetailResponse>(
        error: true, errorMessage: "Something went wrong, please try again...");
  }


  //  City Dropdown

  Future<ApiResponse<List<Cities>>> getCity({String query}) async {
    final url = Uri.parse(ApiUrls.kCity+query);
    print(ApiUrls.kCity+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Cities>[];
      for (var item in jsonData) {
        list.add(Cities.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Cities>>(data: list);
    }
    return ApiResponse<List<Cities>>(
        error: true, errorMessage: "An error occurred");

  }


  //  Country

  Future<ApiResponse<List<Country>>> getCountry({String query}) async {
    final url = Uri.parse(ApiUrls.kCountry+query);
    print(ApiUrls.kCountry+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Country>[];
      for (var item in jsonData) {
        list.add(Country.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Country>>(data: list);
    }
    return ApiResponse<List<Country>>(
        error: true, errorMessage: "An error occurred");

  }


  // CASTE
  Future<ApiResponse<List<Category>>> getCaste() async {
    final url = Uri.parse(ApiUrls.kCaste);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Category>[];
      for (var item in jsonData) {
        list.add(Category.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<Category>>(data: list);
    }
    return ApiResponse<List<Category>>(
        error: true, errorMessage: "An error occurred");
  }

  // MARITAL

  Future<ApiResponse<List<Marital>>> getMarital() async {
    final url = Uri.parse(ApiUrls.kMarital);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Marital>[];
      for (var item in jsonData) {
        list.add(Marital.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      print(list);
      return ApiResponse<List<Marital>>(data: list);
    }
    return ApiResponse<List<Marital>>(
        error: true, errorMessage: "An error occurred");
  }


  // institute qualified from
  Future<ApiResponse<List<Institute>>> getInstitute({String query}) async {
    final url = Uri.parse(ApiUrls.kInstitute+query);
    print(ApiUrls.kInstitute+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <Institute>[];
      for (var item in jsonData) {
        list.add(Institute.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<Institute>>(data: list);
    }
    return ApiResponse<List<Institute>>(
        error: true, errorMessage: "An error occurred");
  }
  // POST QUALIFICATION
  Future<ApiResponse<bool>> PostQualification(QualificationPost qualifi) async {
    final url = Uri.parse(ApiUrls.kQualify);
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode(qualifi);

    final response = await http.post(url, headers: headers, body: jsonData);
    log.i(response.body);
    log.i(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 200) {
      return ApiResponse<bool>(data: true);
    }
    return ApiResponse<bool>(error: true, errorMessage: "An Error Occurred");
  }

  // POST QUALIFICATION ENDS HERE
  // PROFESSIONPAGE STARTS HERE
  Future<ApiResponse<bool>> ProfessionPost(PostProfession profes) async {
    final url = Uri.parse(ApiUrls.kProfession);
    final headers = {
      "Content-Type": "application/json",
    };
    final jsonData = jsonEncode(profes);

    final response = await http.post(url, headers: headers, body: jsonData);
    log.i(response.body);
    log.i(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 200) {
      return ApiResponse<bool>(data: true);
    }
    return ApiResponse<bool>(error: true, errorMessage: "An Error Occurred");
  }

  // PROFESSIONPAGE ends  HERE

  // IT skills
  Future<ApiResponse<List<ITSkill>>> getITSkill({String query}) async {
    final url = Uri.parse(ApiUrls.kItskill+query);
    print(ApiUrls.kItskill+"="+query);
    final header = {
      "Content-Type": "application/json",
    };
    final response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <ITSkill>[];
      for (var item in jsonData) {
        list.add(ITSkill.fromJson(item));
      }
      log.i(response.body);
      log.i(response.statusCode);
      return ApiResponse<List<ITSkill>>(data: list);
    }
    return ApiResponse<List<ITSkill>>(
        error: true, errorMessage: "An error occurred");
  }

// personal details post
  Future<ApiResponse<bool>> PostPersonal(PersonalDetailsPost personal) async {
    final url = Uri.parse(ApiUrls.kPersonal);
    final headers = {
      "Content-Type": "application/json",

    };
    final jsonData = jsonEncode(personal);

    final response = await http.post(url, headers: headers, body: jsonData);
    log.i(response.body);
    log.i(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 200) {
      return ApiResponse<bool>(data: true);
    }
    return ApiResponse<bool>(error: true, errorMessage: "An Error Occurred");
  }

}
