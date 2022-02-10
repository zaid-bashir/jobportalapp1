class Languages{
 String languageId;
 String languageName;


 Languages({this.languageId,this.languageName});

 factory Languages.fromJson(Map<String, dynamic>item){
   return Languages(
     languageId: item["languageId"],
     languageName: item["languageName"],
   );
 }
}