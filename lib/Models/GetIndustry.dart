

class Industry{
  String industryId;
  String industryName;

  Industry({this.industryId,this.industryName,});

  factory Industry.fromJson(Map<String,dynamic> item){
    return Industry(
        industryId: item["industryId"],
        industryName: item["industryName"]
    );
  }
}
