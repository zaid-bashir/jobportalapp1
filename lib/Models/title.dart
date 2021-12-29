class TitleModel  {
  int titleId;
  String titleName;

  TitleModel ({
   this.titleId,
   this.titleName,
});

  factory TitleModel.fromJson(Map<String, dynamic> item) {
    return TitleModel(
        titleId: item["titleId"], titleName: item["titleName"]);
  }


}