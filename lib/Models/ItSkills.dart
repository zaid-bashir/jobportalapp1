class ITSkill {
  String itskillId;
  String itskillName;

// changes
  ITSkill({
    this.itskillId,
    this.itskillName,
  });

  factory ITSkill.fromJson(Map<String, dynamic> item) {
    return ITSkill(
      itskillId: item["itskillId"],
      itskillName: item["itskillName"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "itskillId": itskillId,
      "itskillName": itskillName,
    };
  }
}
