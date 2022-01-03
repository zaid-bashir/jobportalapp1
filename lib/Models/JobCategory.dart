class JobCategory{
  String roleCategoryId;
  String roleCategoryName;

  JobCategory({this.roleCategoryId,this.roleCategoryName});

  factory JobCategory.fromJson(Map<String,dynamic> item){
    return JobCategory(
      roleCategoryId: item["roleCategoryId"],
      roleCategoryName: item["roleCategoryName"],
    );
  }
}