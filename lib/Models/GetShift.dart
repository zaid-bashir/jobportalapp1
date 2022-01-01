class PreferredShift{
  String  shiftId;
  String  shiftName;

  PreferredShift({this.shiftName,this.shiftId});

  factory PreferredShift.fromJson(Map<String,dynamic> item){
    return PreferredShift(
        shiftId: item["shiftId"],
        shiftName: item["shiftName"]
    );
  }
}