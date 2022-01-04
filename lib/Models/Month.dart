class Month{
  String  monthId;
  String  monthName;

  Month({this.monthId,this.monthName});

  factory Month.fromJson(Map<String,dynamic> item){
    return Month(
        monthId: item["monthId"],
        monthName: item["monthName"]
    );
  }
}