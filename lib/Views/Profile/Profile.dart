import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/Controllers/menucontroller.dart';
import 'package:job_portal/Data_Controller/apiresponse.dart';
import 'package:job_portal/Models/Awards.dart';
import 'package:job_portal/Models/BasicInfoPopulate.dart';
import 'package:job_portal/Models/CareerPreferencePopulate.dart';

import 'package:job_portal/Models/CertificationPopulate.dart';
import 'package:job_portal/Models/ItSkillAdd.dart';
import 'package:job_portal/Models/ItSkillRetrive.dart';
import 'package:job_portal/Models/ItSkills.dart';
import 'package:job_portal/Models/Language-Populate.dart';
import 'package:job_portal/Models/LanguagesAdd.dart';
import 'package:job_portal/Models/Patent-Populate.dart';
import 'package:job_portal/Models/PatentAdd.dart';
import 'package:job_portal/Models/KeySkillDeleteProfile.dart';
import 'package:job_portal/Models/KeySkillProfilePopulate.dart';
import 'package:job_portal/Models/PersonalDetailsRetrive.dart';
import 'package:job_portal/Models/PresentaionAdd.dart';
import 'package:job_portal/Models/Presentation-Populate.dart';
import 'package:job_portal/Models/ProfileSummaryPopulate.dart';
import 'package:job_portal/Models/QualificationPopulate.dart';
import 'package:job_portal/Models/Researchpaper.dart';
import 'package:job_portal/Models/qualification-post.dart';
import 'package:job_portal/Services/ApiServices.dart';
import 'package:job_portal/Theme/colors.dart';
import 'package:job_portal/Models/ProfessionDetailsPost.dart';
import 'package:job_portal/Models/ProfessionalPopulate.dart';
import 'package:job_portal/Models/ProjectPopulate.dart';
import 'package:job_portal/Theme/images.dart';
import 'package:job_portal/Views/Candidate/Sidebar.dart';
import 'package:job_portal/Views/Profile/PresentationAdd.dart';
import 'package:job_portal/Views/Profile/ProfileSummary.dart';
import 'package:job_portal/Views/Profile/UpdateBasic%20Detail.dart';
import 'package:job_portal/Views/Profile/UpdateCareerPreference.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import '../Candidate/Inbox.dart';
import 'AddAwards.dart';
import 'AddCertificates.dart';
import 'AddItskill.dart';
import 'AddKeySkill.dart';
import 'AddLanguages.dart';
import 'AddPatent.dart';
import 'AddProjects.dart';
import 'PersonalUpdate.dart';
import 'Professional-Add.dart';
import 'QualificationAdd.dart';
import 'ResearchPaperAdd.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.basic}) : super(key: key);
  String basic;
  String keyjwt;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final itemKey = GlobalKey();
  final skillKey = GlobalKey();

  // bool  get key  => widget.ite47mKey != null;
  Future scrollToItem() async {
    final context = itemKey.currentContext;
    await Scrollable.ensureVisible(context);
  }

  Future scrollToItems() async {
    final context = skillKey.currentContext;
    await Scrollable.ensureVisible(context);
  }

  int groupValue = 0;
  final bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  AnimationController loadingController;

  File _file;
  PlatformFile _platformFile;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(allowMultiple: true);
    // type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']
    if (file != null) {
      setState(() {
        _file = File(file.files.single.path);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }

  // profile img
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  File _image;

  _imgFromCamera() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this._image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  _imgFromGallery() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this._image = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  @override
  void initState() {
    getCertification();
    getItSkill();
    getPersonal();
    populateKeySkills();
    getProfessional();
    populateCareerPreferenceProfile();
    getQualification();
    getLanguage();
    getProject();
    getPatent();
    getAwards();
    getSummary();
    getPresentation();
    getResearch();
    getbasicss();

    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  bool isLoading;
  bool isLoadingPopulateKeySkillsProfile = false;
  bool isLoadingPopulateCareerPreferenceProfile = false;
  ApiResponse<List<ItSkillProfile>> _apiResponse;
  ApiResponse<BasicInfoPopulate> _apiResponseBasics;
  ApiResponse<List<QualificationPopulate>> _apiResponse2;
  ApiResponse<List<PersonalRetrive>> _apiResponse3;
  ApiResponse<List<LanguagePopulate>> _apiResponseLang;
  ApiResponse<List<PatentPopulate>> _apiResponsePatent;
  ApiResponse<List<Awards>> _apiResponseAwards;
  ApiResponse<List<PopulateKeySkillsProfileModel>> _apiResponseKeySkillPopulate;
  ApiResponse<List<ProjectPopulate>> apiResponseProjectPopulate;
  ApiResponse<List<CertificationPopulate>> apiResponseCertificationPopulate;
  ApiResponse<CareerPreferencePopulate> apiResponseCareerPreferencePopulate;
  ApiResponse<List<SummaryPopulate>> apiResponseSummary;
  ApiResponse<List<PresentationPopulate>> apiResponsePresentationPopulate;
  ApiResponse<List<ProfessionalPopulate>> _apiResponse5;
  ApiResponse<List<ResearchpaperAdd>> apiResponseResearchPopulate;

  ApiServices apiServices = ApiServices();

  QualificationPopulate qualify;
  String errorMessage;

  getResearch() async {
    setState(() {
      isLoading = true;
    });
    apiResponseResearchPopulate = await apiServices.researchPopulate();
    setState(() {
      isLoading = false;
    });
  }

  getPresentation() async {
    setState(() {
      isLoading = true;
    });
    apiResponsePresentationPopulate = await apiServices.PopulatePresentation();
    setState(() {
      isLoading = false;
    });
  }

  getSummary() async {
    setState(() {
      isLoading = true;
    });
    apiResponseSummary = await apiServices.PopulateSummary();
    setState(() {
      isLoading = false;
    });
  }

  getbasicss() async {
    setState(() {
      isLoading = true;
    });
    _apiResponseBasics = await apiServices.PopulateBasicInfo();
    setState(() {
      isLoading = false;
    });
  }

  populateCareerPreferenceProfile() async {
    setState(() {
      isLoading = true;
    });
    apiResponseCareerPreferencePopulate =
        await apiServices.getCareerPreferencePopulate();
    setState(() {
      isLoading = false;
    });
  }

  getCertification() async {
    setState(() {
      isLoading = true;
    });
    apiResponseCertificationPopulate =
        await apiServices.PopulateCertification();
    setState(() {
      isLoading = false;
    });
  }

  getProject() async {
    setState(() {
      isLoading = true;
    });
    apiResponseProjectPopulate = await apiServices.PopulateProject();
    setState(() {
      isLoading = false;
    });
  }

  populateKeySkills() async {
    setState(() {
      isLoadingPopulateKeySkillsProfile = true;
    });
    _apiResponseKeySkillPopulate = await apiServices.getKeySkillsProfile();
    setState(() {
      isLoadingPopulateKeySkillsProfile = false;
    });
  }

  getAwards() async {
    setState(() {
      isLoading = true;
    });
    _apiResponseAwards = await apiServices.populateAwards();
    setState(() {
      isLoading = false;
    });
  }

  getPatent() async {
    setState(() {
      isLoading = true;
    });
    _apiResponsePatent = await apiServices.PopulatePatent();
    setState(() {
      isLoading = false;
    });
  }

  getLanguage() async {
    setState(() {
      isLoading = true;
    });
    _apiResponseLang = await apiServices.PopulateLanguage();
    setState(() {
      isLoading = false;
    });
  }

  getPersonal() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse3 = await apiServices.PopulatePersonal();
    setState(() {
      isLoading = false;
    });
  }

  getQualification() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse2 = await apiServices.PopulateQualification();
    setState(() {
      isLoading = false;
    });
  }

  getItSkill() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await apiServices.PopulateItSkill();
    setState(() {
      isLoading = false;
    });
  }

  getProfessional() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse5 = await apiServices.ProfessionalDetailsPopulate();
    setState(() {
      isLoading = false;
    });
  }

  TextEditingController skillSearchCont = TextEditingController();
  String queries;
  ApiResponse<List<ITSkill>> _apiResponseITSkill;
  String itSkillId = "";

  fetchITSkill({String query}) async {
    setState(() {
      isLoading = true;
    });
    _apiResponseITSkill = await apiServices.getITSkill(query: query);
    setState(() {
      isLoading = false;
    });
  }

  List<Widget> GetSummary() {
    List<Widget> childs = apiResponseSummary.data
        .map((e) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "PROFILE SUMMARY",
                        style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 16.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SummaryAdd()))
                              .then((value) => getSummary());
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: Color(0xff3e61ed),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'My Summmary:',
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SummaryAdd(
                                                              textfield: e
                                                                  .candidateProfilesummary,
                                                            )))
                                                .then((value) => getSummary());
                                          },
                                          child: Icon(Icons.edit,
                                              color: Color(0xff3e61ed)))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(e.candidateProfilesummary ?? "",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black45,
                                          fontFamily: "ProximaNova",
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
        .toList();
    return childs;
  }

  List<Widget> getPersonalList() {
    List<Widget> childs = _apiResponse3.data
        .map(
          (e) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PERSONAL DETAILS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalUpdate(
                                      Address: e.candidateAddress,
                                      City: e.cityName,
                                      PinCode: e.candidatePin,
                                      DOB: e.candidateDob,
                                      Marry: e.maritalstatusName,
                                      Nationality: e.countryName,
                                      Pan: e.candidatePancard,
                                      Pass: e.candidatePassportno,
                                      Ex: e.candidateExservicemen,
                                    ))).then((value) => getPersonal());
                      },
                      child: const Icon(Icons.edit, color: Color(0xff3e61ed)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 20),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(e.candidateAddress ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'City:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(e.cityName ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pincode:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(e.candidatePin ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'D.O.B:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(e.candidateDob ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Marital Status:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(e.maritalstatusName ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Category:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text('OM',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ex-Servicemen Experience:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                        e.candidateExservicemenExp ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PAN Number:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(e.candidatePancard ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nationality:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text('Indian',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 25, bottom: 25),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Passport Number:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(e.candidatePassportno ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country:',
                                    style: TextStyle(
                                      fontFamily: "ProximaNova",
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(e.countryName ?? "",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: context.read<MenuController>().scaffoldKeys,
        drawer: const SideMenu(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: context.read<MenuController>().controlMenu2,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Images.user1),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            color: KColors.lightGrey,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "What are you looking for?",
                          style:
                              TextStyle(fontSize: 15, color: KColors.subtitle),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.chat,
                        color: Color(0xff3e61ed),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InboxList()));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: ExactAssetImage('assets/as.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 70.0, right: 80.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 15.0,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )),
                ]),
              ),
              const Text(
                "Tahseen Abbass",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Senior Software Developer, ClustTech",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 14.5,
                ),
              ),
              GFButton(
                  color: const Color(0xff3e61ed),
                  onPressed: () {
                    selectFile();
                    // Navigator.push(context, MaterialPageRoute(builder: (
                    //     context) => SkillsAndEducation()));
                  },
                  child: const Text(
                    "My Resume",
                    style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 1.5,
                      fontSize: 13.5,
                    ),
                  )),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 10,
                endIndent: 10,
              ),
              Column(
                children: GetSummary(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "BASIC INFORMATION",
                      style: TextStyle(
                        fontFamily: "ProximaNova-Regular",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateBasicDetails(
                                      // fName: e.candidateFirstName,
                                      // mName: e.candidateMiddleName,
                                      // lName: e.candidateLastName,
                                      // phone: e.candidateMobile1,
                                      // email: e.candidateEmail1,
                                      // gender: e.candidateGenderId,
                                      )));
                        },
                        child: Icon(Icons.edit, color: Color(0xff3e61ed)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 25),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name:',
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                          _apiResponseBasics
                                                  .data.candidateName ??
                                              "clustech",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Contact No:',
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                          _apiResponseBasics
                                                  .data.candidateMobile1 ??
                                              "1234",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 25),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email:',
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                          _apiResponseBasics
                                                  .data.candidateEmail1 ??
                                              "1234",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gender:',
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                          _apiResponseBasics
                                                  .data.candidateGenderName ??
                                              "1234",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 25),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Experience Tenure:',
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                          _apiResponseBasics
                                                  .data.candidateTotalWorkExp ??
                                              "1234",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Preferred Job Role:',
                                      style: TextStyle(
                                        fontFamily: "ProximaNova",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.5,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                          _apiResponseBasics
                                              .data.preferedJobRoleNames,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: "ProximaNova",
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "QUALIFICATION DETAILS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QualificationAdd()))
                            .then((value) => getQualification());
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: Color(0xff3e61ed),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 10),
                    child: Column(
                      children: [
                        qualificationList(context),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PROFESSIONAL DETAILS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => ProfessionAdd(),
                              ),
                            )
                            .then((value) => getProfessional());
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: Color(0xff3e61ed),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 10),
                    child: Column(
                      children: [
                        professionallist(context),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                key: skillKey,
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      " KEY SKILLS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => AddSkillsPage(),
                              ),
                            )
                            .then((value) => populateKeySkills());
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: Color(0xff3e61ed),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    child: Wrap(
                      children: _apiResponseKeySkillPopulate.data.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 8.0, left: 20, bottom: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                              border: Border.all(color: Colors.black45),
                            ),
                            child: Wrap(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 11, left: 5, bottom: 5),
                                child: Text(
                                  e.keyskillName,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    apiServices.keySkillDeleteProfile(
                                        obj: KeySkillDeleteProfile(
                                            requestType: "delete",
                                            candidatekeyskillUuid:
                                                e.candidatekeyskillUuid));
                                    setState(() {
                                      populateKeySkills();
                                      isLoading = true;
                                    });
                                  }),
                            ]),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "IT SKILLS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItSkillAdds()))
                            .then((value) => getItSkill());
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: Color(0xff3e61ed),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          child: ItSkillGrid(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "CAREER PREFERENCES",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdateCareerPreference()));
                      },
                      child: const Icon(Icons.edit, color: Color(0xff3e61ed)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 25),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Preferred Industries:',
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                                apiResponseCareerPreferencePopulate
                                                    .data.industryName,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "ProximaNova",
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Preferred Job Type:',
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                                apiResponseCareerPreferencePopulate
                                                    .data.jobtypeName,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "ProximaNova",
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 25),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Preferred Employment Type:',
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                                apiResponseCareerPreferencePopulate
                                                    .data.employmenttypeName,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "ProximaNova",
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Preferred Job Location:',
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                                apiResponseCareerPreferencePopulate
                                                    .data.cityName,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "ProximaNova",
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 25),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Salary Expectation:',
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                                apiResponseCareerPreferencePopulate
                                                        .data
                                                        .candidateExpectedctc ??
                                                    "12000",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "ProximaNova",
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Preferred Shift:',
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                                apiResponseCareerPreferencePopulate
                                                            .data.shiftName ==
                                                        ""
                                                    ? "flexible"
                                                    : apiResponseCareerPreferencePopulate
                                                        .data.shiftName,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily: "ProximaNova",
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 25),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Availability To Join:',
                                            style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.5,
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(top: 5.0),
                                          //   child: Text(
                                          //       apiResponseCareerPreferencePopulate.data.candidateJoindate.toString().split(" ")[0] ??
                                          //           "yes",
                                          //       style: TextStyle(
                                          //           fontSize: 14.0,
                                          //           fontFamily: "ProximaNova",
                                          //           fontWeight:
                                          //               FontWeight.bold)),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Column(
                children: getPersonalList(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Awards",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => AddAwards()))
                    //           .then((value) => getAwards());
                    //     },
                    //     child: const Icon(
                    //       Icons.edit,
                    //       color: Color(0xff3e61ed),
                    //     ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: awardsList(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PROJECTS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: (context) => QualificationAdd()))
                    //     //     .then((value) => getQualification());
                    //   },
                    //   child:
                    //       const Icon(Icons.edit, color: Color(0xff3e61ed)),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 10),
                    child: Column(
                      children: [
                        projectList(context),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "CERTIFICATION",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 10),
                    child: Column(
                      children: [
                        CertificationGrid(context),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PRESENTATIONS",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Presentation()))
                            .then((value) => getPresentation());
                      },
                      child: const Icon(Icons.edit, color: Color(0xff3e61ed)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 10),
                    child: Column(
                      children: [
                        presentationList(context),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Patents",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPatents()));
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Color(0xff3e61ed),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: patentGrid(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "RESEARCH PUBLICATIiiON",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Research()))
                            .then((value) => getResearch());
                      },
                      child: const Icon(Icons.edit, color: Color(0xff3e61ed)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 10),
                    child: Column(
                      children: [
                        researchList(context),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Languages",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => LanguagesAdd()))
                    //           .then((value) => getLanguage());
                    //     },
                    //     child: const Icon(
                    //       Icons.edit,
                    //       color: Color(0xff3e61ed),
                    //     ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: LanguageGrid(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "UPLOAD RESUME",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child:
                            const Icon(Icons.edit, color: Color(0xff3e61ed))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: selectFile,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                color: Colors.blue.shade400,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.blue.shade50.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Iconsax.folder_open,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Select your file',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade400),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        _platformFile != null
                            ? Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selected File',
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade200,
                                                offset: const Offset(0, 1),
                                                blurRadius: 3,
                                                spreadRadius: 2,
                                              )
                                            ]),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.file(
                                                  _file,
                                                  width: 70,
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _platformFile.name,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${(_platformFile.size / 1024).ceil()} KB',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors
                                                            .grey.shade500),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                      height: 5,
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color:
                                                            Colors.blue.shade50,
                                                      ),
                                                      child:
                                                          LinearProgressIndicator(
                                                        value: loadingController
                                                            .value,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // MaterialButton(
                                    //   minWidth: double.infinity,
                                    //   height: 45,
                                    //   onPressed: () {},
                                    //   color: Colors.black,
                                    //   child: Text('Upload', style: TextStyle(color: Colors.white),),
                                    // )
                                  ],
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ADD SECTION",
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 16.5,
                      ),
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //
                    //     },
                    //     child: Icon(Icons.edit,color:Color(0xff3e61ed))
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddAwards()))
                                .then((value) => getAwards());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.control_point_outlined,
                                  color: Color(0xff3e61ed)),
                              SizedBox(width: 10),
                              Text(
                                'Awards',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "ProximaNova",
                                  color: Color(0xff3e61ed),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Projects()))
                                      .then((value) => getProject());
                                },
                                child: Icon(Icons.control_point_outlined,
                                    color: Color(0xff3e61ed))),
                            SizedBox(width: 10),
                            Text(
                              'Projects',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "ProximaNova",
                                color: Color(0xff3e61ed),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Certification()))
                                      .then((value) => getCertification());
                                },
                                child: Icon(Icons.control_point_outlined,
                                    color: Color(0xff3e61ed))),
                            SizedBox(width: 10),
                            Text(
                              'Certifications',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "ProximaNova",
                                color: Color(0xff3e61ed),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Presentation()))
                                .then((value) => getPresentation());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.control_point_outlined,
                                  color: Color(0xff3e61ed)),
                              SizedBox(width: 10),
                              Text(
                                'Presentations',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "ProximaNova",
                                  color: Color(0xff3e61ed),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Research()))
                                .then((value) => getResearch());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.control_point_outlined,
                                  color: Color(0xff3e61ed)),
                              SizedBox(width: 10),
                              Text(
                                'Research Publication',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "ProximaNova",
                                  color: Color(0xff3e61ed),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 25),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LanguagesAdd()))
                                .then((value) => getLanguage());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.control_point_outlined,
                                  color: Color(0xff3e61ed)),
                              SizedBox(width: 10),
                              Text(
                                'Languages',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "ProximaNova",
                                  color: Color(0xff3e61ed),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
            // edited
          ),
        ),
      ),
    );
  }

  Widget presentationList(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(
              height: 5,
            ),
            itemCount: apiResponsePresentationPopulate.data.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Presentation(
                                uuid: apiResponsePresentationPopulate
                                    .data[index].candidatepresentationUuid,
                              ))).then((value) => getPresentation());
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey[500])),
                  child: Column(children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                apiResponsePresentationPopulate
                                    .data[index].candidatepresentationTitle,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  final insert = PresentationAddModel(
                                    requestType: "delete",
                                    candidatepresentationUuid:
                                        apiResponsePresentationPopulate
                                            .data[index]
                                            .candidatepresentationUuid,
                                  );

                                  final result = await apiServices
                                      .presentationAddService(insert);
                                  setState(() {
                                    getPresentation();
                                    isLoading = false;
                                  });
                                  if (result.data) {
                                    print("-----------SUCCESS------------");
                                  } else {
                                    print("-----------ERROR------------");
                                  }
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Color(0xff3e61ed),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponsePresentationPopulate
                                      .data[index].candidatepresentationWeblink,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ]),
                ),
              );
            },
          );
  }

  Widget professionallist(BuildContext context) {
    // final orientation = MediaQuery.of(context).orientation;
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _apiResponse5.data.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfessionAdd(
                          uuid: _apiResponse5.data[index].candidateexpUuid,
                        ))).then((value) => getProfessional());
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _apiResponse5.data[index].Designation,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = PostProfession(
                              requestType: "delete",
                              candidateexpUuid:
                                  _apiResponse5.data[index].candidateexpUuid);

                          final result =
                              await apiServices.professionalProfileAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.done_outlined,
                                ),
                                SizedBox(width: 7),
                                Text("Successfully Deleted"),
                              ]),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 2500),
                            ));
                            setState(() {
                              getProfessional();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(width: 7),
                                  Text("An Error Occured"),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        },
                        child:
                            const Icon(Icons.delete, color: KColors.primary)),
                  ],
                ),
                Text(
                  _apiResponse5.data[index].OrganizationName ?? "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  _apiResponse5.data[index].Salary ?? "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: _apiResponse5.data[index].StartDate,
                      style: const TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 12.5,
                      ),
                      children: [
                        TextSpan(
                          text: _apiResponse5.data[index]
                                      .candidateexpIscurrentcompany ==
                                  "1"
                              ? "Present"
                              : "to" + _apiResponse5.data[index].EndDate,
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ]),
                ),
                Text(
                  _apiResponse5.data[index].NoticePeriod ?? "",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget qualificationList(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(
              height: 5,
            ),
            itemCount: _apiResponse2.data.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QualificationAdd(
                                uuid:
                                    _apiResponse2.data[index].candidatequalUuid,
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xff3e61ed))),
                  child: Column(children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _apiResponse2.data[index].QualificationName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _apiResponse2.data[index].CourseName == ""
                                        ? _apiResponse2
                                                .data[index].getBoardName +
                                            "-" +
                                            _apiResponse2
                                                .data[index].SchoolmediumName
                                        : _apiResponse2.data[index].CourseName +
                                            "-" +
                                            _apiResponse2
                                                .data[index].StreamName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final insert = QualificationPost(
                                          requestType: "delete",
                                          candidatequalUuid: _apiResponse2
                                              .data[index].candidatequalUuid);

                                      final result = await apiServices
                                          .qualificationAdd(insert);
                                      setState(() {
                                        isLoading = false;
                                      });
                                      if (result.data) {
                                        print("-----------SUCCESS------------");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Row(children: const [
                                            Icon(
                                              Icons.done_outlined,
                                            ),
                                            SizedBox(width: 7),
                                            Text("Successfully Deleted"),
                                          ]),
                                          backgroundColor: Colors.green,
                                          duration: const Duration(
                                              milliseconds: 2500),
                                        ));
                                        setState(() {
                                          getQualification();
                                        });
                                      } else {
                                        print("-----------ERROR------------");

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Row(
                                            children: const [
                                              Icon(Icons.error),
                                              SizedBox(width: 7),
                                              Text("An Error Occured"),
                                            ],
                                          ),
                                          backgroundColor: Colors.red,
                                          duration: const Duration(
                                              milliseconds: 2500),
                                        ));
                                      }
                                    },
                                    child: Icon(Icons.delete,
                                        color: Color(0xff3e61ed)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _apiResponse2.data[index].InstituteName,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _apiResponse2
                                      .data[index].CandidatequalCompletionYear,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    // Row(
                    //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               _apiResponse2.data[index].CourseName,
                    //               overflow: TextOverflow.ellipsis,
                    //               style: const TextStyle(
                    //                 color:Colors.grey,
                    //                 fontFamily: "ProximaNova",
                    //                 // fontWeight: FontWeight.bold,
                    //                 letterSpacing: 1.5,
                    //                 fontSize: 12.0,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "${_apiResponse2.data[index].CandidatequalStartYear}",
                    //               overflow: TextOverflow.ellipsis,
                    //               style: const TextStyle(
                    //                 fontFamily: "ProximaNova",
                    //                 color:Colors.grey,
                    //                 // fontWeight: FontWeight.bold,
                    //                 letterSpacing: 1.5,
                    //                 fontSize: 12.0,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ]),
                  ]),
                ),
              );
            },
          );
  }

  Widget ItSkillGrid(BuildContext context) {
    // double cardWidth = MediaQuery.of(context).size.width / 3.3;
    // double cardHeight = MediaQuery.of(context).size.height / 3.6;
    final orientation = MediaQuery.of(context).orientation;
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _apiResponse.data.length,

      // childAspectRatio: cardWidth/cardHeight ,
      crossAxisSpacing: 5,
      mainAxisSpacing: 6,
      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItSkillAdds(
                          uuid: _apiResponse.data[index].candidateitskillUuid,
                        ))).then((value) => getItSkill());
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _apiResponse.data[index].candidateitskillName == ""
                            ? _apiResponse.data[index].itskillName
                            : _apiResponse.data[index].candidateitskillName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: ()async{
                    //     setState(() {
                    //       isLoading = true;
                    //     });
                    //     final insert = ItSkillAdd(
                    //       requestType:"delete",
                    //       candidateitskillItskillId: _apiResponse.data[index].candidateitskillItskillId,
                    //       candidateitskillCandidateId: 1,
                    //       // candidateitskillExperience: int.parse(_apiResponse.data[index].candidateitskillExperience),
                    //       candidateitskillLastused: _apiResponse.data[index].candidateitskillLastused,
                    //       candidateitskillVersion: _apiResponse.data[index].candidateitskillVersion
                    //     );
                    //     print(itSkillId);
                    //     print(itSkillId);
                    //     final result = await apiServices.itSkillDelete(insert);
                    //     setState(() {
                    //       isLoading = false;
                    //     });
                    //     // if(result.data){
                    //     //   Navigator.pop(context);
                    //     // }
                    //     // else{
                    //     //   print("error");
                    //     // }
                    //
                    //
                    //     const title = "Done";
                    //     final text = result.error
                    //         ? (result.errorMessage ?? "An Error Occurred")
                    //         : "Successfully Deleted";
                    //     showDialog(
                    //       context: context,
                    //       builder: (_) => AlertDialog(
                    //         title: const Text(title),
                    //         content: Text(text),
                    //         actions: [
                    //           ElevatedButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text("OK"))
                    //         ],
                    //       ),
                    //     ).then((data) {
                    //       if (result.data) {
                    //         Navigator.of(context).pop();
                    //
                    //       }
                    //     });
                    //   },
                    //     child: Icon(Icons.delete,color: KColors.primary)),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = ItSkillAdd(
                            requestType: "delete",
                            candidateitskillUuid:
                                _apiResponse.data[index].candidateitskillUuid,
                          );
                          print(itSkillId);
                          print(itSkillId);
                          final result =
                              await apiServices.itSkillDelete(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.done_outlined,
                                ),
                                SizedBox(width: 7),
                                Text("Successfully Deleted"),
                              ]),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 2500),
                            ));
                            setState(() {
                              getItSkill();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(width: 7),
                                  Text("An Error Occured"),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        },
                        child:
                            const Icon(Icons.delete, color: KColors.primary)),
                  ],
                ),
                Text(
                  _apiResponse.data[index].candidateitskillExperience ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 10.5,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "Last Used:",
                      style: const TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 12.5,
                      ),
                      children: [
                        TextSpan(
                          text: _apiResponse
                                  .data[index].candidateitskillLastused
                                  .toString() ??
                              "",
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                    text: "Version:",
                    style: const TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 12.5,
                    ),
                    children: [
                      TextSpan(
                        text: _apiResponse.data[index].candidateitskillVersion
                                .toString() ??
                            "",
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 14.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget LanguageGrid(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _apiResponseLang.data.length,

      // childAspectRatio: (1 / .36),
      crossAxisSpacing: 5,
      mainAxisSpacing: 6,
      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LanguagesAdd(
                          uuid: _apiResponseLang.data[index].candidatelangUuid,
                        ))).then((value) => getLanguage());
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _apiResponseLang.data[index].Language == ""
                          ? _apiResponseLang.data[index].Languagename
                          : _apiResponseLang.data[index].Language,
                      style: const TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 15.0,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: ()async{
                    //     setState(() {
                    //       isLoading = true;
                    //     });
                    //     final insert = ItSkillAdd(
                    //       requestType:"delete",
                    //       candidateitskillItskillId: _apiResponse.data[index].candidateitskillItskillId,
                    //       candidateitskillCandidateId: 1,
                    //       // candidateitskillExperience: int.parse(_apiResponse.data[index].candidateitskillExperience),
                    //       candidateitskillLastused: _apiResponse.data[index].candidateitskillLastused,
                    //       candidateitskillVersion: _apiResponse.data[index].candidateitskillVersion
                    //     );
                    //     print(itSkillId);
                    //     print(itSkillId);
                    //     final result = await apiServices.itSkillDelete(insert);
                    //     setState(() {
                    //       isLoading = false;
                    //     });
                    //     // if(result.data){
                    //     //   Navigator.pop(context);
                    //     // }
                    //     // else{
                    //     //   print("error");
                    //     // }
                    //
                    //
                    //     const title = "Done";
                    //     final text = result.error
                    //         ? (result.errorMessage ?? "An Error Occurred")
                    //         : "Successfully Deleted";
                    //     showDialog(
                    //       context: context,
                    //       builder: (_) => AlertDialog(
                    //         title: const Text(title),
                    //         content: Text(text),
                    //         actions: [
                    //           ElevatedButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text("OK"))
                    //         ],
                    //       ),
                    //     ).then((data) {
                    //       if (result.data) {
                    //         Navigator.of(context).pop();
                    //
                    //       }
                    //     });
                    //   },
                    //     child: Icon(Icons.delete,color: KColors.primary)),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = LanguagesAddModel(
                            requestType: "delete",
                            candidatelangUuid:
                                _apiResponseLang.data[index].candidatelangUuid,
                          );

                          final result = await apiServices.languagesAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.done_outlined,
                                ),
                                SizedBox(width: 7),
                                Text("Successfully Deleted"),
                              ]),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 2500),
                            ));
                            setState(() {
                              getLanguage();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(width: 7),
                                  Text("An Error Occured"),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        },
                        child:
                            const Icon(Icons.delete, color: KColors.primary)),
                  ],
                ),
                Text(
                  _apiResponseLang.data[index].ProficiencyName ?? "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 10.5,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "Ablity:",
                      style: const TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 12.5,
                      ),
                      children: [
                        TextSpan(
                          text: _apiResponseLang.data[index].Read == "1"
                              ? "Read"
                              : "",
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                        TextSpan(
                          text: _apiResponseLang.data[index].Write == "1"
                              ? " Write"
                              : "",
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                        TextSpan(
                          text: _apiResponseLang.data[index].Speak == "1"
                              ? " Speak"
                              : "",
                          style: const TextStyle(
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 14.5,
                          ),
                        ),
                      ]),
                ),

                // RichText(
                //   text: TextSpan(
                //     text: "Version:",
                //     style: const TextStyle(
                //       fontFamily: "ProximaNova",
                //       fontWeight: FontWeight.w500,
                //       letterSpacing: 1.5,
                //       fontSize: 12.5,
                //     ),
                //     children: [
                //       TextSpan(
                //         text: _apiResponse.data[index].candidateitskillVersion
                //             .toString() ??
                //             "",
                //         style: const TextStyle(
                //           fontFamily: "ProximaNova",
                //           color: Colors.grey,
                //           fontWeight: FontWeight.w500,
                //           letterSpacing: 1.5,
                //           fontSize: 14.5,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget patentGrid(BuildContext context) {
    // final orientation = MediaQuery.of(context).orientation;
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _apiResponsePatent.data.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPatents(
                          uuid: _apiResponsePatent
                              .data[index].candidatepatentUuid,
                        ))).then((value) => getPatent());
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _apiResponsePatent.data[index].candidatepatentTitle,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = AddPatent(
                            requestType: "delete",
                            candidatepatentUuid: _apiResponsePatent
                                .data[index].candidatepatentUuid,
                          );

                          final result =
                              await apiServices.patentsDelete(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.done_outlined,
                                ),
                                SizedBox(width: 7),
                                Text("Successfully Deleted"),
                              ]),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 2500),
                            ));
                            setState(() {
                              getPatent();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(width: 7),
                                  Text("An Error Occured"),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        },
                        child:
                            const Icon(Icons.delete, color: KColors.primary)),
                  ],
                ),
                Text(
                  _apiResponsePatent.data[index].candidatepatentIssuedate
                          .split(" ")[0] ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  _apiResponsePatent.data[index].candidatepatentOffice ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  _apiResponsePatent.data[index].candidatepatentDesc == ""
                      ? ""
                      : _apiResponsePatent.data[index].candidatepatentDesc,
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget projectList(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(
              height: 5,
            ),
            itemCount: apiResponseProjectPopulate.data.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Projects(
                                uuid: apiResponseProjectPopulate
                                    .data[index].candidateprojectUuid,
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey[500])),
                  child: Column(children: [
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate
                                      .data[index].candidateprojectType,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                apiResponseProjectPopulate
                                    .data[index].candidateprojectTitle,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    apiResponseProjectPopulate
                                        .data[index].candidateprojectClient,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final insert = ProjectPopulate(
                                          requestType: "delete",
                                          candidateprojectUuid:
                                              apiResponseProjectPopulate
                                                  .data[index]
                                                  .candidateprojectUuid);

                                      final result =
                                          await apiServices.projectAdd(insert);
                                      setState(() {
                                        isLoading = false;
                                      });
                                      if (result.data) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Row(children: const [
                                            Icon(
                                              Icons.done_outlined,
                                            ),
                                            SizedBox(width: 7),
                                            Text("Successfully Deleted"),
                                          ]),
                                          backgroundColor: Colors.green,
                                          duration: const Duration(
                                              milliseconds: 2500),
                                        ));
                                        setState(() {
                                          getProject();
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Row(
                                            children: const [
                                              Icon(Icons.error),
                                              SizedBox(width: 7),
                                              Text("An Error Occured"),
                                            ],
                                          ),
                                          backgroundColor: Colors.red,
                                          duration: const Duration(
                                              milliseconds: 2500),
                                        ));
                                      }
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Color(0xff3e61ed),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate
                                      .data[index].candidateprojectStatus,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                                apiResponseProjectPopulate.data[index]
                                            .candidateprojectStatus ==
                                        1
                                    ? Text(
                                        apiResponseProjectPopulate.data[index]
                                                .candidateprojectStartdate +
                                            "-" +
                                            apiResponseProjectPopulate
                                                .data[index]
                                                .candidateprojectEnddate,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: "ProximaNova",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          fontSize: 13.5,
                                        ),
                                      )
                                    : Text(
                                        apiResponseProjectPopulate.data[index]
                                            .candidateprojectStartdate,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: "ProximaNova",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          fontSize: 13.5,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  focusColor: Colors.blueGrey,
                                  onTap: () => launch(apiResponseProjectPopulate
                                      .data[index].candidateprojectWeblink),
                                  child: Text(
                                    apiResponseProjectPopulate
                                        .data[index].candidateprojectWeblink,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: "ProximaNova",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.5,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate
                                      .data[index].candidateprojectDesc,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate
                                      .data[index].projectLocation,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate
                                      .data[index].candidateprojectSite,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate.data[index]
                                      .candidateprojectEmploymenttypeId,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate
                                      .data[index].candidateprojectTeamsize,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate.data[index]
                                      .candidateprojectRoledescription,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiResponseProjectPopulate
                                      .data[index].candidateprojectSkillsused,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "ProximaNova",
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.5,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ]),
                ),
              );
            },
          );
  }

  Widget CertificationGrid(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: apiResponseCertificationPopulate.data.length,
      crossAxisSpacing: 5,
      mainAxisSpacing: 6,
      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Certification(
                          uuid: apiResponseCertificationPopulate
                              .data[index].candidatecertificationUuid,
                        ))).then((value) => getCertification());
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey.shade500)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        apiResponseCertificationPopulate
                                .data[index].candidatecertificationName ??
                            "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = CertificationPopulate(
                            requestType: "delete",
                            candidatecertificationUuid:
                                apiResponseCertificationPopulate
                                    .data[index].candidatecertificationUuid,
                          );

                          final result =
                              await apiServices.certificationAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.done_outlined,
                                ),
                                SizedBox(width: 7),
                                Text("Successfully Deleted"),
                              ]),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 2500),
                            ));
                            setState(() {
                              getCertification();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(width: 7),
                                  Text("An Error Occured"),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        },
                        child:
                            const Icon(Icons.delete, color: KColors.primary)),
                  ],
                ),
                Text(
                  apiResponseCertificationPopulate
                          .data[index].candidatecertificationCertificationid ??
                      "",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 10.5,
                  ),
                ),
                InkWell(
                  focusColor: Colors.blueGrey,
                  onTap: () => launch(apiResponseCertificationPopulate
                      .data[index].candidatecertificationWeblink),
                  child: Text(
                    apiResponseCertificationPopulate
                            .data[index].candidatecertificationWeblink ??
                        "",
                    style: const TextStyle(
                      fontFamily: "ProximaNova",
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 10.5,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "Issued By:",
                      style: const TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        fontSize: 12.5,
                      ),
                      children: [
                        TextSpan(
                          text: apiResponseCertificationPopulate
                                  .data[index].candidatecertificationIssuedby ??
                              "",

                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "ProximaNova",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: 13,
                          ),
                        ),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                    text: "Issued Date:",
                    style: const TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 12.5,
                    ),
                    children: [
                      TextSpan(
                        text: apiResponseCertificationPopulate
                                .data[index].candidatecertificationIssuedate
                                .toString()
                                .split(" ")[0] ??
                            "",
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Validity:",
                    style: const TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 12.5,
                    ),
                    children: [
                      TextSpan(
                        text: apiResponseCertificationPopulate
                                .data[index].candidatecertificationExpirydate
                                .toString()
                                .split(" ")[0] ??
                            "",
                        style: const TextStyle(
                          fontFamily: "ProximaNova",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget awardsList(BuildContext context) {
    // final orientation = MediaQuery.of(context).orientation;
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _apiResponseAwards.data.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAwards(
                          uuid:
                              _apiResponseAwards.data[index].candidateawardUuid,
                        ))).then((value) => getAwards());
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _apiResponseAwards.data[index].candidateawardTitle,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = Awards(
                            requestType: "delete",
                            candidateawardUuid: _apiResponseAwards
                                .data[index].candidateawardUuid,
                          );

                          final result = await apiServices.awardsAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.done_outlined,
                                ),
                                SizedBox(width: 7),
                                Text("Successfully Deleted"),
                              ]),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 2500),
                            ));
                            setState(() {
                              getAwards();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(width: 7),
                                  Text("An Error Occured"),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        },
                        child:
                            const Icon(Icons.delete, color: KColors.primary)),
                  ],
                ),
                Text(
                  _apiResponseAwards.data[index].candidateawardDate ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  _apiResponseAwards.data[index].candidateawardDesc ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget researchList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: 5,
      ),
      itemCount: apiResponseResearchPopulate.data.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Research(
                          uuid: apiResponseResearchPopulate
                              .data[index].candidatepaperUuid,
                        ))).then((value) => getResearch());
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xff3e61ed))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apiResponseResearchPopulate
                                .data[index].candidatepaperTitle,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final insert = ResearchpaperAdd(
                            requestType: "delete",
                            candidatepaperUuid: apiResponseResearchPopulate
                                .data[index].candidatepaperUuid,
                          );

                          final result =
                              await apiServices.researchpaperAdd(insert);
                          setState(() {
                            isLoading = false;
                          });
                          if (result.data) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(children: const [
                                Icon(
                                  Icons.done_outlined,
                                ),
                                SizedBox(width: 7),
                                Text("Successfully Deleted"),
                              ]),
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 2500),
                            ));
                            setState(() {
                              getResearch();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(width: 7),
                                  Text("An Error Occured"),
                                ],
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(milliseconds: 2500),
                            ));
                          }
                        },
                        child:
                            const Icon(Icons.delete, color: KColors.primary)),
                  ],
                ),
                Text(
                  apiResponseResearchPopulate
                          .data[index].candidatepaperWeblink ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  apiResponseResearchPopulate.data[index].candidatepaperDesc ??
                      "2 years",
                  style: const TextStyle(
                    fontFamily: "ProximaNova",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up the Controllers when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}
