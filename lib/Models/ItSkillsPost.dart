class PostItSkills {
  int Id;
  String version;
  String year;
  String month;
  int lastId;

  PostItSkills({this.Id, this.version, this.year, this.month, this.lastId});

  Map<String, dynamic> toJson() {
    return {
      "Id": Id,
      "version": version,
      "year": year,
      "month": month,
      "lastId": lastId
    };
  }
}
