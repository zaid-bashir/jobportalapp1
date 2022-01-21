class ApiUrls{

  static const String baseUrl = "http://192.168.0.20:9030/jobportal-app/api/";
  static String kgetOTP = baseUrl+"generate-otp";
  static String kverifyOTP =  baseUrl+"validate-otp";
  static String ktitles = baseUrl+ "populate/title";
  static String kgender = baseUrl+"populate/gender";
  static String kPassingYear = baseUrl+"populate/year";
  static String kGradingSystem = baseUrl+"populate/grading-system";
  static String kShift = baseUrl+"populate/shift";
  static String kjobrole = baseUrl+"populate/jobrole?query=";
  static String kHighestQualification = baseUrl+"populate/qualification?query=";
  static String kCourse =  baseUrl+"populate/course?query=";
  static String kStream = baseUrl+"populate/stream?query=";
  static String kindustry = baseUrl+"populate/industry?query=";
  static String kcompany = baseUrl+"populate/organization?query=";
  static String kNationality = baseUrl+"populate/nationality?query=";
  static String kCity =  baseUrl+"populate/city?query=";
  static String kCountry = baseUrl+"populate/country?query=";
  static String kCaste = baseUrl+"populate/caste";
  static String kMarital = baseUrl+"populate/marital-status";
  static String kInstitute = baseUrl+"populate/institute?query=";
  static String kItskill =  baseUrl+"populate/itskill?query=";
  static String kQualify = baseUrl+"candidate-registration/step3-qualificationdetail";
  static String kItSkill = baseUrl+"candidate-registration/step6-itskill";
  static String kLocation = baseUrl+"populate/city?query=";
  static String kBasicDetial = baseUrl+"candidate-registration/step2-basicdetail";
  static String kPreference = baseUrl+"candidate-registration/step7-careerpreference";
  static String kPersonal = baseUrl+"candidate-registration/step8-personaldetail";
  static String kEmpType = baseUrl+"populate/employmenttype";
  static String kJobType = baseUrl+"populate/jobtype";
  static String kProfession = baseUrl+"candidate-registration/step4-professionaldetail";
  static String kKeySkills = baseUrl+"populate/keyskill?query=";
  static String kpostSkill =  baseUrl+"candidate-registration/step5-keyskill";
  static String kGetJobList =  "http://192.168.0.20:9030/jobportal-app/test/job-list";
  static String kGetItSkill =  "http://192.168.0.20:7038/jobportal-app/profile/it-skill";
  static String kBasicDetails =  "http://192.168.0.20:9030/jobportal-app/candidate/candidate-overview";
  static String kLogin = "http://192.168.0.20:9030/jobportal-app/candidate/candidate-overview";
  static String kKeySkillAddProfile = "http://192.168.0.20:9030/jobportal-app/profile/keyskill";
  static String kgetKeySkillsProfile = "http://192.168.0.20:9030/jobportal-app/profile/keyskill-list";

}
