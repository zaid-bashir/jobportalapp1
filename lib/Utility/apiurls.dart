import 'package:job_portal/Utility/Connect.dart';

class ApiUrls extends Connect{
  static String kgetOTP = Connect.AppURL()+"generate-otp";
  static String kverifyOTP =  Connect.AppURL()+"validate-otp";
  static String ktitles = Connect.AppURL()+ "populate/title";
  static String kgender = Connect.AppURL()+"populate/gender";
  static String kPassingYear = Connect.AppURL()+"populate/year";
  static String kGradingSystem = Connect.AppURL()+"populate/grading-system";
  static String kShift = Connect.AppURL()+"populate/shift";
  static String kjobrole = Connect.AppURL()+"populate/jobrole?query=";
  static String kHighestQualification = Connect.AppURL()+"populate/qualification?query=";
  static String kCourse =  Connect.AppURL()+"populate/course?query=";
  static String kStream = Connect.AppURL()+"populate/stream?query=";
  static String kindustry = Connect.AppURL()+"populate/industry?query=";
  static String kcompany = Connect.AppURL()+"populate/organization?query=";
  static String kNationality = Connect.AppURL()+"populate/nationality?query=";
  static String kCity =  Connect.AppURL()+"populate/city?query=";
  static String kCountry = Connect.AppURL()+"populate/country?query=";
  static String kCaste = Connect.AppURL()+"populate/caste";
  static String kMarital = Connect.AppURL()+"populate/marital-status";
  static String kInstitute = Connect.AppURL()+"populate/institute?query=";
  static String kItskill =  Connect.AppURL()+"populate/itskill?query=";
  static String kQualify = Connect.AppURL()+"candidate-registration/step3-qualificationdetail";
  static String kItSkill = Connect.AppURL()+"candidate-registration/step6-itskill";
  static String kLocation = Connect.AppURL()+"populate/city?query=";
  static String kBasicDetial = Connect.AppURL()+"candidate-registration/step2-basicdetail";
  static String kPreference = Connect.AppURL()+"candidate-registration/step7-careerpreference";
  static String kPersonal = Connect.AppURL()+"candidate-registration/step8-personaldetail";
  static String kEmpType = Connect.AppURL()+"populate/employmenttype";
  static String kJobType = Connect.AppURL()+"populate/jobtype";
  static String kProfession = Connect.AppURL()+"candidate-registration/step4-professionaldetail";
  static String kKeySkills = Connect.AppURL()+"populate/keyskill?query=";
  static String kpostSkill =  Connect.AppURL()+"candidate-registration/step5-keyskill";
  static String kGetItSkill =  Connect.AppURL()+"candidate/itskill-list";
  static String kLogin = Connect.AppURL()+"jwt/login";
  static String kItSkillAdd = Connect.AppURL()+"candidate/itskill-add";
  static String kItSkillDelete = Connect.AppURL()+"candidate/itskill-list";
  static String kGetBasicInfoPop=Connect.AppURL()+"candidate/basicdetail-list";
  static String kGetQualificationPop=Connect.AppURL()+"candidate/qualification-list";
  static String kkeySkillsProfile = Connect.AppURL()+"candidate/keyskill-list";
  static String kGetProfessionalPop = Connect.AppURL()+"candidate/professional-list";
  static String kpopulatecareerpreferenceprofile = Connect.AppURL()+"candidate/careerpreference-list";
  static String kGetPersonalPop = Connect.AppURL()+"candidate/personaldetail-list";
  static String kAddDeleteKeySkills = Connect.AppURL()+"candidate/keyskill-add";
  static String kGetprofileNoticePeriod = Connect.AppURL()+"populate/notice";

}
