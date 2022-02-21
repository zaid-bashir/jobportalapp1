import 'Connect.dart';

class ApiUrls extends Connect{

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
  static String kCaste = baseUrl+"populate/reservedcategory";
  static String kMarital = baseUrl+"populate/marital-status";
  static String kInstitute = baseUrl+"populate/institute?query=";
  static String kItskill =  baseUrl+"populate/itskill?query=";
  // static String kQualify = baseUrl+"candidate-registration/step3-qualificationdetail";
  // static String kItSkill = baseUrl+"candidate-registration/step6-itskill";
  static String kLocation = baseUrl+"populate/city?query=";
  // static String kBasicDetial = baseUrl+"candidate-registration/step2-basicdetail";
 
  // static String kPreference = baseUrl+"candidate-registration/step7-careerpreference";
  // static String kPersonal = baseUrl+"candidate-registration/step8-personaldetail";
  static String kEmpType = baseUrl+"populate/employmenttype";
  static String kJobType = baseUrl+"populate/jobtype";
  // static String kProfession = baseUrl+"candidate-registration/step4-professionaldetail";
  static String kKeySkills = baseUrl+"populate/keyskill?query=";
  // static String kpostSkill =  baseUrl+"candidate-registration/step5-keyskill";
  static String kGetprofileNoticePeriod = Connect.AppURL() + "populate/notice";

  static String kGetJobList =  "http://192.168.0.20:9030/jobportal-app/test/job-list";
  static String kGetItSkill =  "http://192.168.0.20:9030/jobportal-app/api/candidate/itskill-list";

  static String kLogin = Connect.AppURL()+"jwt/login";
  static String kItSkillAdd = "http://192.168.0.20:9030/jobportal-app/api/candidate/itskill-add";
  static String kItSkillUpdate = "http://192.168.0.20:9030/jobportal-app/api/candidate/itskill-add";
  static String kItSkillDelete = "http://192.168.0.20:9030/jobportal-app/api/candidate/itskill-add";
  static String kGetQualificationPop = "http://192.168.0.20:9030/jobportal-app/api/candidate/qualification-list";
  static String kGetPersonalPop = "http://192.168.0.20:9030/jobportal-app/api/candidate/personaldetail-list";
  static String kPersonalUpdate = "http://192.168.0.20:9030/jobportal-app/api/candidate/personaldetail-add";
  static String kItSkillUpdatePop = "http://192.168.0.20:9030/jobportal-app/api/candidate/itskill-populate?request=";
  static String kQualificationUpdate  = "http://192.168.0.20:9030/jobportal-app/api/candidate/qualification-add";
  static String kPopulateLanguage  = "http://192.168.0.20:9030/jobportal-app/api/candidate/language-list";
  static String kPopulatePatent = "http://192.168.0.20:9030/jobportal-app/api/candidate/patent-list";
  static String kDropLanguages = "http://192.168.0.20:9030/jobportal-app/api/populate/language?query=";
  static String kDropProfeciency = "http://192.168.0.20:9030/jobportal-app/api/populate/proficiency?query=";
  static String kpopulatecareerpreferenceprofile =Connect.AppURL() + "candidate/careerpreference-list";
  static String kAddLanguage = "http://192.168.0.20:9030/jobportal-app/api/candidate/language-add";
 
  static String kGetBasicInfoPop="http://192.168.0.20:7028/jobportal-app/api/candidate/basicdetail-list";
  static String kGetProfessionalPop = Connect.AppURL()+"candidate/professional-list";
  static String kkeySkillsProfile = Connect.AppURL()+"candidate/keyskill-list";
  static String kLanguageUpdPop = "http://192.168.0.20:9030/jobportal-app/api/candidate/language-populate?request=";
  static String kPatentAdd = "http://192.168.0.20:9030/jobportal-app/api/candidate/patent-add";
  static String kPatentUpdPOP = "http://192.168.0.20:9030/jobportal-app/api/candidate/patent-populate?request=";
  static String kPopulateAwards = "http://192.168.0.20:9030/jobportal-app/api/candidate/award-list";
  static String kAddAwards = "http://192.168.0.20:9030/jobportal-app/api/candidate/award-add";
  static String kUpdateBasicInfo =Connect.AppURL()+ "candidate/basicdetail-update";
  static String kProjectUpdatePop = Connect.AppURL() + "candidate/project-populate?request=";

  static String kAwardsUpdPOP = "http://192.168.0.20:9030/jobportal-app/api/candidate/award-populate?request=";
  static String kProfessionalAdd = Connect.AppURL()+"candidate/professional-add";
  static String kAddDeleteKeySkills = Connect.AppURL()+"candidate/keyskill-add";
  static String kCareerUpdate= Connect.AppURL()+"candidate/careerpreference-add";
  static String kUpdateprofessionprofile = Connect.AppURL() + "candidate/professional-add";
  static String kProfessionalDelete = Connect.AppURL() + "candidate/professional-add";
  static String kSignOut = Connect.AppURL()+"jwt/logout?token=";
  static String kProjectPopulate=Connect.AppURL()+"candidate/project-list";
  static String kParticularProfessionalUpdate = Connect.AppURL()+"candidate/professional-populate?request=";
  static String kProjectAdd= Connect.AppURL()+"candidate/project-add";

  static String kCertificationAdd= Connect.AppURL()+"candidate/certification-add";
  static String kCertfUpdatePop = Connect.AppURL() + "candidate/certification-populate?request=";
  static String kCertificationPopulate=Connect.AppURL()+"candidate/certification-list";
  static String kPopulateSummary  = Connect.AppURL() + "candidate/profilesummary-list";
  static String kSummaryAdd= Connect.AppURL()+"candidate/profilesummary-update";
  static String kPresentationPopulate= Connect.AppURL()+"candidate/presentation-list";
  static String kPresentationAdd= Connect.AppURL()+"candidate/presentation-add";
  static String kResearchPaperList= Connect.AppURL()+"candidate/paper-list";
  static String kResearchPaperAdd= Connect.AppURL()+"candidate/paper-add";
  static String kResearchPaperUpdPop= "http://192.168.0.20:9030/jobportal-app/api/candidate/paper-populate?request=";

  //testing 
 static String kPreference = "http://192.168.0.20:7038/jobportal-app/api/candidate-registration/step3-careerpreference";
 static String kpostSkill = "http://192.168.0.20:7038/jobportal-app/api/candidate-registration/step6-keyskill";
 static String kItSkill = "http://192.168.0.20:7038/jobportal-app/api/candidate-registration/step7-itskill";
 static String kQualify = "http://192.168.0.20:7038/jobportal-app/api/candidate-registration/step5-qualificationdetail";
 static String kBasicDetial = "http://192.168.0.20:7038/jobportal-app/api/candidate-registration/step2-basicdetail";
 static String kProfession = "http://192.168.0.20:7038/jobportal-app/api/candidate-registration/step4-professionaldetail";
 static String kPersonal = "http://192.168.0.20:7038/jobportal-app/api/candidate-registration/step8-personaldetail";
 
}


